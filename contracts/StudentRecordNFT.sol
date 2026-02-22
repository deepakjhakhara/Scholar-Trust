// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract StudentRecordNFT is ERC721, AccessControl {
    bytes32 public constant ISSUER_ROLE = keccak256("ISSUER_ROLE");

    enum CredentialType {
        CourseCompletion,
        CompetitionAward,
        ProjectValidation
    }

    struct Credential {
        address issuer;
        address recipient;
        CredentialType ctype;
        string title;
        string institution;
        uint64 issueDate;
        uint64 expiryDate;
        bytes32 credentialHash;
        bool revoked;
        string ipfsURI;
        string revocationReason;
    }

    uint256 private _nextTokenId;
    mapping(uint256 => Credential) private _credentials;

    event CredentialIssued(
        uint256 indexed tokenId,
        address indexed recipient,
        address indexed issuer,
        CredentialType ctype,
        string title,
        uint64 issueDate
    );

    event CredentialRevoked(
        uint256 indexed tokenId,
        address indexed revokedBy,
        string reason,
        uint64 revokedAt
    );

    constructor() ERC721("Scholar Trust Student Records", "STSR") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(ISSUER_ROLE, msg.sender);
    }

    function issueCredential(
        address to,
        uint8 credentialType,
        string memory title,
        string memory institution,
        uint64 expiryDate,
        bytes32 credentialHash,
        string memory ipfsURI
    ) external onlyRole(ISSUER_ROLE) returns (uint256 tokenId) {
        require(to != address(0), "Invalid recipient");
        require(credentialType <= uint8(CredentialType.ProjectValidation), "Invalid credential type");

        tokenId = _nextTokenId;
        _nextTokenId++;

        _safeMint(to, tokenId);

        _credentials[tokenId] = Credential({
            issuer: msg.sender,
            recipient: to,
            ctype: CredentialType(credentialType),
            title: title,
            institution: institution,
            issueDate: uint64(block.timestamp),
            expiryDate: expiryDate,
            credentialHash: credentialHash,
            revoked: false,
            ipfsURI: ipfsURI,
            revocationReason: ""
        });

        emit CredentialIssued(tokenId, to, msg.sender, CredentialType(credentialType), title, uint64(block.timestamp));
    }

    function revokeCredential(uint256 tokenId, string memory reason) external onlyRole(ISSUER_ROLE) {
        require(_ownerOf(tokenId) != address(0), "Credential does not exist");
        require(!_credentials[tokenId].revoked, "Credential already revoked");

        _credentials[tokenId].revoked = true;
        _credentials[tokenId].revocationReason = reason;

        emit CredentialRevoked(tokenId, msg.sender, reason, uint64(block.timestamp));
    }

    function isValid(uint256 tokenId) external view returns (bool) {
        require(_ownerOf(tokenId) != address(0), "Credential does not exist");

        Credential memory c = _credentials[tokenId];
        if (c.revoked) return false;
        if (c.expiryDate != 0 && c.expiryDate < block.timestamp) return false;

        return true;
    }

    function getCredential(uint256 tokenId) external view returns (Credential memory) {
        require(_ownerOf(tokenId) != address(0), "Credential does not exist");
        return _credentials[tokenId];
    }

    function totalCredentials() external view returns (uint256) {
        return _nextTokenId;
    }

    function isIssuer(address account) external view returns (bool) {
        return hasRole(ISSUER_ROLE, account);
    }

    function grantIssuerRole(address account) external onlyRole(DEFAULT_ADMIN_ROLE) {
        grantRole(ISSUER_ROLE, account);
    }
}

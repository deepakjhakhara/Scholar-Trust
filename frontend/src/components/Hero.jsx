import React from 'react';
import '../styles/Hero.css';

const Hero = () => {
  return (
    <section className="hero">
      <div className="hero-content">
        <h1 className="hero-title">
          Decentralised System For Student Records
        </h1>
        <p className="hero-subtitle">
          Secure, tamper-resistant student records with decentralized ownership and trustless verification.
        </p>
        <div className="hero-buttons">
          <button className="btn-primary">For Institutions</button>
          <button className="btn-secondary">For Students</button>
        </div>
      </div>
    </section>
  );
};

export default Hero;

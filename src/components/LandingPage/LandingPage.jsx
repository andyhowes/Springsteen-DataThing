import React, { useState } from 'react';
import { useHistory } from 'react-router-dom';
import './LandingPage.css';
import SongList from '../SongList/SongList';

// CUSTOM COMPONENTS
import RegisterForm from '../RegisterForm/RegisterForm';

function LandingPage() {
  const [heading, setHeading] = useState('Welcome');
  const history = useHistory();

  const onLogin = (event) => {
    history.push('/login');
  };

  return (
    <div className="container">
      <h1 className="CapitalizedFranklin">SPRINGSTEEN</h1>
      <img src="/images/20190923-Bruce-Springsteen-03.jpg.webp" id="bruceMain"></img>
      <div className="grid">
        <div className="grid-col grid-col_8">
        <SongList />
        </div>

      </div>
    </div>
  );
}

export default LandingPage;

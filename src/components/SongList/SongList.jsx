import React, { useState } from 'react';
import { useHistory } from 'react-router-dom';
import './SongList.css';

// CUSTOM COMPONENTS
import RegisterForm from '../RegisterForm/RegisterForm';

function SongList() {
  const [songs, setSongs] = useState('Songs');
  const history = useHistory();

  const onLogin = (event) => {
    history.push('/login');
  };

  return (
    <div className="container">
      <h1 className="lyricsCap">LYRICS</h1>
      <div className="grid">
        <ul>
          <li></li>
          <li></li>
          <li></li>
        </ul>
      </div>
    </div>
  );
}

export default SongList;

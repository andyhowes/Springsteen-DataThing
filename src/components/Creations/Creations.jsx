import React, { useState, useEffect } from 'react';
import { useHistory } from 'react-router-dom';
import {useDispatch, useSelector} from 'react-redux';
import './Creations.css';

// CUSTOM COMPONENTS
import RegisterForm from '../RegisterForm/RegisterForm';

function Creations() {
  const dispatch = useDispatch();
  const creationsStore = useSelector(store => store.creations);
  const userStore = useSelector(store => store.user);
  const history = useHistory();

  useEffect(() => {
    dispatch({type: 'FETCH_USER_SONGS'});
}, []);

const goToUserSong = (id) =>{
  history.push(`/usersong/${id}`);
}

  return (
    <div className="container">
      <div id="lyricsBox">
        <h1 className="lyricsCap">USER SONGS</h1>
        <ul id="lyricsList">
          {creationsStore.map(song => {
            return (
              <li className="userSongSingle" key={(song.content_id)} onClick={()=>goToUserSong(song.content_id)}>{song.title}</li>
            )
          })}
        </ul>
      </div>
    </div>
  );
}

export default Creations;

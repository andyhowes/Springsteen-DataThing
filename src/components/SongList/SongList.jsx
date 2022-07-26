import React, { useState, useEffect } from 'react';
import { useHistory } from 'react-router-dom';
import {useDispatch, useSelector} from 'react-redux';
import './SongList.css';

// CUSTOM COMPONENTS
import RegisterForm from '../RegisterForm/RegisterForm';

function SongList() {
  const [songs, setSongs] = useState('Songs');
  const dispatch = useDispatch();
  const songsStore = useSelector(store => store.songs);
  const history = useHistory();

  useEffect(() => {
    dispatch({type: 'FETCH_SONGS'});
  }, []);

  const goToDetails = (id) =>{
    history.push(`/Details/${id}`);
  }

  const onLogin = (event) => {
    history.push('/login');
  };

  return (
    <div className="container">
      <h1 className="lyricsCap">SONGS</h1>
      <div id="lyricsBox">
        <ul id="lyricsList">
          {songs.map(song => {
            return (
              <section id="songsMap">
              <div key={songs.song_id} onClick={()=>goToDetails(songs.id)}></div>
              <h3>songs.song_name</h3>
              </section>
            )
          })}
        </ul>
      </div>
    </div>
  );
}

export default SongList;

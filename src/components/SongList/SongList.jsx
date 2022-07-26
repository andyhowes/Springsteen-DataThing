import React, { useState, useEffect } from 'react';
import { useHistory } from 'react-router-dom';
import {useDispatch, useSelector} from 'react-redux';
import './SongList.css';

// CUSTOM COMPONENTS
import RegisterForm from '../RegisterForm/RegisterForm';

function SongList(props) {
  // const [songs, setSongs] = useState('Songs');   //I don't think this is in play
  const dispatch = useDispatch();
  const songsStore = useSelector(store => store.songs);
  const history = useHistory();

  useEffect(() => {
    dispatch({type: 'SET_SONGS'});
  }, []);

  const goToDetails = (id) =>{
    history.push(`/Details/${id}`);
  }

  return (
    <div className="container">
      <h1 className="lyricsCap">SONGS</h1>
      <div id="lyricsBox">
        <ul id="lyricsList">
          {songsStore.map(song => {
            return (
              <section id="songsMap">
              <div key={songsStore.song_id} onClick={()=>goToDetails(songsStore.id)}>{songsStore.song_name}</div>
              <h3>songsStore.song_name</h3>
              </section>
            )
          })}
        </ul>
      </div>
    </div>
  );
}

export default SongList;

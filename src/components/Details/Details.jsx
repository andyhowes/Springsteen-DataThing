import React, { useState, useEffect } from 'react';
import { useHistory, useParams } from 'react-router-dom';
import {useDispatch, useSelector} from 'react-redux';
import './Details.css';

// CUSTOM COMPONENTS
import RegisterForm from '../RegisterForm/RegisterForm';

function Details(props) {

  const dispatch = useDispatch();
  const songsStore = useSelector(store => store.songs);
  console.log('songstore', songsStore);
  const history = useHistory();

  useEffect(() => {
    dispatch({type: 'FETCH_ONE_SONG'});
  }, []);

  const {id} = useParams();
  const song = songsStore[id];
  const goToSongs = () =>{
    history.push(`/SongsList`);
  }

  return (
    <div className="container">
      <h1 className="songCap">{song.song_name}</h1>
      <div id="songBox">
        <h4 className="songLyrics" key={(song.song_id.toString())} onClick={console.log('beep')}>{song.song_lyrics}</h4>
      </div>
    </div>
  )
}

export default Details;

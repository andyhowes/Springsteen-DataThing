import React, { useState, useEffect } from 'react';
import { useHistory, useParams } from 'react-router-dom';
import {useDispatch, useSelector} from 'react-redux';
import './Details.css';

// CUSTOM COMPONENTS
import RegisterForm from '../RegisterForm/RegisterForm';

function Details(props) {

  const dispatch = useDispatch();
  const oneSongStore = useSelector(store => store.oneSong);
  console.log('songstore', oneSongStore);
  const history = useHistory();

  useEffect(() => {
    dispatch({type: 'FETCH_ONE_SONG'});
  }, []);

  const {id} = useParams();
  console.log(id);
  const song = oneSongStore[(id - 1)];

  const goToSongs = () =>{
    history.push(`/`);
  }

  return (
    <div className="container">
      {oneSongStore.length === 0 ? (<p>...loading...</p>) :
      (<section><h1 className="songCap">{song.song_name}</h1>
      <div id="songBox">
        <h4 className="songLyrics" key={(song.song_id.toString())} onClick={console.log('beep')}>{song.song_lyrics}</h4>
      <button id="backButton" onClick={goToSongs}>Back</button>
      </div>

      </section>)
      }
    </div>
  )
}

export default Details;

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
    dispatch({type: 'FETCH_ONE_SONG', payload: id });
  }, []);

  const {id} = useParams();
  console.log(id);
  const song = oneSongStore[(id - 1)];

  let lineBrokenSong = (song.song_lyrics).split('<<<<>>>><<<<>>>>').join('\n\n').split('<<<<>>>>').join('\n');
  console.log('LBS', lineBrokenSong)
  const goToSongs = () =>{
    history.push(`/`);
  }

  return (
    <div className="container">
      {oneSongStore.length === 0 ? (<p>...loading...</p>) :
      (<section><h1 className="songCap">{song.song_name}</h1>
      <div id="songBox">
        <pre className="songLyrics" key={(song.song_id.toString())} onClick={console.log('beep')}>{lineBrokenSong}</pre>
      <button id="backButton" onClick={goToSongs}>Back</button>
      </div>

      </section>)
      }
    </div>
  )
}

export default Details;

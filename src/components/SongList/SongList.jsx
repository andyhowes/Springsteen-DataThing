import React, { useState, useEffect } from 'react';
import { useHistory } from 'react-router-dom';
import {useDispatch, useSelector} from 'react-redux';
import './SongList.css';

// CUSTOM COMPONENTS
import RegisterForm from '../RegisterForm/RegisterForm';

function SongList() {
  //const [songs, setSongs] = useState('Songs');   //I don't think this is in play
  const dispatch = useDispatch();
  const songsStore = useSelector(store => store.songs);
  const history = useHistory();

  useEffect(() => {
    dispatch({type: 'FETCH_SONGS'});
  }, []);

  const goToDetails = (id) =>{
    history.push(`/details/${id}`);
  }

  return (
    <div className="container">
      <h1 className="lyricsCap">SONGS</h1>
      <div id="lyricsBox">
        <ul id="lyricsList">
          {songsStore.map(song => {

            return (
              <li className="songSingle" key={(song.song_id).toString()} onClick={()=>goToDetails(song.song_id)}>{song.song_name}</li>
            )
          })}
        </ul>
      </div>
    </div>
  );
}

export default SongList;

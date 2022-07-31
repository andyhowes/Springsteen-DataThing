import React, { useState, useEffect } from 'react';
import { useHistory } from 'react-router-dom';
import {useDispatch, useSelector} from 'react-redux';
import './SavedLines.css';

// CUSTOM COMPONENTS
import RegisterForm from '../RegisterForm/RegisterForm';

function SavedLines() {
  //const [songs, setSongs] = useState('Songs');   //I don't think this is in play
  const dispatch = useDispatch();
  const linesStore = useSelector(store => store.savedLines);
  const userStore = useSelector(store => store.user);
  const history = useHistory();

  useEffect(() => {
    dispatch({type: 'FETCH_SAVED_LINES'});
  }, []);

  const deleteLine = (userID, lineID) =>{
    let newLine = {
      user_id: userID,
      fragment_id: lineID
    }
    console.log('sent request to delete line:', deleteLine);
    dispatch({type: 'TRIGGER_DELETE_LINE', payload: deleteLine});
  }

  return (
    <div className="container">
      <h1 className="linesCap">SAVED LINES</h1>
      {linesStore.length === 0 || userStore.length === 0? (<p>...Loading...</p>) : (
      <section><div id="linesBox">
        <table id="lineList">
          <thead>
            <tr>
              <th id="albumHeader">Album</th>
              <th id="songHeader">Song</th>
              <th>Lyric</th>
              <th>Rhyme</th>
              <th>Delete</th>
            </tr>
          </thead>
          {linesStore.map(line => {

            return (
              <tbody><tr className="lineSingle" key={(line.fragment_id)}><td>{line.album_name}</td><td>{line.song_name}</td><td>{line.fragment_text}</td><td>{line.rhyme}</td><td><button className="deleteButton" onClick={()=>{deleteLine(userStore.id, line.fragment_id)}}>⊖</button></td></tr></tbody>
            )
          })}
        </table>
      </div></section>)}
    </div>
  );
}

export default SavedLines;

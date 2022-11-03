import React, { useState, useEffect } from 'react';
import { useHistory } from 'react-router-dom';
import {useDispatch, useSelector} from 'react-redux';
import './LinesList.css';

// CUSTOM COMPONENTS
import RegisterForm from '../RegisterForm/RegisterForm';

function LinesList() {
  const dispatch = useDispatch();
  const linesStore = useSelector(store => store.linesList);
  const userStore = useSelector(store => store.user);
  const history = useHistory();

  useEffect(() => {
    dispatch({type: 'FETCH_LINES'});
  }, []);

  const addLine = (userID, lineID) =>{
    let newLine = {
      user_id: userID,
      fragment_id: lineID
    }
    console.log('sent this add line content to saga:', newLine);
    dispatch({type: 'TRIGGER_ADD_LINE', payload: newLine});
  }

  return (
    <div className="container">
      <h1 className="linesCap">LINES</h1>
      {linesStore.length === 0 || userStore.length === 0? (<p>...Loading...</p>) : (
      <section><div id="linesBox">
        <table id="linesList">
          <thead>
            <tr>
              <th id="albumHeader">Album</th>
              <th id="songHeader">Song</th>
              <th id="lyricHeader">Lyric</th>
              <th>Rhyme</th>
              <th>Add</th>
            </tr>
          </thead>
          {linesStore.map(line => {

            return (
              <tbody key={(line.fragment_id)}><tr className="lineSingle" ><td>{line.album_name}</td><td>{line.song_name}</td><td>{line.fragment_text}</td><td>{line.rhyme}</td><td><button className="addButton" onClick={()=>{addLine(userStore.id, line.fragment_id)}}>⨁</button></td></tr></tbody>
            )
          })}
        </table>
      </div></section>)}
    </div>
  );
}

export default LinesList;

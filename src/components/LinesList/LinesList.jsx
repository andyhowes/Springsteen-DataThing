import React, { useState, useEffect } from 'react';
import { useHistory } from 'react-router-dom';
import {useDispatch, useSelector} from 'react-redux';
import './LinesList.css';

// CUSTOM COMPONENTS
import RegisterForm from '../RegisterForm/RegisterForm';

function LinesList() {
  //const [songs, setSongs] = useState('Songs');   //I don't think this is in play
  const dispatch = useDispatch();
  const linesStore = useSelector(store => store.linesList);
  const history = useHistory();

  useEffect(() => {
    dispatch({type: 'FETCH_LINES'});
  }, []);

  const addLine = (id) =>{
    console.log('beep trying to add favorite line');
  }

  return (
    <div className="container">
      <h1 className="linesCap">LINES</h1>
      {linesStore.length === 0 ? (<p>...Loading...</p>) : (
      <section><div id="linesBox">
        <table id="lineList">
        <tr>
          <th id="albumHeader">Album</th>
          <th id="songHeader">Song</th>
          <th>Lyric</th>
          <th>Add to Faves</th>
        </tr>
          {linesStore.map(line => {

            return (
              <tr className="lineSingle" key={(line.fragment_id).toString()}><td> {line.album_name}</td> <td>{line.song_name}</td> <td>{line.fragment_text}</td><td><button className="addButton" onClick={()=>{addLine(line.fragment_id)}}>⨁</button></td></tr>
            )
          })}
        </table>
      </div></section>)}
    </div>
  );
}

export default LinesList;

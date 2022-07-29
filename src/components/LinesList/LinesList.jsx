import React, { useState, useEffect } from 'react';
import { useHistory } from 'react-router-dom';
import {useDispatch, useSelector} from 'react-redux';
import './LinesList.css';

// CUSTOM COMPONENTS
import RegisterForm from '../RegisterForm/RegisterForm';

function LinesList() {
  //const [songs, setSongs] = useState('Songs');   //I don't think this is in play
  const dispatch = useDispatch();
  const linesStore = useSelector(store => store.lyrics_fragments);
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
      <div id="linesBox">
        <ul id="lineList">
          {linesStore.map(line => {

            return (
              <li className="songSingle" key={(line.fragment_id).toString()} onClick={()=>addLine(line.fragment_id)}>{line.fragment_text}</li>
            )
          })}
        </ul>
      </div>
    </div>
  );
}

export default LinesList;

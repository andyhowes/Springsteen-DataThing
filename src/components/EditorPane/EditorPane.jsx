import React, { useState, useEffect } from 'react';
import { useHistory } from 'react-router-dom';
import {useDispatch, useSelector} from 'react-redux';
import './EditorPane.css';

// CUSTOM COMPONENTS
import RegisterForm from '../RegisterForm/RegisterForm';

function EditorPane() {

  const [title, setTitle] = useState('');

  const dispatch = useDispatch();
  const linesStore = useSelector(store => store.savedLines);
  const userStore = useSelector(store => store.user);
  const history = useHistory();

  console.log('store', useSelector(store => store));

  const userID = userStore.id;

  useEffect(() => {
    setTimeout(() => {
      dispatch({type: 'FETCH_CREATION', userID});    //, payload: userStore['id']
    }, 3000)
  }, []);

  const deleteLine = (userID, lineID) =>{
    let lineToDelete = {
      user_id: userID,
      fragment_id: lineID
    }
    console.log('sent request to delete line:', lineToDelete);
    dispatch({type: 'TRIGGER_DELETE_CREATION', payload: lineToDelete});
  }

  const setNewTitle = event => {
    setTitle(event.target.value);
  }

  return (
    <div id="savedLinesBox">
      <h1 className="linesCap">EDITOR</h1>
      {linesStore.length === 0 || userStore.length === 0? (<p>...Loading...</p>) : (
      <section><div id="linesBox">

        <input id="titleInput" onChange={setNewTitle} placeholder="Song Title"></input>

        <table id="lineList">
          <thead>
            <tr>
              <th>Lyric</th>
              <th>Delete</th>
            </tr>
          </thead>
          {linesStore.map(line => {

            return (
              <tbody><tr className="lineSingle" key={(line.fragment_id)}><td>{line.fragment_text}</td><td><button className="deleteButton" onClick={()=>{deleteLine(userStore.id, line.fragment_id)}}>⊖</button></td></tr></tbody>
            )
          })}
        </table>
      </div></section>)}
    </div>
  );
}

export default EditorPane;

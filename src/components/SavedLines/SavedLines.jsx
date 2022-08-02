import React, { useState, useEffect } from 'react';
import { useHistory } from 'react-router-dom';
import {useDispatch, useSelector} from 'react-redux';
import {DragDropContext, Droppable, Draggable} from 'react-beautiful-dnd';
import './SavedLines.css';

// CUSTOM COMPONENTS
import RegisterForm from '../RegisterForm/RegisterForm';

function SavedLines() {
  //const [songs, setSongs] = useState('Songs');   //I don't think this is in play
  const dispatch = useDispatch();
  const linesStore = useSelector(store => store.savedLines);
  const userStore = useSelector(store => store.user);
  const history = useHistory();

  console.log('store', useSelector(store => store));

  const userID = userStore.id;

  useEffect(() => {
    setTimeout(() => {
      dispatch({type: 'FETCH_SAVED_LINES', userID});    //, payload: userStore['id']
    }, 1000)
  }, []);

  const deleteLine = (line_id) =>{
    let lineToDelete = line_id;
    console.log('checking id in deleteLine', line_id);
    console.log('sent request to delete line:', lineToDelete);
    dispatch({type: 'TRIGGER_DELETE_LINE', payload: lineToDelete});
  }

  return (
    <div id="savedLinesBox">
      <h1 className="linesCap">SAVED LINES</h1>
      {linesStore.length === 0 || userStore.length === 0? (<p>...Loading...</p>) : (
      <section><div id="linesBox">
        <table id="lineList">
          <thead>
            <tr>
              <th>Lyric</th>
              <th>Rhyme</th>
              <th>Delete</th>
            </tr>
          </thead>
          {linesStore.map(line => {

            return (
              <tbody><tr className="lineSingle" key={(line.id)}><td>{line.fragment_text}</td><td>{line.rhyme}</td><td><button className="deleteButton" onClick={()=>{deleteLine(line.saved_id)}}>⊖</button></td></tr></tbody>
            )
          })}
        </table>
      </div></section>)}
    </div>
  );
}

export default SavedLines;
import React, { useState, useEffect } from 'react';
import { useHistory } from 'react-router-dom';
import {useDispatch, useSelector} from 'react-redux';
import {DragDropContext, Droppable, Draggable} from 'react-beautiful-dnd';
import './CreationList.css';

// CUSTOM COMPONENTS
import RegisterForm from '../RegisterForm/RegisterForm';

function CreationPane() {

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

  onDragEnd = result => {

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
        <DragDropContext onDragEnd={this.onDragEnd}>
          <Droppable droppableId={this.props.column.id}>
          {(provided, snapshot) => (
                    <div
                        {...provided.droppableProps}
                        ref={provided.innerRef}
                    >
            <ul id="lineList">
              {linesStore.map((line, index) => {
                let lineKey = line.fragment_id + 'b';
                return (
                  <Draggable draggableId={lineKey} index={index}>{(provided, snapshot) => (<div ref={provided.innerRef}{...provided.draggableProps}{...provided.dragHandleProps}><li>{line.fragment_text}<button className="deleteButton" onClick={()=>{deleteLine(userStore.id, line.fragment_id)}}>⊖</button></li></div>)}</Draggable>
                )
              })}
            </table>
          </Droppable>
        </DragDropContext>
      </div></section>)}
    </div>
  );
}

export default CreationPane;

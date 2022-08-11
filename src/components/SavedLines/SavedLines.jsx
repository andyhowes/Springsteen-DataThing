import React, { useState, useEffect } from 'react';
import { useHistory } from 'react-router-dom';
import {useDispatch, useSelector} from 'react-redux';
import {DragDropContext, Droppable, Draggable} from 'react-beautiful-dnd';
import './SavedLines.css';

// CUSTOM COMPONENTS
import RegisterForm from '../RegisterForm/RegisterForm';

function SavedLines(props) {
  //const [songs, setSongs] = useState('Songs');   //I don't think this is in play
  const [savedLines, updateSavedLines] = useState('');
  const [items, setItems] = useState('');

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

  function handleOnDragEnd(result) {
    const items = Array.from(linesStore);
    const [reorderedItem] = items.splice(result.source.index, 1);
    items.splice(result.destination.index, 0, reorderedItem);
    console.log('in handleDragEnd:', result);

    updateSavedLines(items);
  }

  const deleteLine = (line_id) =>{
    let lineToDelete = line_id;

    console.log('checking id in deleteLine', line_id);
    console.log('sent request to delete line:', lineToDelete);
    dispatch({type: 'TRIGGER_DELETE_LINE', payload: lineToDelete});
  }

  return (
    <div id="savedLinesBox">

      {linesStore.length === 0 || userStore.length === 0? (<p>...Loading...</p>) : (
      <section><div id="linesBox">
        <h1 className="linesCap">SAVED LINES</h1>
        <DragDropContext onDragEnd={handleOnDragEnd}>
          <Droppable droppableId="droppableIdForSavedLinesList">
            {(provided) => (
              <ul id="lineList" {...provided.droppableProps} ref={provided.innerRef}>
                {linesStore.map((line, index) => {
                  let savedLineKey = line.saved_id + 'a';
                  return (
                    <Draggable key={savedLineKey} draggableId={savedLineKey} index={index}>
                    {(provided) =>
                    (<div ref={provided.innerRef} {...provided.draggableProps} {...provided.dragHandleProps}>
                    <li><button className="deleteButton" onClick={()=>{deleteLine(line.saved_id)}}>⊖</button>
                    {line.fragment_text}</li></div>)}</Draggable>
                  )
                })}
              </ul>
            )}
          </Droppable>
        </DragDropContext>
      </div></section>)}
    </div>
  );
}

export default SavedLines;
import React, { useState, useEffect } from 'react';
import { useHistory } from 'react-router-dom';
import {useDispatch, useSelector} from 'react-redux';
import {DragDropContext, Droppable, Draggable} from 'react-beautiful-dnd';
import './SavedLines.css';

// CUSTOM COMPONENTS
import RegisterForm from '../RegisterForm/RegisterForm';

function SavedLines(props) {
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

  const arrayForLines = Array.from(linesStore);

  const [lines, updateLines] = useState(arrayForLines);

  function handleOnDragEnd(result) {
    const items = lines;
    const [reorderedItem] = items.splice(result.source.index, 1);
    items.splice(result.destination.index, 0, reorderedItem);
    console.log('in handleDragEnd:', result);

    updateLines(items);
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
                {lines.map((line, index) => {
                  let savedLineKey = index + 'a';
                  return (
                    <Draggable key={savedLineKey} draggableId={savedLineKey} index={index}>
                    {(provided) =>
                    (<div key={index + 'div'} ref={provided.innerRef} {...provided.draggableProps} {...provided.dragHandleProps}>
                    <li key={index +'li'}><button className="deleteButton" onClick={()=>{deleteLine(line.saved_id)}}>⊖</button>
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
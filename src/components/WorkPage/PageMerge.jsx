import React, { useState, useEffect } from 'react';
import { useHistory } from 'react-router-dom';
import {useDispatch, useSelector} from 'react-redux';
import {DragDropContext, Droppable, Draggable} from 'react-beautiful-dnd';
import './SavedLines.css';

// CUSTOM COMPONENTS
import RegisterForm from '../RegisterForm/RegisterForm';

function Behemoth(props) {
  const [savedLines, updateSavedLines] = useState('');
  const [items, setItems] = useState('');
  const [title, setTitle] = useState('');
  //const [items, setItems] = useState('');
  const [lyrics, updateLyrics] = useState('');
  const [save, setSave] = useState('');

  const dispatch = useDispatch();
  const linesStore = useSelector(store => store.savedLines);
  const userStore = useSelector(store => store.user);
  const editorStore = useSelector(store => store.editor);
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
  const deleteCreationLine = (id) =>{
    let lineToDelete = id;
    console.log('sent request to delete line:', lineToDelete);
    dispatch({type: 'TRIGGER_DELETE_CREATION', payload: lineToDelete});
  }
  const setNewTitle = event => {
    setTitle(event.target.value);
  }
  const setSaveSlot = event => {
    setSave(event.target.value);
  }
  const addTitle = () => {
     let newTitle = title;
  }
  const submitCreation = () => {
    let newCreation = {
      content_id: save,
      user_id: userID,
    }
    console.log('Creation submitted in Editor', newCreation);
    dispatch({type: 'ADD_CREATION', payload: newCreation});
  }
  return (
    <div id="savedLinesBox">
      <h1 className="linesCap">SAVED LINES</h1>
      {linesStore.length === 0 || userStore.length === 0? (<p>...Loading...</p>) : (
      <section><div id="linesBox">
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
      <h1 className="linesCap">EDITOR</h1>
      {editorStore.length === 0 || userStore.length === 0? (<p>...Loading...</p>) : (
      <section id="savedCreationBox"><div>
        <h3>{title}</h3>
        <DragDropContext onDragEnd={handleOnDragEnd}>
          <Droppable droppableId="droppableIdForEditorList">
          {(provided) => (
            <ul id="lineList" {...provided.droppableProps} ref={provided.innerRef}>
              {editorStore.map((line, index) => {
                let lineKey = line.line_id + 'b';
                return (
                  <Draggable key={lineKey} draggableId={lineKey} index={index}>{(provided) =>
                  (<div ref={provided.innerRef} {...provided.draggableProps}{...provided.dragHandleProps}>
                  <li><button className="deleteButton" onClick={()=>{deleteCreationLine(line.line_id)}}>⊖</button>
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

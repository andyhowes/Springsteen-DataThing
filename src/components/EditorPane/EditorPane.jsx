import React, { useState, useEffect } from 'react';
import { useHistory } from 'react-router-dom';
import {useDispatch, useSelector} from 'react-redux';
import {DragDropContext, Droppable, Draggable} from 'react-beautiful-dnd';
import './EditorPane.css';

// CUSTOM COMPONENTS
import RegisterForm from '../RegisterForm/RegisterForm';

function EditorPane(props) {

  const [title, setTitle] = useState('');
  const [items, setItems] = useState('');

  const [save, setSave] = useState('');

  const dispatch = useDispatch();
  const editorStore = useSelector(store => store.editor);
  const userStore = useSelector(store => store.user);
  const history = useHistory();

  console.log('store', useSelector(store => store));

  const userID = userStore.id;

  useEffect(() => {
    setTimeout(() => {
      dispatch({type: 'FETCH_CREATION', userID});    //, payload: userStore['id']
    }, 1000)

  }, []);

  const arrayForCreation = Array.from(editorStore);
  console.log('here it is!', arrayForCreation)

  const [lyrics, updateLyrics] = useState(arrayForCreation);

  function handleOnDragEnd(result) {
    const items = lyrics;
    const [reorderedItem] = items.splice(result.source.index, 1);
    items.splice(result.destination.index, 0, reorderedItem);
    console.log('in handleOnDragEnd:', result);

    updateLyrics(items);
  }

  const deleteLine = (id) =>{
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

  let songRaw = lyrics.join('\n');

  const addTitle = () => {
    let submitPackage = {
      newTitle: title,
     content_text: songRaw,
     user_id: editorStore.user_id
    }
    console.log('sending submission of title package', submitPackage);
    dispatch({type: 'SUBMIT_TITLE_PACKAGE', payload: submitPackage});
  }

  const submitCreation = () => {
    let newCreation = Array.from(lyrics);
    addTitle();
    console.log('Creation submitted in Editor', newCreation);
    dispatch({type: 'ADD_CREATION', payload: newCreation});
  }

  return (
    <div id="savedLinesBox">
      <h1 className="linesCap">EDITOR</h1>
      {editorStore.length === 0 || userStore.length === 0? (<p>...Loading...</p>) : (
      <section><div id="linesBox">
        <h3>{title}</h3>
        <DragDropContext onDragEnd={handleOnDragEnd}>
          <Droppable droppableId="droppableIdForEditorList">
          {(provided) => (
            <ul id="lineList" {...provided.droppableProps} ref={provided.innerRef}>
              {lyrics.map((line, index) => {
                let lineKey = line.line_id + 'b';
                return (
                  <Draggable key={lineKey} draggableId={lineKey} index={index}>{(provided) =>
                  (<div ref={provided.innerRef} {...provided.draggableProps}{...provided.dragHandleProps}>
                  <li><button className="deleteButton" onClick={()=>{deleteLine(line.line_id)}}>⊖</button>
                  {line.fragment_text}</li></div>)}</Draggable>
                )
              })}
              {provided.placeholder}
            </ul>
          )}

          </Droppable>
        </DragDropContext>
        <input id="titleInput" onChange={setNewTitle} placeholder="Song Title"></input>
        <label for="saveSlot">Save Slot</label>

        <select name="saveSlot" id="slot" onChange={setSaveSlot}>
          <option value='1'>1</option>
          <option value='2'>2</option>
          <option value='3'>3</option>
          <option value='4'>4</option>
          <option value='5'>5</option>
          <option value='6'>6</option>
          <option value='7'>7</option>
          <option value='8'>8</option>
          <option value='9'>9</option>
        </select>
        <button id="setTitleButton" onClick={submitCreation}>Submit</button>
      </div></section>)}
    </div>
  );
}

export default EditorPane;

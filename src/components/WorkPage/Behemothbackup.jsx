import React, { useState, useEffect } from 'react';
import { useHistory } from 'react-router-dom';
import {useDispatch, useSelector} from 'react-redux';
import {DragDropContext, Droppable, Draggable} from 'react-beautiful-dnd';
import './Behemoth.css';
import uuid from "uuid/v4";

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
    setTimeout(() => {
      dispatch({type: 'FETCH_CREATION', userID});    //, payload: userStore['id']
    }, 1000)
  }, []);


  const arrayForLines = Array.from(linesStore);

 // const [lines, updateLines] = useState(arrayForLines);

 const columnsFromBackend = {
  [uuid()]: {
    name: "Saved Lines",
    items: arrayForLines
    },
  [uuid()]: {
    name: "Editor",
    items: []
    }
  };

  const [rows, setRows] = useState(arrayForLines);
  const [columns, setColumns] = useState(columnsFromBackend);

  const handleOnDragEnd = (result, columns, setColumns) => {
    if (!result.destination) return;
    const { source, destination } = result;

    if (source.droppableId !== destination.droppableId) {
      const sourceColumn = columns[source.droppableId];
      const destColumn = columns[destination.droppableId];
      const sourceItems = [...sourceColumn.items];
      const destItems = [...destColumn.items];
      const [removed] = sourceItems.splice(source.index, 1);
      destItems.splice(destination.index, 0, removed);
      setColumns({
        ...columns,
        [source.droppableId]: {
          ...sourceColumn,
          items: sourceItems
        },
        [destination.droppableId]: {
          ...destColumn,
          items: destItems
        }
      });
    } else {
      const column = columns[source.droppableId];
      const copiedItems = [...column.items];
      const [removed] = copiedItems.splice(source.index, 1);
      copiedItems.splice(destination.index, 0, removed);
      setColumns({
        ...columns,
        [source.droppableId]: {
          ...column,
          items: copiedItems
        }
      });
    }
  };

    // const items = lines;
    // const [reorderedItem] = items.splice(result.source.index, 1);
    // items.splice(result.destination.index, 0, reorderedItem);
    // console.log('in handleDragEnd:', result);

    // updateLines(items);


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
    <DragDropContext onDragEnd={handleOnDragEnd}>
    <div id="savedLinesBox">
      <h1 className="linesCap">SAVED LINES</h1>
      {linesStore.length === 0 || userStore.length === 0? (<p>...Loading...</p>) : (
      <section><div id="linesBox">

          <Droppable droppableId="droppableIdForSavedLinesList">
            {(provided) => (
              <ul id="lineList" {...provided.droppableProps} ref={provided.innerRef}>
                {rows.map((line, index) => {
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

         <div id="creationBox">
            <h1 className="linesCap">EDITOR</h1>
      {editorStore.length === 0 || userStore.length === 0? (<p>...Loading...</p>) : (
      <section id="savedCreationBox"><div>
        <h3>{title}</h3>

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

      </div></section>)}
      </div>

      </div></section>)}

    </div>
    </DragDropContext>
  );
}

export default Behemoth;
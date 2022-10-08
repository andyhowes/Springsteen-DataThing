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
  //const [items, setItems] = useState('');
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

 //const [lines, updateLines] = useState(arrayForLines);

 const columnsFromBackend = {
  [uuid()]: {
    name: "Saved Lines",
    items: arrayForLines
    },
  [uuid()]: {
    name: "Editor",
    items: [{
      fragment_id: 0,
      fragment_text: "____",
      saved_id: '123456'
      }]
    }
  };

  //const [rows, setRows] = useState(arrayForLines);
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
    <DragDropContext
        onDragEnd={result => handleOnDragEnd(result, columns, setColumns)}
    >
        {Object.entries(columns).map(([columnId, column], index) => {
          return (
            <div
              style={{
                display: "flex",
                flexDirection: "column",
                alignItems: "center"
              }}
              key={columnId}
            >
              <h2>{column.name}</h2>
              <div style={{ margin: 8 }}>
                <Droppable droppableId={columnId} key={columnId}>
                  {(provided, snapshot) => {
                    return (
                      <div
                        {...provided.droppableProps}
                        ref={provided.innerRef}
                        style={{
                          background: snapshot.isDraggingOver
                            ? "lightblue"
                            : "lightgrey",
                          padding: 4,
                          width: 250,
                          minHeight: 500
                        }}
                      >
                        {column.items.map((item, index) => {
                          return (
                            <Draggable
                              key={item.saved_id + 'rac'}
                              draggableId={item.saved_id + 'bbc'}
                              index={index + 11111}
                            >
                              {(provided, snapshot) => {
                                return (
                                  <div
                                    ref={provided.innerRef}
                                    {...provided.draggableProps}
                                    {...provided.dragHandleProps}
                                    style={{
                                      userSelect: "none",
                                      padding: 16,
                                      margin: "0 0 8px 0",
                                      minHeight: "50px",
                                      backgroundColor: snapshot.isDragging
                                        ? "#263B4A"
                                        : "#456C86",
                                      color: "white",
                                      ...provided.draggableProps.style
                                    }}
                                  >
                                    {item.fragment_text}
                                  </div>
                                );
                              }}
                            </Draggable>
                          );
                        })}
                        {provided.placeholder}
                      </div>
                    );
                  }}
                </Droppable>
              </div>
            </div>
          );
        })}
      </DragDropContext>
  );
}

export default Behemoth;
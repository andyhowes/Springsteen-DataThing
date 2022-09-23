import React, { useState, useEffect } from "react";
import {useDispatch, useSelector} from 'react-redux';
import { useHistory } from 'react-router-dom';
import { DragDropContext, Draggable, Droppable } from "react-beautiful-dnd";
//import uuid from "uuid/v4";
import './WorkPage.css';


function WorkPage() {

  const dispatch = useDispatch();
  const userStore = useSelector(store => store.user);
  const userID = userStore.id;

  useEffect(() => {
    setTimeout(() => {
      dispatch({type: 'FETCH_SAVED_LINES', userID});
    }, 1000)
  }, []);

  const linesStore = useSelector(store => store.savedLines);
  const arrayForLines = Array.from(linesStore);

  const {lines, setLines} = useState(arrayForLines);
  const [title, setTitle] = useState('');

  const columnsFromBackend = {
    savedColumn: {
      name: "Saved Lines",
      items: arrayForLines
    },
    savedEditor: {
      name: "Editor",
      items: [{
      fragment_id: 0,
      fragment_text: "____",
      saved_id: '123456'
      }]
    }
  };

  const setNewTitle = event => {
    setTitle(event.target.value);
  }

  const [columns, setColumns] = useState(columnsFromBackend);

  const onDragEnd = (result, columns, setColumns) => {
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

  // const saveText = () => {
  //   console.log(columns.savedEditor.items);
  // }

  //let songRaw = lyrics.join('\n');

  const submitText = () => {
    let submitPackage = {
      titleID: Math.floor(Math.random() * 100000),
      newTitle: title,
     lyrics: columns.savedEditor.items,
     user_id: linesStore.user_id
    }
    console.log('sending submission of title package', submitPackage);
    dispatch({type: 'SUBMIT_TITLE_PACKAGE', payload: submitPackage});
  }

  return (
    <div>
      { (linesStore.length === 0) ? (<p>...Loading...</p>) :
        (<div style={{ display: "flex", justifyContent: "center", height: "100%" }}>
          <DragDropContext
            onDragEnd={result => onDragEnd(result, columns, setColumns)}
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
                  {(column.name === 'Editor' ? <input id="titleInput" onChange={setNewTitle} placeholder="Song Title"></input> : <p></p>)}
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
                              width: 475,
                              height: 700
                            }}
                            className="columnDiv"
                          >
                            {column.items.map((item, index) => {
                              return (
                                <Draggable
                                  key={item.saved_id + 'key'}
                                  draggableId={item.saved_id + 'bbc'}
                                  index={index}
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
                                          minHeight: "40px",
                                          backgroundColor: snapshot.isDragging
                                            ? "#263B4A"
                                            : "#456C86",
                                          color: "white",
                                          ...provided.draggableProps.style
                                        }}
                                      >
                                        {item.fragment_text}
                                        {/* buttons here */}
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
                  {(column.name === 'Editor') ? <button onClick={submitText}>Save</button> : <p></p>}
                </div>
              );
            })}
          </DragDropContext>
        </div>
      )
    }
    </div>
  );
}

export default WorkPage;

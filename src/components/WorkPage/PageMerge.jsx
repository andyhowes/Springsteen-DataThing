import React, { useState, useEffect } from 'react';
import { Flex, Heading, Text } from "@chakra-ui/react";
import { useHistory } from 'react-router-dom';
import {useDispatch, useSelector} from 'react-redux';
import {DragDropContext, Droppable, Draggable} from 'react-beautiful-dnd';
import './WorkPage.css';
import Column from './Column';

const reorderColumnList = (sourceCol, startIndex, endIndex) => {
  const newTaskIds = Array.from(sourceCol.taskIds);
  const [removed] = newTaskIds.splice(startIndex, 1);
  newTaskIds.splice(endIndex, 0, removed);

  const newColumn = {
    ...sourceCol,
    taskIds: newTaskIds,
  };

  return newColumn;
}

const PageMerge = () => {

  const [state, setState] = useState(initialData);

  const dispatch = useDispatch();
  const linesStore = useSelector(store => store.savedLines);
  const userStore = useSelector(store => store.user);

  const userID = userStore.id;

  useEffect(() => {
    setTimeout(() => {
      dispatch({type: 'FETCH_SAVED_LINES', userID});    //, payload: userStore['id']
    }, 1000)
  }, []);

  const onDragEnd = (result) => {
    const { destination, source } = result;

    // If user tries to drop in an unknown destination
    if (!destination) return;

    // if the user drags and drops back in the same position
    if (
      destination.droppableId === source.droppableId &&
      destination.index === source.index
    ) {
      return;
    }

    // If the user drops within the same column but in a different positoin
    const sourceCol = state.columns[source.droppableId];
    const destinationCol = state.columns[destination.droppableId];

    if (sourceCol.id === destinationCol.id) {
      const newColumn = reorderColumnList(
        sourceCol,
        source.index,
        destination.index
      );

      const newState = {
        ...state,
        columns: {
          ...state.columns,
          [newColumn.id]: newColumn,
        },
      };
      setState(newState);
      return;
  };

    // If the user moves from one column to another
    const startTaskIds = Array.from(sourceCol.taskIds);
    const [removed] = startTaskIds.splice(source.index, 1);
    const newStartCol = {
      ...sourceCol,
      taskIds: startTaskIds,
    };

    const endTaskIds = Array.from(destinationCol.taskIds);
    endTaskIds.splice(destination.index, 0, removed);
    const newEndCol = {
      ...destinationCol,
      taskIds: endTaskIds,
    };

    const newState = {
      ...state,
      columns: {
        ...state.columns,
        [newStartCol.id]: newStartCol,
        [newEndCol.id]: newEndCol,
      },
    };

    setState(newState);
  };

  return (
    <DragDropContext onDragEnd={onDragEnd}>
      <Flex
        flexDir="column"
        bg="main-bg"
        minH="100vh"
        w="full"
        color="white-text"
        pb="2rem"
      >
        <Flex py="4rem" flexDir="column" align="center">
          <Heading fontSize="3xl" fontWeight={600}>
            React Beautiful Drag and Drop
          </Heading>
          <Text fontSize="20px" fontWeight={600} color="subtle-text">
            react-beautiful-dnd
          </Text>
        </Flex>

        {/* <Flex justify="space-between" px="4rem">
          {state.columnOrder.map((columnId) => {
            const column = state.columns[columnId];
            const tasks = column.taskIds.map((taskId) => state.tasks[taskId]);

            return <Column key={column.id} column={column} tasks={tasks} />;
          })}
        </Flex> */}
      </Flex>
    </DragDropContext>
  );

  const lyricsArray = linesStore.map((lyric, index) => {
    return lyric.saved_id;
  })

  const lyricsObjects = linesStore.map((lyric, index) => {
   let lyricObject = {
      id: lyric.saved_id,
      content: lyric.fragment_text
    }
    return lyricObject;
  });

  const initialData = {
    lyrics: {lyricsObjects},
    columns: {
      'column-1': {
        id: 'column-1',
        title: 'Saved Lines',
        lyricIDs: lyricsArray,
      },
      'column-2': {
        id: 'column-2',
        title: 'edit-column',
        lyricIDs: [],
      },
    },
    // Facilitate reordering of the columns
    columnOrder: ["column-1", "column-2"]
  }

}

  export default PageMerge;
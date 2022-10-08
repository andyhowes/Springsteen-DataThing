import React, { useState, useEffect } from 'react';
import {useDispatch, useSelector} from 'react-redux';

function InitialDataBox(props) {
  const [savedLines, updateSavedLines] = useState('');
  const [items, setItems] = useState('');
  //const [title, setTitle] = useState('');
  //const [items, setItems] = useState('');
  const [lyrics, updateLyrics] = useState('');
 // const [save, setSave] = useState('');

  const dispatch = useDispatch();
  const linesStore = useSelector(store => store.savedLines);
  const userStore = useSelector(store => store.user);
  //const editorStore = useSelector(store => store.editor);
  //const history = useHistory();

  console.log('store', useSelector(store => store));

  const userID = userStore.id;

  useEffect(() => {
    setTimeout(() => {
      dispatch({type: 'FETCH_SAVED_LINES', userID});    //, payload: userStore['id']
    }, 1000)
    // setTimeout(() => {
    //   dispatch({type: 'FETCH_CREATION', userID});    //, payload: userStore['id']
    // }, 1000)
  }, []);

  // const arrayForLines = Array.from(linesStore);

  // const [lines, updateLines] = useState(arrayForLines);

  const lyricsDataMap = linesStore.map((line, index) => {
    return (
      {
        [line.saved_id] : {
          id: line.saved_id,
          content: line.fragment_text
        }
      }
    )
});

   const initialData = {
    tasks: {
      ...lyricsDataMap
    },
    columns: {
      'column-1': {
        id: 'column-1',
        title: 'Saved Lyrics',
        taskIds: [],      //'task-1', 'task-2', 'task-3', 'task-4'
      },
      'column-2': {
        id: 'column-2',
        title: 'Editor',
        taskIds: [],
      },
    },
    // Facilitate reordering of the columns
    columnOrder: ['column-1', 'column-2'],
  };

  return initialData;
}
  // Contents of linesStore mapped into initialData template
// {linesStore.map((line, index) => {
//   return (
//     {
//       {line.saved_id} : {
//         id: {line.saved_id},
//         content: {line.fragment_text}
//       }
//     }
//   )
// })}

              //Structure of initialdata tasks key/value pair
// tasks: {
//       task(Key): (((({ id(Key): taskKey(Value), content(key): 'Take out the garbage'(value) }))))(Value),
//     }


                //Original map for
// {lines.map((line, index) => {
//                   let savedLineKey = line.saved_id + 'a';
//                   return (
//                     <Draggable key={savedLineKey} draggableId={savedLineKey} index={index}>
//                     {(provided) =>
//                     (<div ref={provided.innerRef} {...provided.draggableProps} {...provided.dragHandleProps}>
//                     <li><button className="deleteButton" onClick={()=>{deleteLine(line.saved_id)}}>⊖</button>
//                     {line.fragment_text}</li></div>)}</Draggable>
//                   )
//                 })}

export default InitialDataBox;
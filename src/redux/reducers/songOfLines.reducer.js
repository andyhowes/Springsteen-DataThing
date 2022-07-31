const songOfLinesReducer = (state = [], action) => {
  console.log('in songOfLinesReducer', action.payload);
  switch (action.type) {
    case 'SET_SONG_OF_LINES':
      return action.payload;
    default:
      return state;
  }
};

export default songOfLinesReducer;

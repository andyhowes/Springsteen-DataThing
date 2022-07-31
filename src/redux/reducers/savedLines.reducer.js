const savedLinesReducer = (state = [], action) => {
  console.log('in savedLinesReducer', action.payload);
  switch (action.type) {
    case 'SET_SAVED_LINES':
      return action.payload;
    default:
      return state;
  }
};

export default savedLinesReducer;

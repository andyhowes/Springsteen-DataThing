const linesListReducer = (state = [], action) => {
  console.log('in linesListReducer', action.payload);
  switch (action.type) {
    case 'SET_LINES':
      return action.payload;
    default:
      return state;
  }
};

export default linesListReducer;

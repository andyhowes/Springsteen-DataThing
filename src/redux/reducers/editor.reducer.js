const editorReducer = (state = [], action) => {
  console.log('in editorReducer', action.payload);
  switch (action.type) {
    case 'SET_CREATION':
      return action.payload;
    default:
      return state;
  }
};

export default editorReducer;

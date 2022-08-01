const editorReducer = (state = [], action) => {
  console.log('in editorReducer', action.payload);
  switch (action.type) {
    case 'SET_CREATION':
      console.log('here in editorReducerbeepbepepbeppeepp', action.payload);
      return action.payload;
    default:
      return state;
  }
};

export default editorReducer;

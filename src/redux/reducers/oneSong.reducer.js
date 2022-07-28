const oneSongReducer = (state = [], action) => {
  console.log('in oneSongReducer', action.payload);
  switch (action.type) {
    case 'SET_ONE_SONG':
      return action.payload;
    default:
      return state;
  }
};

// user will be on the redux state at:
// state.user
export default oneSongReducer;

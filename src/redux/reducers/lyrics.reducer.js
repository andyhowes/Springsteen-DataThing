const lyricsReducer = (state = {}, action) => {
  switch (action.type) {
    case 'SET_LYRICS':
      return action.payload;
    case 'UNSET_LYRICS':
      return {};
    default:
      return state;
  }
};

// user will be on the redux state at:
// state.user
export default lyricsReducer;

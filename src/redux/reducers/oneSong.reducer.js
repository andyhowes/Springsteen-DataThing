const oneSongReducer = (state = {}, action) => {
  console.log('in oneSongReducer', action.payload);
  switch (action.type) {
    case 'SET_ONE_SONG':
      return action.payload;
    default:
      return state;
  }
};

export default oneSongReducer;

const userSongReducer = (state = {}, action) => {
  console.log('in userSongReducer looking to retrieve user song', action.payload);
  switch (action.type) {
    case 'SET_USER_SONG':
      console.log('in userSong reducer');
      return action.payload;
    default:
      return state;
  }
};

export default userSongReducer;

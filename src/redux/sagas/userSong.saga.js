import axios from 'axios';
import { put, takeLatest } from 'redux-saga/effects';

// worker Saga: will be fired on "FETCH_SONGS" actions
function* fetchUserSongSaga() {
  try {
    console.log('in userSong Saga');
    const response = yield axios.get('/api/get_user_song');
    yield put({ type: 'SET_USER_SONG', payload: response.data });
  } catch (error) {
    console.log('Request to get user song failed', error);
    if(error.response) {console.log(error.response)}
    else if(error.request) {console.log(error.request)}
  }
}

function* userSongSaga() {
  yield takeLatest('FETCH_USER_SONG', fetchUserSongSaga);
}

export default userSongSaga;

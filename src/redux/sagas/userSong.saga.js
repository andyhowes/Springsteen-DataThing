import axios from 'axios';
import { put, takeLatest } from 'redux-saga/effects';

// worker Saga: will be fired on "FETCH_SONGS" actions
function* fetchUserSongSaga() {
  try {
    const response = yield axios.get('/api/creations');
    yield put({ type: 'SET_USER_SONG', payload: response.data });
  } catch (error) {
    console.log('Request to get user song failed', error);
  }
}

function* userSongSaga() {
  yield takeLatest('FETCH_USER_SONG', fetchUserSongSaga);
}

export default userSongSaga;

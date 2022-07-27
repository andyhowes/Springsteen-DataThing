import axios from 'axios';
import { put, takeLatest } from 'redux-saga/effects';

// worker Saga: will be fired on "FETCH_SONGS" actions
function* fetchSongs() {
  try {
    const response = yield axios.get('/api/songs');
    yield put({ type: 'SET_SONGS', payload: response.data });
  } catch (error) {
    console.log('Songs get request failed', error);
  }
}

function* songsSaga() {
  yield takeLatest('FETCH_SONGS', fetchSongs);
}

export default songsSaga;

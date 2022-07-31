import axios from 'axios';
import { put, takeLatest } from 'redux-saga/effects';

// worker Saga: will be fired on "FETCH_SONGS" actions
function* fetchOneSongSaga() {
  try {
    const response = yield axios.get('/api/songs');
    yield put({ type: 'SET_ONE_SONG', payload: response.data });
  } catch (error) {
    console.log('Request to get special song failed', error);
  }
}

function* oneSongSaga() {
  yield takeLatest('FETCH_ONE_SONG', fetchOneSongSaga);
}

export default oneSongSaga;

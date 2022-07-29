import axios from 'axios';
import { put, takeLatest } from 'redux-saga/effects';

// worker Saga: will be fired on "FETCH_SONGS" actions
function* fetchLinesSaga() {
  try {
    const response = yield axios.get('/api/lines_list');
    yield put({ type: 'SET_LINES', payload: response.data });
  } catch (error) {
    console.log('Request to get lines failed', error);
  }
}

function* songsSaga() {
  yield takeLatest('FETCH_LINES', fetchLinesSaga);
}

export default fetchOneSongSaga;

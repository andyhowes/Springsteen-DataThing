import axios from 'axios';
import { put, takeLatest } from 'redux-saga/effects';

// worker Saga: will be fired on "FETCH_SONGS" actions
function* fetchsongOfLinesSaga() {
  try {
    const response = yield axios.get('/api/song_of_lines${action.payload}');
    yield put({ type: 'SET_SONG_OF_LINES', payload: response.data });
  } catch (error) {
    console.log('Request to get lines failed', error);
  }
}

function* songOfLinesSaga() {
  yield takeLatest('FETCH_SONG_OF_LINES', fetchsongOfLinesSaga);
}

export default songOfLinesSaga;

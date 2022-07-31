import axios from 'axios';
import { put, takeLatest } from 'redux-saga/effects';

// worker Saga: will be fired on "FETCH_SAVED_LINES" actions
function* fetchSavedLinesSaga() {
  try {
    const response = yield axios.get('/api/get_saved_lines');
    yield put({ type: 'SET_SAVED_LINES', payload: response.data });
  } catch (error) {
    console.log('Request to get lines failed', error);
  }
}

function* savedLinesSaga() {
  yield takeLatest('FETCH_SAVED_LINES', fetchSavedLinesSaga);
}

export default fetchSavedLinesSaga;

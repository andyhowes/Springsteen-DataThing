import axios from 'axios';
import { put, takeLatest } from 'redux-saga/effects';

function* addLineSaga() {
  try {
    const response = yield axios.post('/api/addLine');
    // yield put({ type: 'ADD_LINE', payload: response.data });
  } catch (error) {
    console.log('Request to add line failed', error);
  }
}

function* takeLatestAddLineSaga() {
  yield takeLatest('TRIGGER_ADD_LINE', addLineSaga);
}

export default addLineSaga;

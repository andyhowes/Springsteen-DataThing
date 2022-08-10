import axios from 'axios';
import { put, takeLatest } from 'redux-saga/effects';

function* addLine(action) {
  try {
    yield axios.post('/api/add_line', action.payload);
    // yield put({ type: 'ADD_LINE', action.payload });
  } catch (error) {
    console.log('Request to add line failed', error);
  }
}

function* addLineSaga() {
  yield takeLatest('TRIGGER_ADD_LINE', addLine);
}

export default addLineSaga;

import axios from 'axios';
import { put, takeLatest } from 'redux-saga/effects';

function* addCreation(action) {
  try {
    yield axios.post('/api/addCreation', action.payload);
    // yield put({ type: 'ADD_LINE', action.payload });
  } catch (error) {
    console.log('Request to add line failed', error);
  }
}

function* addCreationSaga() {
  yield takeLatest('SUBMIT_TITLE_PACKAGE', addCreation);
}

export default addCreationSaga;

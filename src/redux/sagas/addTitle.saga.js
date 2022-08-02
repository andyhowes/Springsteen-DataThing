import axios from 'axios';
import { put, takeLatest } from 'redux-saga/effects';

function* addTitle(action) {
  try {
    yield axios.post('/api/addTitle', action.payload);
  } catch (error) {
    console.log('Request to add Title failed', error);
  }
}

function* addTitleSaga() {
  yield takeLatest('SUBMIT_TITLE_PACKAGE', addTitle);
}

export default addTitleSaga;

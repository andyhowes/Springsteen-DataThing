///api/get_creation

import axios from 'axios';
import { put, takeLatest } from 'redux-saga/effects';

function* fetchCreationSaga() {
  try {
    const response = yield axios.get('/api/get_creation');
    yield put({ type: 'SET_CREATION', payload: response.data });
  } catch (error) {
    console.log('Request to get creation failed', error);
  }
}

function* editorSaga() {
  yield takeLatest('FETCH_CREATION', fetchCreationSaga);
}

export default editorSaga;

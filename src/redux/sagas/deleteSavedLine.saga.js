import axios from 'axios';
import { put, takeLatest } from 'redux-saga/effects';

function* deleteLine(action) {
  try {
    yield axios.delete(`/api/deleteLine/${action.payload}`)
    .then(response => {
      console.log('Response from Delete Saved Line:', response)
    }).catch (error => {
      console.log('Error A: deleting line in Saga:', error);
    })
    yield put ({type:'FETCH_SAVED_LINES'});
  } catch(error) {
    console.log('Error B: deleting line in saga', error);
  }
}

function* deleteLineSaga() {
	yield takeLatest('TRIGGER_DELETE_LINE', deleteLine);
}

export default deleteLineSaga;
import axios from 'axios';
import { put, takeLatest } from 'redux-saga/effects';

function* deleteCreation(action) {
  try {
    yield axios.delete(`/api/editor/${action.payload}`)
    .then(response => {
      console.log('Response from Delete Creation:', response)
    }).catch (error => {
      console.log('Error deleting creation in Saga:', error);
    })
    yield put ({type:'FETCH_CREATION'});
  } catch(error) {
    console.log('Error deleting creation in saga', error);
  }
}

function* deleteCreationSaga() {
	yield takeLatest('TRIGGER_DELETE_CREATION', deleteCreation);
}

export default deleteCreationSaga;
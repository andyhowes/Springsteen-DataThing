import axios from 'axios';
import { put, takeLatest } from 'redux-saga/effects';

// worker Saga: will be fired on "FETCH_SONGS" actions
function* fetchSongs() {
  console.log('fetchSongs is encountered');
  try {
    const response = yield axios.get('/api/songs');
    console.log('in fetchSongs:', response);
    // now that the session has given us a user object
    // with an id and username set the client-side user object to let
    // the client-side code know the user is logged in
    yield put({ type: 'SET_LYRICS', payload: response.data });
  } catch (error) {
    console.log('User get request failed', error);
  }
}

function* songsSaga() {
  yield takeLatest('FETCH_SONGS', fetchSongs);
}

export default songsSaga;

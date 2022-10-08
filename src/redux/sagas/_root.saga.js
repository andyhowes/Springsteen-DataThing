import { all } from 'redux-saga/effects';
import loginSaga from './login.saga';
import registrationSaga from './registration.saga';
import userSaga from './user.saga';
import songsSaga from './songs.saga';
import oneSongSaga from './oneSong.saga';
import linesListSaga from './linesList.saga';
//import songOfLinesSaga from './songOfLines.saga';
import addLineSaga from './addLine.saga';
import savedLinesSaga from './savedLines.saga';
import editorSaga from './editor.saga';
import deleteCreationSaga from './deleteCreation.saga';
import deleteSavedLineSaga from './deleteSavedLine.saga';
//import addTitleSaga from './addTitle.saga';
import addCreationSaga from './addCreation.saga';
import creationsSaga from './creations.saga';
import userSong from './userSong.saga';

// rootSaga is the primary saga.
// It bundles up all of the other sagas so our project can use them.
// This is imported in index.js as rootSaga

// some sagas trigger other sagas, as an example
// the registration triggers a login
// and login triggers setting the user
export default function* rootSaga() {
  yield all([
    loginSaga(), // login saga is now registered
    registrationSaga(),
    userSaga(),
    songsSaga(),
    oneSongSaga(),
    linesListSaga(),
    //songOfLinesSaga(),
    addLineSaga(),
    savedLinesSaga(),
    editorSaga(),
    deleteCreationSaga(),
    deleteSavedLineSaga(),
    //addTitleSaga(),
    addCreationSaga(),
    creationsSaga(),
    userSong(),
  ]);
}

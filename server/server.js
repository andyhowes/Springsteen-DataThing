const express = require('express');
const bodyParser = require('body-parser');
require('dotenv').config();

const app = express();

const sessionMiddleware = require('./modules/session-middleware');
const passport = require('./strategies/user.strategy');

// Route includes
const userRouter = require('./routes/user.router');
const songsRouter = require('./routes/songs.router');
const linesListRouter = require('./routes/lines_list.router');
const songOfLinesRouter = require('./routes/song_of_lines.router');
const addLineRouter = require('./routes/add_line.router');
const getSavedLinesRouter = require('./routes/get_saved_lines.router');
const editorRouter = require('./routes/editor.router');
const deleteCreationRouter = require('./routes/delete_creation.router');
const deleteSavedLineRouter = require('./routes/delete_saved_line.router');
const addCreationRouter = require('./routes/add_creation.router');
//const addTitleRouter = require('./routes/add_title.router');
// const oneSongRouter = require('./routes/one_song.router')

// Body parser middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Passport Session Configuration //
app.use(sessionMiddleware);

// start up passport sessions
app.use(passport.initialize());
app.use(passport.session());

/* Routes */
app.use('/api/user', userRouter);
app.use('/api/songs', songsRouter);
app.use('/api/lines_list', linesListRouter);
app.use('/api/add_line', addLineRouter);
//app.use('/api/song_of_lines', songOfLinesRouter);
app.use('/api/get_saved_lines', getSavedLinesRouter);
app.use('/api/editor', editorRouter);
app.use('/api/delete_creation', deleteCreationRouter);
app.use('/api/deleteLine', deleteSavedLineRouter);
app.use('/api/add_creation', addCreationRouter);
//app.use('/api/addTitle', addTitleRouter);
app.use('/api/addCreation', addCreationRouter);
// app.use('/api/oneSong', oneSongRouter);
// Serve static files
app.use(express.static('build'));

// App Set //
const PORT = process.env.PORT || 5001;

/** Listen * */
app.listen(PORT, () => {
  console.log(`Listening on port: ${PORT}`);
});

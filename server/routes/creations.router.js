const express = require('express');
const pool = require('../modules/pool');
const router = express.Router();

router.get('/', (req, res) => {

  const query = `SELECT DISTINCT title, content_id FROM creation_stacks WHERE user_id = $1 ORDER BY "title" ASC`;
  const value = [req.user.id]
  pool.query(query, value)
    .then( result => {
      res.send(result.rows);
    })
    .catch(err => {
      console.log('ERROR: Get all user songs', err);
      res.sendStatus(500)
    })
});

router.get('/usersong/:id', (req, res) => {
  console.log('in get Router for user Song');
  const queryString = `SELECT * FROM creation_stacks JOIN lyrics_fragments on creation_stacks.fragment_id = lyrics_fragments.fragment_id WHERE creation_stacks.content_id=$1 ORDER BY line_id ASC`;
  const values = [req.params.id];
  pool.query(queryString, values)
    .then( result => {
      console.log('result from userSong get', result);
      res.send(result.rows);
    })
    .catch(err => {
      console.log('ERROR: Getting user song', err);
      res.sendStatus(500)
    })
});

module.exports = router;

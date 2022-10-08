const express = require('express');
const pool = require('../modules/pool');
const router = express.Router();

router.get('/:id', (req, res) => {
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

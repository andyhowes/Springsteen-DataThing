const express = require('express');
const pool = require('../modules/pool');
const router = express.Router();

router.get('/:id', (req, res) => {
  const query = `SELECT * FROM songs WHERE songs.song_id=$1`;
  const values = [req.params.id];
  pool.query(query, values)
    .then( result => {
      console.log('req params', req.params);
      res.send(result.rows);
    })
    .catch(err => {
      console.log('ERROR: Getting that song', err);
      res.sendStatus(500)
    })
});

/**
 * POST route template
 */
router.post('/songs', (req, res) => {
  // POST route code here
});

module.exports = router;

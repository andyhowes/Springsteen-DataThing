const express = require('express');
const pool = require('../modules/pool');
const router = express.Router();

router.get('/', (req, res) => {
  const query = `SELECT * FROM lyrics_fragments JOIN songs ON lyrics_fragments.song_id = songs.song_id JOIN albums ON albums.album_id = songs.album_id WHERE lyric_fragments.song_id=$1`;
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


//JOIN songs ON lyrics_fragments.song_id = songs.song_id
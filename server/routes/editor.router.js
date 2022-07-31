const express = require('express');
const pool = require('../modules/pool');
const router = express.Router();

router.get('/', (req, res) => {

  const query =
  `SELECT * FROM creation_stacks
  JOIN user_creations
  ON creation_stacks.content_id = user_creations.content_id
  JOIN users ON creation_stacks.user_id = users.id
  JOIN lyrics_fragments ON creation_stacks.fragment_id = lyrics_fragments.fragment_id
  WHERE creation_stacks.user_id = $1
  ORDER BY creation_stacks.fragment_id ASC`;
  const value = [req.body.id]
  pool.query(query, value)
    .then( result => {
      res.send(result.rows);
    })
    .catch(err => {
      console.log('ERROR: Getting fragments', err);
      res.sendStatus(500)
    })
});

router.post('/', (req, res) => {
  // POST route code here
});

// router.get('/fragments:id', (req, res) => {
//   const query = `SELECT * FROM lyrics_fragments JOIN songs ON lyrics_fragments.song_id = songs.song_id JOIN albums ON albums.album_id = songs.album_id WHERE lyric_fragments.song_id=$1`;
//   const values = [req.params.id];
//   pool.query(query, values)
//     .then( result => {
//       console.log('req params', req.params);
//       res.send(result.rows);
//     })
//     .catch(err => {
//       console.log('ERROR: Getting that song', err);
//       res.sendStatus(500)
//     })
// });

/**
 * POST route template
 */

module.exports = router;

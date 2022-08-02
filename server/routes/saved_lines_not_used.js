const express = require('express');
const pool = require('../modules/pool');
const router = express.Router();

router.get('/', (req, res) => {

  const query =
  `SELECT * FROM saved_fragments
  JOIN lyrics_fragments
  ON lyrics_fragments.fragment_id = saved_fragments.fragment_id
  JOIN users ON saved_fragments.user_id = users.id
  WHERE users.id = $1
  ORDER BY saved_fragments.fragment_id ASC`;
  value = [req.user.id]
  pool.query(query, value)
    .then( result => {
      res.send(result.rows);
    })
    .catch(err => {
      console.log('ERROR: Getting fragments', err);
      res.sendStatus(500)
    })
});

router.delete('/savedLinesDelete', (req, res) => {

  const query =
  `DELETE FROM saved_fragments WHERE "id" = $1`;
  value = req.body.id;
}).then(() => {
  console.log('delete appears successful at Router');
  res.sendStatus(200);
}).catch(error => {
  console.log('failed to delete saved line at Router', error);
  res.sendStatus(500);
})

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

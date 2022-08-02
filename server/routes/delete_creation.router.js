const express = require('express');
const pool = require('../modules/pool');
const router = express.Router();
const {
  rejectUnauthenticated,
} = require('../modules/authentication-middleware');



router.delete('/:id', rejectUnauthenticated, (req, res) => {

  const query =
  `DELETE FROM creation_stacks WHERE "line_id" = $1`;
  value = [req.body.id];
  pool.query(query, value)
.then(() => {
  console.log('delete appears successful at Editor Router');
  res.sendStatus(200);
}).catch(error => {
  console.log('failed to delete line at Editor Router', error);
  res.sendStatus(500);
  })
})

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

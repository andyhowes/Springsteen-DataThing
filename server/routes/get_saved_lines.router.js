const express = require('express');
const pool = require('../modules/pool');
const router = express.Router();
const {
  rejectUnauthenticated,
} = require('../modules/authentication-middleware');

router.get('/', rejectUnauthenticated ,(req, res) => {

  const query = `
  SELECT * FROM lyrics_fragments
  JOIN saved_fragments ON lyrics_fragments.fragment_id = saved_fragments.fragment_id
  JOIN users ON saved_fragments.user_id = users.id WHERE users.id = $1
  ORDER BY lyrics_fragments.fragment_id ASC`;
  value = [req.user.id];
  pool.query(query, value)
    .then( result => {
      res.send(result.rows);
    })
    .catch(err => {
      console.log('ERROR: Getting fragments', err);
      res.sendStatus(500)
    })
});

router.delete('/:id', (req, res) => {

  const query =
  `DELETE FROM saved_fragments WHERE "id" = $1`;
  value = [req.params.id];
  pool.query(query, value)
.then(() => {
  console.log('delete appears successful at Router');
  res.sendStatus(200);
}).catch(error => {
  console.log('failed to delete saved line at Router', error);
  res.sendStatus(500);
  })
})

// router.get('/song_of_lines:id', (req, res) => {
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
// router.post('/saved_lines', (req, res) => {
//   console.log('req.body:', req.body);
//   const saveLine = `
//   INSERT INTO "saved_fragments" ("fragment_id", "user_id")
//   VALUES ($1, $2)`;
//   pool.query(saveLine, [req.body.fragment_id, req.body.user_id])
//   .then(result => {
//     console.log('added to saved_fragments');
//   }).catch(err => {
//     console.log('problem adding fragment', err);
//     res.sendStatus(500);
//   })
//   // POST route code here
// });

module.exports = router;


//JOIN songs ON lyrics_fragments.song_id = songs.song_id
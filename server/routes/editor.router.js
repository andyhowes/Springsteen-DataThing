const express = require('express');
const pool = require('../modules/pool');
const router = express.Router();
const {
  rejectUnauthenticated,
} = require('../modules/authentication-middleware');

router.get('/', (req, res) => {
  console.log('in get route for editor');
  const query =
  `SELECT * FROM creation_stacks
  JOIN user_creations
  ON creation_stacks.content_id = user_creations.content_id
  JOIN users ON creation_stacks.user_id = users.id
  JOIN lyrics_fragments ON creation_stacks.fragment_id = lyrics_fragments.fragment_id
  WHERE creation_stacks.user_id = $1
  ORDER BY creation_stacks.fragment_id ASC`;
  const value = [req.user.id]
  pool.query(query, value)
    .then( result => {
      res.send(result.rows);
    })
    .catch(err => {
      console.log('ERROR: Getting fragments', err);
      res.sendStatus(500)
    })
});

// router.post('/', (req, res) => {
//   // POST route code here
// });

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

router.post('/', (req, res) => {
  console.log('req.body:', req.body);
  const saveCreation = `
  INSERT INTO "creation_stacks" ("content_id", "fragment_id", "user_id")
  VALUES ($1, $2, $3)`;
  const values = [req.body.content_id, req.body.fragment_id, req.user.id];
  pool.query(saveLine, values)
  .then(result => {
    console.log('added to saved_fragments');
  }).catch(err => {
    console.log('problem adding fragment', err);
    res.sendStatus(500);
  })
});

/**
 * POST route template
 */

module.exports = router;

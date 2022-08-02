const express = require('express');
const pool = require('../modules/pool');
const router = express.Router();

router.post('/', (req, res) => {
  console.log('req.body:', req.body);
  const saveLine = `
  INSERT INTO "creation_stacks" ("content_id", "fragment_id", "user_id")
  VALUES ($1, $2 $3)`;
  const values = [req.content_id,req.body.fragment_id, req.user.id];
  pool.query(saveLine, values)
  .then(result => {
    console.log('added to saved_fragments');
  }).catch(err => {
    console.log('problem adding fragment', err);
    res.sendStatus(500);
  })
  // POST route code here
});

module.exports = router;
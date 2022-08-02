const express = require('express');
const pool = require('../modules/pool');
const router = express.Router();

router.post('/', (req, res) => {
  console.log('req.body:', req.body);
  const newSongTitle = `
  INSERT INTO "user_creations" ("content_name", "content_text", "user_id")
  VALUES ($1, $2, $3)`;
  const values = [req.body.newTitle, req.body.content_text, req.user.id];
  pool.query(newSongTitle, values)
  .then(result => {
    console.log('added to user_creations');
  }).catch(err => {
    console.log('problem adding song', err);
    res.sendStatus(500);
  })
  // POST route code here
});

module.exports = router;
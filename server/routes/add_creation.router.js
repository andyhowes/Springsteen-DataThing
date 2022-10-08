const express = require('express');
const pool = require('../modules/pool');
const router = express.Router();

// router.post('/', (req, res) => {
//   console.log('req.body:', req.body);
//   const saveNewSong = `
//   INSERT INTO "creation_stacks" ("content_id", "title, "fragment_id", "user_id")
//   VALUES ($1, $2 $3, $4)`;
//   const values = [req.body.titleID, req.body.newTitle, req.body.lyrics.fragment_id, req.user.id];
//   pool.query(saveNewSong, values)
//   .then(result => {
//     console.log('added to saved_fragments');
//   }).catch(err => {
//     console.log('problem adding fragment', err);
//     res.sendStatus(500);
//   })
//   // POST route code here
// });

router.post('/', async (req, res) => {
  console.log('lyric lines POST:', req.body, req.user);
  const client = await pool.connect();
  let lyrics = req.body.lyrics;
  try {
    // const client = await pool.connect();
    await client.query('BEGIN');
    await Promise.all( // Allows for concurrent requests
      lyrics.map(async (lyric) => {
        const queryString = `INSERT INTO creation_stacks ( "content_id", "title", "fragment_id", "user_id" ) VALUES ( $1, $2, $3, $4 );`;
        const values = [req.body.titleID, req.body.newTitle, lyric.fragment_id, req.user.id];
        await client.query(queryString, values);

      })
    );
    await client.query('COMMIT');
    client.release();
    res.sendStatus(201);
  } catch (error) {
    console.log('ROLLBACK', error);
    await client.query('ROLLBACK');
    client.release();
    res.sendStatus(500);
  }
})

module.exports = router;
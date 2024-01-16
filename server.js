const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const knex = require('knex');
const knexfile = require('./knexfile');

const app = express();
const PORT = process.env.PORT || 3001;

app.use(cors());
app.use(bodyParser.json());

const db = knex(knexfile);

app.get('/api/data', async (req, res) => {
  try {
    const data = await db.select('*').from('leagues');
    res.json(data);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

//Simple Queries
app.get('/api/top-scorers', async (req, res) => {
  try {
    const topScorers = await db.select('player_name', 'drafter_name', 'video_id', 'Total_Goal')
      .from('player_stats')
      .orderBy('Total_Goal', 'desc')
      .limit(5);

    res.json(topScorers);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.get('/api/top-assists', async (req, res) => {
  try {
    const topAssists = await db.select('player_name', 'drafter_name', 'video_id', 'Total_Assist')
      .from('player_stats')
      .orderBy('Total_Assist', 'desc')
      .limit(5);

    res.json(topAssists);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error' });
  }
});


app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});

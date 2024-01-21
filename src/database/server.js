const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const knex = require('knex');
const knexfile = require('./knexfile');
const router = express.Router();

const app = express();
const PORT = process.env.PORT || 3001;

app.use(cors());
app.use(bodyParser.json());

const db = knex(knexfile);

let playersData = [];

app.get('/api/players-data', async (req, res) => {
  try {
    const data = await db.select('*').from('players');
    res.json(data);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.get('/api/data', async (req, res) => {
  try {
    const data = await db.select('*').from('leagues');
    res.json(data);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

//Simple Stats
app.get('/api/top-scorers', async (req, res) => {
  try {
    const topScorers = await db
      .select(
        'player_stats.player_name',
        'player_stats.drafter_name',
        'player_stats.video_id',
        'player_stats.Total_Goal',
        'draft_info.url'
      )
      .from('player_stats')
      .leftJoin('draft_info', 'player_stats.video_id', 'draft_info.video_id')
      .orderBy('player_stats.Total_Goal', 'desc')
      .limit(5);

    const formattedTopScorers = topScorers.map(player => ({
      ...player,
      url: player.url || 'https://www.youtube.com/watch?v=GaE-L5zP-DE',
    }));

    res.json(formattedTopScorers);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.get('/api/top-assists', async (req, res) => {
  try {
    const topAssists = await db
      .select(
        'player_stats.player_name',
        'player_stats.drafter_name',
        'player_stats.Total_Assist',
        'draft_info.url'
      )
      .from('player_stats')
      .leftJoin('draft_info', 'player_stats.video_id', 'draft_info.video_id')
      .orderBy('player_stats.Total_Assist', 'desc')
      .limit(5);

    const formattedTopAssists = topAssists.map(player => ({
      ...player,
      url: player.url || 'https://www.youtube.com/watch?v=GaE-L5zP-DE',
    }));

    res.json(formattedTopAssists);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.get('/api/top-cs', async (req, res) => {
  try {
    const topCS = await db
      .select(
        'player_stats.player_name',
        'player_stats.drafter_name',
        'player_stats.video_id',
        'player_stats.Total_CS',
        'draft_info.url'
      )
      .from('player_stats')
      .leftJoin('draft_info', 'player_stats.video_id', 'draft_info.video_id')
      .whereNotNull('player_stats.Total_CS')
      .orderBy('player_stats.Total_CS', 'desc')
      .limit(5);

    const formattedTopCS = topCS.map(player => ({
      ...player,
      url: player.url || 'https://www.youtube.com/watch?v=GaE-L5zP-DE',
    }));

    res.json(formattedTopCS);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.get('/api/top-performance', async (req, res) => {
  try {
    const topPerformance = await db.select(
        'player_stats.player_name',
        'player_stats.drafter_name',
        'player_stats.video_id',
        'player_stats.Total_Goal',
        'player_stats.Total_Assist',
        'draft_info.url'
      )
      .from('player_stats')
      .leftJoin('draft_info', 'player_stats.video_id', 'draft_info.video_id')
      .whereNotNull('Total_Goal')
      .whereNotNull('Total_Assist')
      .orderBy(db.raw('(Total_Goal + Total_Assist)'), 'desc')
      .limit(5);

    res.json(topPerformance);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.get('/player-names', async (req, res) => {
  try {
    const playerNames = await db.select('name').from('players');
    res.json(playerNames.map((row) => row.name));
  } catch (error) {
    console.error('Error fetching player names:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.get('/team-names', async (req, res) => {
  try {
    const teamNames = await db.distinct('team').from('players');
    res.json(teamNames.map((row) => row.team));
  } catch (error) {
    console.error('Error fetching team names:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.get('/positions', async (req, res) => {
  try {
    const positions = await db.distinct('position').from('players');
    res.json(positions.map((row) => row.position));
  } catch (error) {
    console.error('Error fetching positions:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.post('/api/add-players', async (req, res) => {
  try {
    const { name, position, team } = req.body;

    await db('players').insert({ name, position, team });
    console.log(name, position, team);
    res.status(201).json({ message: 'Player added successfully' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Oups! Internal server error' });
  }
});

app.delete('/api/delete-player', (req, res) => {
  try {
      const { name, team, position } = req.body;

      // Find the player in the array based on unique properties
      const playerIndex = playersData.findIndex(player =>
          player.name === name && player.team === team && player.position === position
      );

      if (playerIndex !== -1) {
          // Remove the player from the array
          playersData.splice(playerIndex, 1);

          // Send a success response
          res.json({ success: true, message: 'Player deleted successfully' });
      } else {
          // Player not found, send an error response
          res.status(404).json({ success: false, message: 'Player not found' });
      }
  } catch (error) {
      // Log the error for debugging purposes
      console.error('Error in delete-player route:', error);

      // Send an internal server error response
      res.status(500).json({ success: false, message: 'Internal Server Error' });
  }
});

app.listen(PORT, () => {
  console.log(`You are launching the server`);
  console.log(`Server is running on http://localhost:${PORT}`);
  console.log(`In case of any modification, please restart the server Ctrl + C and run again npm run dev`)
});
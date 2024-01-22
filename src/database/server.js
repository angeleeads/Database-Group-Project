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

// Get all players data
app.get('/api/players-data', async (req, res) => {
  try {
    const data = await db.select('*').from('players');
    res.json(data);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Get all leagues data
app.get('/api/data', async (req, res) => {
  try {
    const data = await db.select('*').from('leagues');
    res.json(data);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Get top scorers
app.get('/api/top-scorers', async (req, res) => {
  try {
    const topScorers = await db
      .select(
        'player_stats.player_name',
        'player_stats.drafter_name',
        'player_stats.video_id',
        'player_stats.Total_Goal',
        'players.photo',
        'players.team',
        'draft_info.url'
      )
      .from('player_stats')
      .leftJoin('draft_info', 'player_stats.video_id', 'draft_info.video_id')
      .leftJoin('players', 'player_stats.player_name', 'players.name')
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

// Get top assists
app.get('/api/top-assists', async (req, res) => {
  try {
    const topAssists = await db
      .select(
        'player_stats.player_name',
        'player_stats.drafter_name',
        'player_stats.video_id',
        'player_stats.Total_Assist',
        'players.photo',
        'players.team',
        'draft_info.url'
      )
      .from('player_stats')
      .leftJoin('draft_info', 'player_stats.video_id', 'draft_info.video_id')
      .leftJoin('players', 'player_stats.player_name', 'players.name')
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

// Get top CS (Creep Score) with player's photo and team
app.get('/api/top-cs', async (req, res) => {
  try {
    const topCS = await db
      .select(
        'player_stats.player_name',
        'player_stats.drafter_name',
        'player_stats.video_id',
        'player_stats.Total_CS',
        'players.photo',
        'players.team',
        'draft_info.url'
      )
      .from('player_stats')
      .leftJoin('draft_info', 'player_stats.video_id', 'draft_info.video_id')
      .leftJoin('players', 'player_stats.player_name', 'players.name')
      .whereNotNull('player_stats.Total_CS')
      .orderBy('player_stats.Total_CS', 'desc')
      .limit(5);

    const formattedTopCS = topCS.map(player => ({
      player_name: player.player_name,
      drafter_name: player.drafter_name,
      video_id: player.video_id,
      Total_CS: player.Total_CS,
      photo: player.photo,
      team: player.team,
      url: player.url || 'https://www.youtube.com/watch?v=GaE-L5zP-DE',
    }));

    res.json(formattedTopCS);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error' });
  }
});


// Get top performance (based on total goals and assists)
app.get('/api/top-performance', async (req, res) => {
  try {
    const topPerformance = await db.select(
        'player_stats.player_name',
        'player_stats.drafter_name',
        'player_stats.video_id',
        'player_stats.Total_Goal',
        'player_stats.Total_Assist',
        'players.photo',
        'players.team',
        'draft_info.url'
      )
      .from('player_stats')
      .leftJoin('draft_info', 'player_stats.video_id', 'draft_info.video_id')
      .leftJoin('players', 'player_stats.player_name', 'players.name')
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

// Get top players onur
app.get('/api/top-players-onur', async (req, res) => {
  try {
    const topPlayers = await db
      .select(
        'player_stats.player_name',
        'player_stats.drafter_name',
        'players.photo',
        'players.team'
      )
      .sum({ 'Total_Points': 'player_stats.Goal_King' })
      .sum({ 'Total_Points': 'player_stats.Assist_King' })
      .sum({ 'Total_Points': 'player_stats.CS_King' })
      .sum({ 'Total_Points': 'player_stats.EU_Goal_King' })
      .sum({ 'Total_Points': 'player_stats.EU_Assist_King' })
      .sum({ 'Total_Points': 'player_stats.EU_CS_King' })
      .sum({ 'Total_Points': 'player_stats.3RB_Goal_King' })
      .sum({ 'Total_Points': 'player_stats.3RB_Assist_King' })
      .sum({ 'Total_Points': 'player_stats.3RB_CS_King' })
      .sum({ 'Total_Points': 'player_stats.Best_Performance' })
      .sum({ 'Total_Points': 'player_stats.Best_Best_Performance' })
      .sum({ 'Total_Points': 'player_stats.Performance_king' })
      .sum({ 'Total_Points': 'player_stats.Other_Point' })
      .from('player_stats')
      .leftJoin('players', 'player_stats.player_name', 'players.name')
      .where('player_stats.drafter_name', '=', 'Onur')
      .groupBy('player_stats.player_name', 'player_stats.drafter_name', 'players.photo', 'players.team')
      .orderBy('Total_Points', 'desc')
      .limit(5);

    const formattedTopPlayers = topPlayers.map(player => ({
      player_name: player.player_name,
      drafter_name: player.drafter_name,
      photo: player.photo,
      team: player.team,
      Total_Points: player.Total_Points,
    }));

    res.json(formattedTopPlayers);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error' });
  }
});


// Get top players arden
app.get('/api/top-players-arden', async (req, res) => {
  try {
    const topPlayersArden = await db
      .select(
        'player_stats.player_name',
        'player_stats.drafter_name',
        'players.photo',
        'players.team'
      )
      .sum({ 'Total_Points': 'player_stats.Goal_King' })
      .sum({ 'Total_Points': 'player_stats.Assist_King' })
      .sum({ 'Total_Points': 'player_stats.CS_King' })
      .sum({ 'Total_Points': 'player_stats.EU_Goal_King' })
      .sum({ 'Total_Points': 'player_stats.EU_Assist_King' })
      .sum({ 'Total_Points': 'player_stats.EU_CS_King' })
      .sum({ 'Total_Points': 'player_stats.3RB_Goal_King' })
      .sum({ 'Total_Points': 'player_stats.3RB_Assist_King' })
      .sum({ 'Total_Points': 'player_stats.3RB_CS_King' })
      .sum({ 'Total_Points': 'player_stats.Best_Performance' })
      .sum({ 'Total_Points': 'player_stats.Best_Best_Performance' })
      .sum({ 'Total_Points': 'player_stats.Performance_king' })
      .sum({ 'Total_Points': 'player_stats.Other_Point' })
      .from('player_stats')
      .leftJoin('players', 'player_stats.player_name', 'players.name')
      .where('player_stats.drafter_name', '=', 'Arden')
      .groupBy('player_stats.player_name', 'player_stats.drafter_name', 'players.photo', 'players.team')
      .orderBy('Total_Points', 'desc')
      .limit(5);

    const formattedTopPlayersArden = topPlayersArden.map(player => ({
      player_name: player.player_name,
      drafter_name: player.drafter_name,
      photo: player.photo,
      team: player.team,
      Total_Points: player.Total_Points,
    }));

    res.json(formattedTopPlayersArden);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Get top players ugur
app.get('/api/top-players-ugur', async (req, res) => {
  try {
    const topPlayersArden = await db
      .select(
        'player_stats.player_name',
        'player_stats.drafter_name',
        'players.photo',
        'players.team'
      )
      .sum({ 'Total_Points': 'player_stats.Goal_King' })
      .sum({ 'Total_Points': 'player_stats.Assist_King' })
      .sum({ 'Total_Points': 'player_stats.CS_King' })
      .sum({ 'Total_Points': 'player_stats.EU_Goal_King' })
      .sum({ 'Total_Points': 'player_stats.EU_Assist_King' })
      .sum({ 'Total_Points': 'player_stats.EU_CS_King' })
      .sum({ 'Total_Points': 'player_stats.3RB_Goal_King' })
      .sum({ 'Total_Points': 'player_stats.3RB_Assist_King' })
      .sum({ 'Total_Points': 'player_stats.3RB_CS_King' })
      .sum({ 'Total_Points': 'player_stats.Best_Performance' })
      .sum({ 'Total_Points': 'player_stats.Best_Best_Performance' })
      .sum({ 'Total_Points': 'player_stats.Performance_king' })
      .sum({ 'Total_Points': 'player_stats.Other_Point' })
      .from('player_stats')
      .leftJoin('players', 'player_stats.player_name', 'players.name')
      .where('player_stats.drafter_name', '=', 'Ugur')
      .groupBy('player_stats.player_name', 'player_stats.drafter_name', 'players.photo', 'players.team')
      .orderBy('Total_Points', 'desc')
      .limit(5);

    const formattedTopPlayersArden = topPlayersArden.map(player => ({
      player_name: player.player_name,
      drafter_name: player.drafter_name,
      Total_Points: player.Total_Points,
      photo: player.photo,
      team: player.team,
    }));

    res.json(formattedTopPlayersArden);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Get player names
app.get('/player-names', async (req, res) => {
  try {
    const playerNames = await db.select('name').from('players');
    res.json(playerNames.map((row) => row.name));
  } catch (error) {
    console.error('Error fetching player names:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Get team names
app.get('/team-names', async (req, res) => {
  try {
    const teamNames = await db.distinct('team').from('players');
    res.json(teamNames.map((row) => row.team));
  } catch (error) {
    console.error('Error fetching team names:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Get positions
app.get('/positions', async (req, res) => {
  try {
    const positions = await db.distinct('position').from('players');
    res.json(positions.map((row) => row.position));
  } catch (error) {
    console.error('Error fetching positions:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

// Add a player
app.post('/api/add-players', async (req, res) => {
  try {
    const { name, position, team } = req.body;

    await db('players').insert({ name, position, team });
    res.status(201).json({ message: 'Player added successfully' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Oups! Internal server error' });
  }
});

// Delete a player
app.delete('/api/delete-player', (req, res) => {
  const { name, position, team } = req.query;
  db('players')
    .where({ name, position, team })
    .del()
    .then(() => res.status(204).json({ message: 'Player deleted successfully' }))
    .catch(error => {
      console.error(error);
      res.status(500).json({ error: 'Internal server error' });
    });
});

app.listen(PORT, () => {
  console.log(`You are launching the server`);
  console.log(`Server is running on http://localhost:${PORT}`);
  console.log(`In case of any modification, please restart the server Ctrl + C and run again npm run dev`);
});
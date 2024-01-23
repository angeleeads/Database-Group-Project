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
        'ps.player_name',
        'ps.drafter_name',
        'ps.video_id',
        'players.photo',
        'players.team',
        'ps.Total_CS'
      )
      .from('player_stats as ps')
      .join('players as p', 'ps.player_name', 'p.name')
      .leftJoin('players', 'ps.player_name', 'players.name')
      .where('p.position', 'GK')
      .whereNotNull('ps.Total_CS')
      .orderBy('ps.Total_CS', 'desc')
      .limit(5);

    res.json(topCS);
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
        'players.team',
      )
      .select(db.raw(`
        SUM(Goal_King + Assist_King + CS_King +
            EU_Goal_King + EU_Assist_King + EU_CS_King +
            3RB_Goal_King + 3RB_Assist_King + 3RB_CS_King +
            Best_Performance + Best_Best_Performance + Performance_king +
            Other_Point
        ) AS Total_Points
      `))
      .from('player_stats')
      .leftJoin('players', 'player_stats.player_name', 'players.name')
      .where('player_stats.drafter_name', '=', 'Onur')
      .groupBy(
        'player_stats.player_name',
        'player_stats.drafter_name',
        'players.photo',
        'players.team'
      )
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
    const topPlayers = await db
      .select(
        'player_stats.player_name',
        'player_stats.drafter_name',
        'players.photo',
        'players.team',
      )
      .select(db.raw(`
        SUM(Goal_King + Assist_King + CS_King +
            EU_Goal_King + EU_Assist_King + EU_CS_King +
            3RB_Goal_King + 3RB_Assist_King + 3RB_CS_King +
            Best_Performance + Best_Best_Performance + Performance_king +
            Other_Point
        ) AS Total_Points
      `))
      .from('player_stats')
      .leftJoin('players', 'player_stats.player_name', 'players.name')
      .where('player_stats.drafter_name', '=', 'Arden')
      .groupBy(
        'player_stats.player_name',
        'player_stats.drafter_name',
        'players.photo',
        'players.team'
      )
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

// Get top players ugur
app.get('/api/top-players-ugur', async (req, res) => {
  try {
    const topPlayers = await db
      .select(
        'player_stats.player_name',
        'player_stats.drafter_name',
        'players.photo',
        'players.team',
      )
      .select(db.raw(`
        SUM(Goal_King + Assist_King + CS_King +
            EU_Goal_King + EU_Assist_King + EU_CS_King +
            3RB_Goal_King + 3RB_Assist_King + 3RB_CS_King +
            Best_Performance + Best_Best_Performance + Performance_king +
            Other_Point
        ) AS Total_Points
      `))
      .from('player_stats')
      .leftJoin('players', 'player_stats.player_name', 'players.name')
      .where('player_stats.drafter_name', '=', 'Onur')
      .groupBy(
        'player_stats.player_name',
        'player_stats.drafter_name',
        'players.photo',
        'players.team'
      )
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

app.get('/api/search', async (req, res) => {
  try {
    const { type, value } = req.query;

    let query;
    switch (type) {
      case 'player_name':
        query = await db
          .select('*')
          .from('player_stats')
          .where('player_name', 'like', `%${value}%`);
        break;
      case 'team':
        query = await db
          .select('*')
          .from('player_stats')
          .where('team', 'like', `%${value}%`);
        break;
      case 'video_id':
        const videoId = parseInt(value);
        if (isNaN(videoId) || videoId < 1 || videoId > 9) {
          res.status(400).json({ error: 'Invalid video_id' });
          return;
        }
        query = await db.with('PlayerPerformance', (qb) => {
          qb.select(
            'ps.player_name',
            'ps.drafter_name',
            'ps.video_id',
            'p.position',
            db.raw(`
              CASE
                WHEN p.position IN ('SNT', 'ST') THEN (ps.Total_Goal + ps.Total_Assist) / ps.Total_Match
                WHEN p.position = 'LW' THEN (ps.Total_Goal + ps.Total_Assist) / ps.Total_Match
                WHEN p.position = 'RW' THEN (ps.Total_Goal + ps.Total_Assist) / ps.Total_Match
                WHEN p.position = 'MF' THEN (ps.Total_Goal + ps.Total_Assist) / ps.Total_Match
                WHEN p.position = 'DMF' THEN (ps.Total_Goal + ps.Total_Assist) / ps.Total_Match
                WHEN p.position IN ('LB', 'RB') THEN (ps.Total_CS + ps.Total_Assist) / ps.Total_Match
                WHEN p.position = 'GK' THEN ps.Total_CS / ps.Total_Match
                WHEN p.position = 'STP' THEN ps.Total_CS / ps.Total_Match
              END AS PerformanceScore
            `),
            db.raw(`
              ROW_NUMBER() OVER (PARTITION BY p.position ORDER BY (ps.Total_Goal + ps.Total_Assist) DESC) AS PositionRank
            `)
          )
          .from('player_stats AS ps')
          .join('players AS p', 'ps.player_name', 'p.name')
          .where('ps.video_id', '=', videoId)
          .andWhere('ps.Total_Match', '>', 20);
        })
        .with('RankedPlayers', (qb) => {
          qb.select('player_name', 'drafter_name', 'video_id', 'position')
          .from('PlayerPerformance')
          .where((builder) => {
            builder
              .where((builder) => {
                builder.whereIn('position', ['SNT', 'ST']).andWhere('PositionRank', '=', 1)
              })
              .orWhere((builder) => {
                builder.whereIn('position', ['LW', 'RW']).andWhere('PositionRank', '=', 1)
              })
              .orWhere((builder) => {
                builder.whereIn('position', ['MF', 'DMF']).andWhere('PositionRank', '<=', 2)
              })
              .orWhere((builder) => {
                builder.where('position', '=', 'DOS').andWhere('PositionRank', '=', 1)
              })
              .orWhere((builder) => {
                builder.whereIn('position', ['LB', 'RB']).andWhere('PositionRank', '=', 1)
              })
              .orWhere((builder) => {
                builder.where('position', '=', 'GK').andWhere('PositionRank', '=', 1)
              })
              .orWhere((builder) => {
                builder.where('position', '=', 'STP').andWhere('PositionRank', '<=', 2)
              });
          });
        })
        .select('player_name', 'drafter_name', 'video_id', 'position')
        .from('RankedPlayers');

        break;
      case 'drafter_name':
        const drafterExists = await db
          .select('drafter_name')
          .from('player_stats')
          .where('drafter_name', '=', value)
          .first();
        if (!drafterExists) {
          res.status(400).json({ error: 'Drafter does not exist' });
          return;
        }
        query = await db
          .select('*')
          .from('player_stats')
          .where('drafter_name', '=', value);
        break;
          default:
            res.status(400).json({ error: 'Invalid search type' });
            return;
        }
    res.json(query);
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

// Bera: Top 5 Players by Combined Performance Score
app.get('/api/best-players-performance', async (req, res) => {
  try {
    const results = await db.raw(`
      WITH PlayerPerformance AS (
        SELECT
            ps.player_name,
            players.photo,
            players.team,
            AVG(ps.Total_Assist / ps.Total_Match) AS avg_assists_per_match,
            AVG(ps.Total_Goal / ps.Total_Match) AS avg_goals_per_match,
            ROW_NUMBER() OVER (ORDER BY (AVG(ps.Total_Assist / ps.Total_Match) + AVG(ps.Total_Goal / ps.Total_Match)) DESC) AS row_num
        FROM
            player_stats ps
            LEFT JOIN players ON ps.player_name = players.name
        WHERE
            ps.player_name NOT IN (SELECT player_name FROM player_stats WHERE Assist_King > 0)
            AND ps.player_name NOT IN (SELECT player_name FROM player_stats WHERE Goal_King > 0)
            AND             ps.Total_Match > 10
        GROUP BY
            ps.player_name, players.photo, players.team
      )
      SELECT
          player_name,
          photo,
          team,
          (avg_assists_per_match + avg_goals_per_match) AS total_score
      FROM
          PlayerPerformance
      WHERE
          row_num <= 5 
      ORDER BY
          total_score DESC;
    `);
    res.json(results[0]);
  } catch (error) {
    console.error(error);
    res.status(500).send('Internal Server Error');
  }
});

// Sedef: Champions League Triumph: Leading Assist Provider's Position (check)
app.get('/api/top-assists-players', async (req, res) => {
  try {
    const results = await db.raw(`
    WITH ChampionshipTeams AS (
      SELECT
        video_id,
        video_winner AS team_name
      FROM
        draft_result
      WHERE
        Ugur_ŞL = 'ŞL Şampiyon' OR Arden_ŞL = 'ŞL Şampiyon' OR Onur_ŞL = 'ŞL Şampiyon'
    ),
    TopAssistPlayers AS (
      SELECT
        ps.video_id,
        ps.drafter_name,
        ps.player_name,
        p.position,
        p.photo,
        RANK() OVER (PARTITION BY ps.video_id, ps.drafter_name ORDER BY ps.Total_Assist DESC) AS AssistRank
      FROM
        player_stats ps
      JOIN
        players p ON ps.player_name = p.name
      WHERE
        ps.Total_Assist IS NOT NULL
    )
    SELECT
      t.video_id,
      t.drafter_name,
      t.player_name,
      t.position,
      t.photo,
      t.AssistRank
    FROM
      TopAssistPlayers t
    JOIN
      ChampionshipTeams c ON t.video_id = c.video_id AND t.drafter_name = c.team_name
    WHERE
      t.AssistRank = 1;
    `);
    res.json(results[0]);
  } catch (error) {
    console.error(error);
    res.status(500).send('Internal Server Error');
  }
});

// Sedef: Non-SNT Top Scorers: Unconventional Team Success (check)
app.get('/api/team-top-scorers', async (req, res) => {
  try {
    const results = await db.raw(`
      WITH TeamTopScorers AS (
        SELECT
          t.name AS team_name,
          ps.player_name,
          ps.Total_Goal,
          p.photo -- Assuming 'photo' is the column for player photos
        FROM
          teams t
        JOIN
          players p ON t.name = p.team
        JOIN
          player_stats ps ON p.name = ps.player_name
        WHERE
          p.position NOT IN ('SNT', 'ST') AND ps.Total_Goal IS NOT NULL
        ORDER BY
          t.name, ps.Total_Goal DESC
      )
      , RankedTeamTopScorers AS (
        SELECT
          team_name,
          player_name AS top_scorer,
          Total_Goal,
          photo,
          ROW_NUMBER() OVER (PARTITION BY team_name ORDER BY Total_Goal DESC) AS ScorerRank
        FROM
          TeamTopScorers
      )
      SELECT
        team_name,
        top_scorer,
        Total_Goal,
        photo
      FROM
        RankedTeamTopScorers
      WHERE
        ScorerRank = 1
      ORDER BY
        Total_Goal DESC
      LIMIT 5;
    `);
    res.json(results[0]);
  } catch (error) {
    console.error(error);
    res.status(500).send('Internal Server Error');
  }
});

// Bera: Goal Scoring Disparity: SNT vs. STP Players (check)
app.get('/api/striker-comparison', async (req, res) => {
  try {
      const results = await db.raw(`
          WITH StrikerComparison AS (
              SELECT
                  st.player_name AS st_player,
                  st.drafter_name AS st_drafter,
                  st.Total_Goal AS st_goals,
                  st.Total_Match AS st_matches,
                  stp.player_name AS stp_player,
                  stp.drafter_name AS stp_drafter,
                  stp.Total_Goal AS stp_goals,
                  stp.Total_Match AS stp_matches,
                  players.photo AS photo,
                  players.team AS team
              FROM
                  player_stats st
              JOIN
                player_stats stp
                ON st.team = stp.team
                AND st.player_name != stp.player_name
                AND stp.player_name IN (SELECT name FROM players WHERE position IN ('MF'))
                AND st.Total_Goal/st.Total_Match < stp.Total_Goal/stp.Total_Match
              JOIN
                  players ON st.player_name = players.name
              WHERE
                  players.position = 'ST'
          )
          SELECT
              st_player,
              st_drafter,
              st_goals,
              st_matches,
              stp_player,
              stp_drafter,
              stp_goals,
              stp_matches,
              photo,
              team
          FROM
              StrikerComparison;
      `);

      res.json(results[0]);
  } catch (error) {
      console.error(error);
      res.status(500).send('Internal Server Error');
  }
});


app.listen(PORT, () => {
  console.log(`You are launching the server`);
  console.log(`Server is running on http://localhost:${PORT}`);
  console.log(`In case of any modification, please restart the server Ctrl + C and run again npm run dev`);
});
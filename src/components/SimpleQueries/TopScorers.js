import React, { useState, useEffect } from 'react';
import axios from 'axios';

const TopScorers = () => {
  const [topScorers, setTopScorers] = useState([]);

  useEffect(() => {
    async function fetchTopScorers() {
      try {
        const response = await axios.get('http://localhost:3001/api/top-scorers');
        setTopScorers(response.data);
      } catch (error) {
        console.error(error);
      }
    }

    fetchTopScorers();
  }, []);

  useEffect(() => {
    console.log(topScorers.map(player => player.video_id));
  }, [topScorers]);

  return (
    <div className="mb-8">
    <h2 className="text-3xl font-bold mb-4">Top 5 Scorers</h2>
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4">
      {topScorers.map((player) => (
        <div key={player.video_id} className="bg-white p-4 rounded-md shadow-md">
          <p className="text-xl font-semibold">{player.player_name}</p>
          <p>Total Goals: {player.Total_Goal}</p>
          <p>Drafted by: {player.drafter_name}</p>
        </div>
      ))}
    </div>
  </div>
  );
};

export default TopScorers;

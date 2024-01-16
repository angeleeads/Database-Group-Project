// src/components/TopAssists.js

import React, { useState, useEffect } from 'react';
import axios from 'axios';

const TopAssists = () => {
  const [topAssists, setTopAssists] = useState([]);

  useEffect(() => {
    async function fetchTopAssists() {
      try {
        const response = await axios.get('http://localhost:3001/api/top-assists');
        setTopAssists(response.data);
      } catch (error) {
        console.error(error);
      }
    }

    fetchTopAssists();
  }, []);

  // Log video_id values to check for duplicates
  useEffect(() => {
    console.log(topAssists.map(player => player.video_id));
  }, [topAssists]);

  return (
    <div className="mb-8">
    <h2 className="text-3xl font-bold mb-4">Top 5 Assists</h2>
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4">
      {topAssists.map((player) => (
        <div key={player.video_id} className="bg-white p-4 rounded-md shadow-md">
          <p className="text-xl font-semibold">{player.player_name}</p>
          <p>Total Assists: {player.Total_Assist}</p>
          <p>Drafted by: {player.drafter_name}</p>
        </div>
      ))}
    </div>
  </div>
  );
};

export default TopAssists;

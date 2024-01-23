import React, { useState, useEffect } from 'react';
import axios from 'axios';

const TopAssistPlayers = () => {
  const [topAssistPlayers, setTopAssistPlayers] = useState([]);
  const [showCards, setShowCards] = useState(true);

  useEffect(() => {
    async function fetchTopAssistPlayers() {
      try {
        const response = await axios.get('http://localhost:3001/api/top-assists-players');
        setTopAssistPlayers(response.data);
      } catch (error) {
        console.error(error);
      }
    }

    fetchTopAssistPlayers();
  }, []);

  const toggleCards = () => {
    setShowCards(!showCards);
  };

  return (
    <div className="mb-8">
      <h2 className="text-3xl font-bold mb-4 flex items-center text-gray-800" onClick={toggleCards}>
        Champions League Triumph: Leading Assist Provider's Position
        <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5 ml-2" viewBox="0 0 20 20" fill="currentColor">
          <path fillRule="evenodd" d="M10 14.586L3.707 8.293a1 1 0 011.414-1.414L10 11.586l4.879-4.879a1 1 0 111.414 1.414L10 14.586z" clipRule="evenodd" />
        </svg>
      </h2>
      {showCards && (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-5 gap-5">
          {topAssistPlayers.map((player, index) => (
            <div key={index} className="bg-white p-4 rounded-md shadow-md transform hover:scale-105 transition-transform">
              <img
                src={player.photo}
                alt={`Player ${player.player_name}`}
                className="w-full h-96 object-cover rounded-md mb-4"
              />
              <div className="text-center">
                <p className="text-xl font-semibold">{player.player_name}</p>
                <p className="text-gray-600">Team: {player.team}</p>
                <p className="text-gray-600">Assist Rank: {player.AssistRank}</p>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
};

export default TopAssistPlayers;

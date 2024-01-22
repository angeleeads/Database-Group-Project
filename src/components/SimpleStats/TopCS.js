import React, { useState, useEffect } from 'react';
import axios from 'axios';

const TopCS = () => {
  const [topCS, setTopCS] = useState(null);
  const [showCards, setShowCards] = useState(false);

  useEffect(() => {
    const fetchTopCS = async () => {
      try {
        const response = await axios.get(`http://localhost:3001/api/top-cs`);
        setTopCS(response.data);
      } catch (error) {
        console.error(error);
      }
    };

    fetchTopCS();
  }, []);

  const toggleCards = () => {
    setShowCards(!showCards);
  };
  
  const handleCardClick = (url) => {
    window.open(url, '_blank');
  };

  return (
    <div className="mb-8">
      <h2 className="text-3xl font-bold mb-4 flex items-center text-gray-200" onClick={toggleCards}>
        Top 5 CS
        <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5 ml-2" viewBox="0 0 20 20" fill="currentColor">
          <path fillRule="evenodd" d="M10 14.586L3.707 8.293a1 1 0 011.414-1.414L10 11.586l4.879-4.879a1 1 0 111.414 1.414L10 14.586z" clipRule="evenodd" />
        </svg>
      </h2>
      {showCards && (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-5 gap-5">
          {topCS.map((player, index) => (
            <div key={index} onClick={() => handleCardClick(player.url)} className="bg-white p-4 rounded-md shadow-md transform hover:scale-105 transition-transform">
              <img
                src={player.photo}
                alt={`Drafter ${player.player_name}`}
                className="w-full h-96 object-cover rounded-md mb-4"
              />
              <div className="text-center">
                <p className="text-xl font-semibold">{player.player_name}</p>
                <p className="text-gray-600">Total CS: {player.Total_CS}</p>
                <p className="text-gray-600">Drafted by: {player.drafter_name}</p>
                <p className="text-gray-600">Player's team: {player.team}</p>
                <p className="text-gray-600">Video ID: {player.video_id}</p>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
};

export default TopCS;

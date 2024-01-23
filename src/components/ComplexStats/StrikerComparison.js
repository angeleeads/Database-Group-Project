import React, { useState, useEffect } from 'react';
import axios from 'axios';

const StrikerComparison = () => {
  const [StrikerComparison, setStrikerComparison] = useState(null);
  const [showCards, setShowCards] = useState(false);

  useEffect(() => {
    const fetchStrikerComparison = async () => {
      try {
        const response = await axios.get('http://localhost:3001/api/striker-comparison');
        setStrikerComparison(response.data);
      } catch (error) {
        console.error(error.response);
      }
    };
  
    fetchStrikerComparison();
  }, []);

  const toggleCards = () => {
    setShowCards(!showCards);
  };

  return (
    <div className="mb-8">
      <h2 className="text-3xl font-bold mb-4 flex items-center text-gray-800" onClick={toggleCards}>
        Goal Scoring Disparity: ST vs. MF Players
        <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5 ml-2" viewBox="0 0 20 20" fill="currentColor">
          <path fillRule="evenodd" d="M10 14.586L3.707 8.293a1 1 0 011.414-1.414L10 11.586l4.879-4.879a1 1 0 111.414 1.414L10 14.586z" clipRule="evenodd" />
        </svg>
      </h2>
      {showCards && (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-5 gap-5">
          {StrikerComparison.map((player, index) => (
            <div key={index} className="bg-white p-4 rounded-md shadow-md transform hover:scale-105 transition-transform">
              <img
                src={player.photo}
                alt={`Player ${player.st_player}`}
                className="w-full h-96 object-cover rounded-md mb-4"
              />
              <div className="text-center">
                <p className="text-xl font-semibold">ST: {player.st_player}</p>
                <p className="text-gray-600">Team: {player.team}</p>
                <p className="text-gray-600">MF: {player.st_player}</p>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
};

export default StrikerComparison;
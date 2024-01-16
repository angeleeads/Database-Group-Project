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

  function getDrafterImage(drafterName) {
    switch (drafterName) {
      case 'Ugur':
        return 'https://img-s1.onedio.com/id-6226186bde2e607f131464d3/rev-0/w-600/h-600/f-jpg/s-098d0da28937f34cba74ba5246f951c0a44ecd06.jpg';
      case 'Arden':
        return 'https://yt3.googleusercontent.com/3j6Lwn5i8CF5f51fXV84uYo_Q_AMRJxmhMcLEUgiATtg0y78tGxRlYJsx7gLkOUjsQExRDfEGmc=s176-c-k-c0x00ffffff-no-rj';
      case 'Onur':
        return 'https://pbs.twimg.com/profile_images/1564676322080788480/1tDCSJB-_400x400.jpg';
      default:
        return 'https://upload.wikimedia.org/wikipedia/commons/b/b2/HarryStylesWembley170623_%2865_of_93%29_%2852982678051%29_%28cropped_2%29.jpg';
    }
  }

  const handleCardClick = (url) => {
    window.open(url, '_blank');
  };

  return (
    <div className="mb-8">
      <h2 className="text-3xl font-bold mb-4 flex items-center text-gray-800" onClick={toggleCards}>
        Top 5 CS
        <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5 ml-2" viewBox="0 0 20 20" fill="currentColor">
          <path fillRule="evenodd" d="M10 14.586L3.707 8.293a1 1 0 011.414-1.414L10 11.586l4.879-4.879a1 1 0 111.414 1.414L10 14.586z" clipRule="evenodd" />
        </svg>
      </h2>
      {showCards && (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-5 gap-5">
          {topCS.map((player) => (
            <div key={player.video_id} onClick={() => handleCardClick(player.url)} className="bg-white p-4 rounded-md shadow-md transform hover:scale-105 transition-transform">
              <img
                src={getDrafterImage(player.drafter_name)}
                alt={`Drafter ${player.drafter_name}`}
                className="w-full h-96 object-cover rounded-md mb-4"
              />
              <p className="text-xl font-semibold">{player.player_name}</p>
              <p>Total CS: {player.Total_CS}</p>
              <p>Drafted by: {player.drafter_name}</p>
              <p>Video ID: {player.video_id}</p>
            </div>
          ))}
        </div>
      )}
    </div>
  );
};

export default TopCS;

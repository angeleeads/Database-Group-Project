import React from 'react';

const PlayersCards = ({ player_name, club, image_url}) => {
    return (
        <div className="bg-gray-700 rounded-lg p-6 transform hover:scale-105 transition-transform">
            <img src={image_url} alt={player_name} className="rounded-lg mb-4 w-96 h-96" />
            <h3 className="text-xl font-bold mb-2">{player_name}</h3>
            <p>{club}</p>
        </div>
    );
};

export default PlayersCards;

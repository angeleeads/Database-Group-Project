import React from 'react';
import TopPlayersOnur from '../components/ComplexStats/TopPlayersOnur';
import TopPlayersArden from '../components/ComplexStats/TopPlayersArden';
import TopPlayersUgur from '../components/ComplexStats/TopPlayersUgur';

const ComplexStats = () => {
  return (
    <div>
      <h2 className="text-3xl font-bold text-gray-900 text-center mb-9">List of Complex Stats</h2>
      <ul>
        <TopPlayersOnur />
        <TopPlayersArden />
        <TopPlayersUgur />
      </ul>
    </div>
  );
};

export default ComplexStats;

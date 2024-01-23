import React from 'react';
import StrikerComparison from '../components/ComplexStats/StrikerComparison';
import TopAssistPlayers from '../components/ComplexStats/TopAssistsPlayers';
import TeamTopScorers from '../components/ComplexStats/TeamTopScorers';
import BestPlayersPerformance from '../components/ComplexStats/BestPlayersPerformance';

const ComplexStats = () => {
  return (
    <div>
      <h2 className="text-3xl font-bold text-gray-900 text-center mb-9">List of Complex Stats</h2>
      <ul>
        <StrikerComparison />
        <TopAssistPlayers />
        <BestPlayersPerformance />
        <TeamTopScorers />
      </ul>
    </div>
  );
};

export default ComplexStats;

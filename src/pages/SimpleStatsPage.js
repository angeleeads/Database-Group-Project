import React from 'react';
import TopScorers from '../components/SimpleStats/TopScorers';
import TopAssists from '../components/SimpleStats/TopAssists';
import TopCS from '../components/SimpleStats/TopCS';
import TopPerformance from '../components/SimpleStats/TopPerformance';
import TopPlayersOnur from '../components/SimpleStats/TopPlayersOnur';
import TopPlayersArden from '../components/SimpleStats/TopPlayersArden';
import TopPlayersUgur from '../components/SimpleStats/TopPlayersUgur';

const SimpleStats = () => {

  return (
    <div className="bg-gray-700">
      <h2 className="text-3xl font-bold text-gray-200 text-center mb-9">List of Simple Stats</h2>
      <ul>
        <TopScorers />
        <TopAssists />
        <TopPerformance />
        <TopCS />
        <TopPlayersOnur />
        <TopPlayersArden />
        <TopPlayersUgur />
      </ul>
    </div>
  );
};

export default SimpleStats;

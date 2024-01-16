import React from 'react';
import TopScorers from '../components/SimpleStats/TopScorers';
import TopAssists from '../components/SimpleStats/TopAssists';
import TopCS from '../components/SimpleStats/TopCS';
import TopPerformance from '../components/SimpleStats/TopPerformance';

const SimpleStats = () => {

  return (
    <div>
      <h2 className="text-3xl font-bold text-gray-900 text-center mb-9">List of Simple Stats</h2>
      <ul>
        <TopScorers />
        <TopAssists />
        <TopPerformance />
        <TopCS />
      </ul>
    </div>
  );
};

export default SimpleStats;

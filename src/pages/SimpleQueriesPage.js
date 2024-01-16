import React from 'react';
import TopScorers from '../components/SimpleQueries/TopScorers';
import TopAssists from '../components/SimpleQueries/TopAssists';

const SimpleQueries = () => {

  return (
    <div>
      <h2 className="text-3xl font-bold mb-4">List of Simple Queries</h2>
      <ul>
        <TopScorers />
        <TopAssists />
      </ul>
    </div>
  );
};

export default SimpleQueries;

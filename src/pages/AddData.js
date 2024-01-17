import React, { useState } from 'react';

const AddData = () => {
  const [playerName, setPlayerName] = useState('');
  const [teamName, setTeamName] = useState('');
  const [position, setPosition] = useState('');

  const handleAddPlayer = async () => {
    try {
      await fetch('/api/add-player', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ playerName, teamName, position }),
      });

      setPlayerName('');
      setTeamName('');
      setPosition('');
    } catch (error) {
      console.error('Error adding player:', error);
    }
  };

  return (
    <div>
      <h2>Add New Player</h2>
      <div>
        <label>Player Name:</label>
        <input type="text" value={playerName} onChange={(e) => setPlayerName(e.target.value)} />
      </div>
      <div>
        <label>Team Name:</label>
        <input type="text" value={teamName} onChange={(e) => setTeamName(e.target.value)} />
      </div>
      <div>
        <label>Position:</label>
        <input type="text" value={position} onChange={(e) => setPosition(e.target.value)} />
      </div>
      <button onClick={handleAddPlayer}>Add Player</button>
    </div>
  );
};

export default AddData;

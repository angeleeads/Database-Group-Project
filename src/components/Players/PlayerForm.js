import React, { useState, useEffect } from 'react';

const PlayerForm = () => {
    const [name, setName] = useState('');
    const [team, setTeam] = useState('');
    const [position, setPosition] = useState('');
    const [players, setPlayers] = useState([]);
    const [nameSuggestions, setNameSuggestions] = useState([]);
    const [teamSuggestions, setTeamSuggestions] = useState([]);
    const [error, setError] = useState('');
    const [successMessage, setSuccessMessage] = useState('');
    const [positionSuggestions, setPositionSuggestions] = useState([]);

    useEffect(() => {
        const fetchSuggestions = async (url, setSuggestions) => {
            try {
                const response = await fetch(url);
                const data = await response.json();
                setSuggestions(data);
            } catch (error) {
                setError('Error fetching suggestions: ' + error.message);
            }
        };
        fetchSuggestions('http://localhost:3001/player-names', setNameSuggestions);
        fetchSuggestions('http://localhost:3001/team-names', setTeamSuggestions);
        fetchSuggestions('http://localhost:3001/positions', setPositionSuggestions);
    }, []);

    const handleNameChange = (e) => {
        setName(e.target.value);
    };

    const handleTeamChange = (e) => {
        setTeam(e.target.value);
    };

    const handlePositionChange = (e) => {
        setPosition(e.target.value);
    };

    const handleAddPlayer = async (e) => {
        e.preventDefault();
        try {
            if (!name || !team || !position) {
                setError('Please fill in all fields');
                setTimeout(() => setError(''), 3000);
                return;
            } if (nameSuggestions.includes(name)) {
                setError('Player name already exists');
                setTimeout(() => setError(''), 3000);
                return;
            } if (!positionSuggestions.includes(position)) {
                setError('This position is not valid');
                setTimeout(() => setError(''), 3000);
                return;
            }
            await fetch('http://localhost:3001/api/add-players', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ name, team, position }),
                
            });
            setPlayers([...players, { name, team, position }]);
            setSuccessMessage('Player added successfully');
            setTimeout(() => setSuccessMessage(''), 3000);
        } catch (error) {
            setError('Error adding player: ' + error.message);
            setTimeout(() => setError(''), 3000);
        }
    };
    return (
        <div>
            <form
                className="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4"
                onSubmit={handleAddPlayer}>
                <div className="flex flex-center mb-5 mt-5">
                    {error && <p className="text-white bg-red-400 font-bold rounded-md pl-3 pr-3">{error}</p>}
                    {successMessage && <p className="text-white bg-green-400 font-bold rounded-md pl-3 pr-3">{successMessage}</p>}
                </div>

                <div className="mb-4">
                    <label className="block text-gray-700 text-sm font-bold mb-2" htmlFor="name">
                        Player's Name
                    </label>
                    <input
                        className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                        id="name"
                        type="text"
                        placeholder="Enter player's name"
                        value={name}
                        onChange={handleNameChange}
                        list="nameSuggestions"
                    />
                    <datalist id="nameSuggestions">
                        {nameSuggestions.map((suggestion, index) => (
                            <option key={index} value={suggestion} />
                        ))}
                    </datalist>
                </div>
                <div className="mb-4">
                    <label className="block text-gray-700 text-sm font-bold mb-2" htmlFor="team">
                        Player's Team
                    </label>
                    <input
                        className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                        id="team"
                        type="text"
                        placeholder="Enter player's team"
                        value={team}
                        onChange={handleTeamChange}
                        list="teamSuggestions"
                    />
                    <datalist id="teamSuggestions">
                        {teamSuggestions.map((suggestion, index) => (
                            <option key={index} value={suggestion} />
                        ))}
                    </datalist>
                </div>
                <div className="mb-4">
                    <label className="block text-gray-700 text-sm font-bold mb-2" htmlFor="position">
                        Player's Position
                    </label>
                    <input
                        className="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                        id="position"
                        type="text"
                        placeholder="Enter player's position"
                        value={position}
                        onChange={handlePositionChange}
                        list="positionSuggestions"
                    />
                    <datalist id="positionSuggestions">
                        {positionSuggestions.map((suggestion, index) => (
                            <option key={index} value={suggestion} />
                        ))}
                    </datalist>
                </div>
                <div className="flex items-center justify-between">
                    <button
                        className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                        type="submit">
                        Add Player
                    </button>
                </div>
            </form>
        </div>
    );
};

export default PlayerForm;
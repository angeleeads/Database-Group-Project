import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faArrowLeft, faArrowRight } from '@fortawesome/free-solid-svg-icons';

const AddPlayerPage = () => {
    const [name, setName] = useState('');
    const [team, setTeam] = useState('');
    const [position, setPosition] = useState('');
    const [players, setPlayers] = useState([]);
    const [showForm, setShowForm] = useState(false);
    const [nameSuggestions, setNameSuggestions] = useState([]);
    const [teamSuggestions, setTeamSuggestions] = useState([]);
    const [positionSuggestions, setPositionSuggestions] = useState([]);
    const [playersData, setPlayersData] = useState([]);
    const [currentPage, setCurrentPage] = useState(1);
    const [perPage] = useState(30);
    const [error, setError] = useState('');

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
    
    useEffect(() => {
        const fetchPlayersData = async () => {
            try {
                const response = await axios.get('http://localhost:3001/api/players-data');
                setPlayersData(response.data);
            } catch (error) {
                setError('Error fetching players: ' + error.message);
            }
        };
        fetchPlayersData();
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

    const handleAddPlayer = async () => {
        try {
            if (!name || !team || !position) {
                setError('Please fill in all fields');
                return;
            } if (nameSuggestions.includes(name)) {
                setError('Player name already exists');
                return;
            }
            await fetch('http://localhost:3001/api/add-players', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ name, team, position }),
                
            });
            console.log(name, position, team);
            setPlayers([...players, { name, team, position }]);
        } catch (error) {
            setError('Error adding player: ' + error.message);
        }
    };

    const handleDelete = (index) => {
        const updatedPlayers = [...players];
        updatedPlayers.splice(index, 1);
        setPlayers(updatedPlayers);
    };

    const indexOfLastPlayer = currentPage * perPage;
    const indexOfFirstPlayer = indexOfLastPlayer - perPage;
    const currentPlayers = playersData.slice(indexOfFirstPlayer, indexOfLastPlayer);

    const paginate = (pageNumber) => setCurrentPage(pageNumber);

    return (
        <div className="flex flex-col h-screen bg-gray-100">
            <div className="flex justify-end p-4">
                <button
                    className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                    onClick={() => setShowForm(!showForm)}>
                    {showForm ? '-' : '+'}
                </button>
            </div>
            {showForm && (
                <form
                    className="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4"
                    onSubmit={handleAddPlayer}>
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
            )}
            {error && <p className="text-red-500">{error}</p>}
            <div className="flex flex-col items-center">
                <h2 className="text-xl font-bold mb-4">List of Players</h2>
                {currentPlayers.length > 0 ? (
                    <div className="grid grid-cols-5 gap-4">
                        {currentPlayers.map((player, index) => (
                            <div key={index} className="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
                                <span className="font-bold">{player.name}</span> - {player.team} - {player.position}
                                <button
                                    className="ml-2 text-red-500 hover:text-red-700"
                                    onClick={() => handleDelete(index)}
                                >
                                    Delete
                                </button>
                            </div>
                        ))}
                    </div>
                ) : (
                    <p>No players added yet.</p>
                )}
                <div className="flex mt-4">
                    <button
                        className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-l focus:outline-none focus:shadow-outline"
                        onClick={() => paginate(currentPage - 1)}
                        disabled={currentPage === 1}>
                        <FontAwesomeIcon icon={faArrowLeft} />
                    </button>
                    <button
                        className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-r focus:outline-none focus:shadow-outline"
                        onClick={() => paginate(currentPage + 1)}
                        disabled={currentPlayers.length < perPage}>
                        <FontAwesomeIcon icon={faArrowRight} />
                    </button>
                </div>
            </div>
        </div>
    );
};

export default AddPlayerPage;

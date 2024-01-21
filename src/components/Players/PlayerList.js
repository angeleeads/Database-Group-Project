import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faArrowLeft, faArrowRight } from '@fortawesome/free-solid-svg-icons';

const PlayerList = () => {   
    const [playersData, setPlayersData] = useState([]);
    const [currentPage, setCurrentPage] = useState(1);
    const [players, setPlayers] = useState([]);
    const [perPage] = useState(30);
    const [error, setError] = useState('');

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

    const handleDelete = async (player) => {
        try {
            await axios.delete('http://localhost:3001/api/delete-player', {
                params: player
            });
            const updatedPlayers = players.filter(p =>
                !(p.name === player.name && p.team === player.team && p.position === player.position)
            );
            setPlayers(updatedPlayers);
        } catch (error) {
            setError('Error deleting player: ' + error.message);
        }
    };
    const indexOfLastPlayer = currentPage * perPage;
    const indexOfFirstPlayer = indexOfLastPlayer - perPage;
    const currentPlayers = playersData.slice(indexOfFirstPlayer, indexOfLastPlayer);

    const paginate = (pageNumber) => setCurrentPage(pageNumber);
    return (
        <div className="flex flex-col items-center">
                <h2 className="text-xl font-bold mb-4">List of Players</h2>
                {error && <p className="text-white bg-red-400 text-xl font-bold w-64 text-center">{error}</p>}
                {currentPlayers.length > 0 ? (
                    <div className="grid grid-cols-5 gap-4">
                        {currentPlayers.map((player, index) => (
                            <div key={index} className="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
                                <span className="font-bold">{player.name}</span> - {player.team} - {player.position}
                                <button
                                    className="ml-2 text-red-500 hover:text-red-700"
                                    onClick={() => handleDelete(player)}
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
    );
};

export default PlayerList;
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faArrowLeft, faArrowRight } from '@fortawesome/free-solid-svg-icons';

const PlayerList = () => {   
    const [playersData, setPlayersData] = useState([]);
    const [currentPage, setCurrentPage] = useState(1);
    const [players, setPlayers] = useState([]);
    const [perPage] = useState(20);
    const [successMessage, setSuccessMessage] = useState('');
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
        const shouldDelete = window.confirm(`Are you sure you want to delete ${player.name}?`);

        if (!shouldDelete) {
        return;
        }
        try {
            await axios.delete('http://localhost:3001/api/delete-player', {
                params: player
            });
            const updatedPlayers = playersData.filter(p =>
                !(p.name === player.name && p.team === player.team && p.position === player.position)
            );
            setPlayers(updatedPlayers);
            setSuccessMessage('Player deleted successfully');
            setTimeout(() => setSuccessMessage(''), 3000);
        } catch (error) {
            setError('Error deleting player: ' + error.message);
            setTimeout(() => setError(''), 3000);
        }
    };
    
    const indexOfLastPlayer = currentPage * perPage;
    const indexOfFirstPlayer = indexOfLastPlayer - perPage;
    const currentPlayers = playersData.slice(indexOfFirstPlayer, indexOfLastPlayer);

    const paginate = (pageNumber) => setCurrentPage(pageNumber);
    return (
        <div className="flex flex-col items-center bg-gray-700">
            <h2 className="text-3xl font-bold mb-4 text-gray-200">List of Players</h2>
            {error && <p className="text-white bg-red-400 text-xl font-bold text-center">{error}</p>}
            {successMessage && <p className="text-white bg-green-400 text-xl font-bold text-center">{successMessage}</p>}
            {currentPlayers.length > 0 ? (
                <div className="grid grid-cols-5 gap-4">
                    {currentPlayers.map((player, index) => (
                        <div key={index} className="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4 relative">
                            <div className="relative">
                                <img src={player.photo} alt={player.name} className="w-64 h-64 object-cover rounded-lg" />
                            </div>
                            <div className="text-center">
                                <h3 className="text-lg font-bold">{player.name}</h3>
                                <p className="text-gray-500">{player.team}</p>
                                <p className="text-gray-500">{player.position}</p>
                            </div>
                            <button className="absolute bottom-0 right-0 mb-2 mr-2 text-red-500 hover:text-red-700" onClick={() => handleDelete(player)}>
                                <svg height="42" viewBox="0 0 48 48" width="42" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M0 0h48v48H0V0z" fill="none"/>
                                    <path d="M12 38c0 2.2 1.8 4 4 4h16c2.2 0 4-1.8 4-4V14H12v24zm4.93-14.24l2.83-2.83L24 25.17l4.24-4.24 2.83 2.83L26.83 28l4.24 4.24-2.83 2.83L24 30.83l-4.24 4.24-2.83-2.83L21.17 28l-4.24-4.24zM31 8l-2-2H19l-2 2h-7v4h28V8z" fill="#ff6666"/>
                                </svg>
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
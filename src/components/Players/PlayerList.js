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

    const handleEdit = async (player) => {
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
                            <div className="absolute bottom-0 left-0 mb-2 ml-2">
                                <button className="text-blue-500 hover:text-blue-700" onClick={() => handleEdit(player)}>
                                    <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 12a3 3 0 11-6 0 3 3 0 016 0zm0 0v8m0 0H9m6 0h.01" />
                                    </svg>
                                </button>
                            </div>
                            <button className="absolute bottom-0 right-0 mb-2 mr-2 text-red-500 hover:text-red-700" onClick={() => handleDelete(player)}>
                                <svg xmlns="http://www.w3.org/2000/svg" className="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 6l3 18h12l3-18H3zm0 0l.879-5h16.242L21 6M16 10v6M8 10v6" />
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
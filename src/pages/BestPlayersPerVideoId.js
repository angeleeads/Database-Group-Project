import React, { useState } from 'react';
import axios from 'axios';

const BestPlayersPerVideoId = () => {
    const [searchType, setSearchType] = useState('');
    const [searchValue, setSearchValue] = useState('');
    const [searchResult, setSearchResult] = useState([]);
    const [error, setError] = useState('');

    const handleSearch = async () => {
        try {
            setError('');
            if (searchType === 'video_id') {
                const videoId = parseInt(searchValue);
                if (isNaN(videoId) || videoId < 1 || videoId > 9) {
                    setError('Invalid video_i   d. Please enter a number between 1 and 9.');
                    return;
                }
            }
            const response = await axios.get('http://localhost:3001/api/best-players-per-video-id', {
                params: { type: searchType, value: searchValue },
            });
            setSearchResult(response.data);
            console.log(searchValue);
            console.log(searchType);
        } catch (error) {
            console.error(error);
            setError('An error occurred. Please try again.');
        }
    };

    return (
        <div className="container mx-auto mt-8">
            <div className="flex items-center w-full">
                <select
                    className="border p-2 rounded-md bg-slate-300"
                    onChange={(e) => setSearchType(e.target.value)}>
                    <option value="video_id">Video ID</option>
                </select>
                <input
                    type="text"
                    className="border p-2 ml-2 rounded-md"
                    placeholder={`Enter ${searchType}...`}
                    value={searchValue}
                    onChange={(e) => setSearchValue(e.target.value)}
                />
                <button
                    className="bg-gray-800 text-white p-2 ml-2 rounded-md"
                    onClick={handleSearch}
                >
                    Search
                </button>
            </div>

            {error && <p className="text-red-500 mt-2">{error}</p>}

            <div className="mt-4">
                {searchResult.length > 0 ? (
                    <table className="table-auto mt-4">
                        <thead>
                            <tr>
                                {Object.keys(searchResult[0]).map((key) => (
                                    <th key={key} className="border p-2 bg-gray-800 text-white rounded-lg">
                                        {key}
                                    </th>
                                ))}
                            </tr>
                        </thead>
                        <tbody>
                            {searchResult.map((row, index) => (
                                <tr key={index}>
                                    {Object.values(row).map((value, index) => (
                                        <td key={index} className="border p-2">
                                            {value}
                                        </td>
                                    ))}
                                </tr>
                            ))}
                        </tbody>
                    </table>
                ) : (
                    <p>No results found.</p>
                )}
            </div>
        </div>
    );
};

export default BestPlayersPerVideoId;

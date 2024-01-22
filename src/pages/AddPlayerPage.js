import React, { useState } from 'react';
import PlayerForm from '../components/Players/PlayerForm';
import PlayerList from '../components/Players/PlayerList';

const AddPlayerPage = () => {
    const [showForm, setShowForm] = useState(false);
    
    return (
        <div className="flex flex-col h-screen bg-gray-700">
            <div className="flex justify-end p-4">
                <button
                    className="bg-gray-500 hover:bg-gray-900 text-white font-bold py-3 px-9 rounded focus:outline-none focus:shadow-outline"
                    onClick={() => setShowForm(!showForm)}>
                    {showForm ? '-' : '+'}
                </button>
            </div>
            {showForm && (
                <PlayerForm />
            )}
            <PlayerList />
        </div>
    );
};

export default AddPlayerPage;

import React, { useState, useEffect } from 'react';
import axios from 'axios';

const ComplexQueries = () => {
    const [data, setData] = useState([]);

    useEffect(() => {
        async function fetchData() {
        try {
            const response = await axios.get('http://localhost:3001/api/data');
            setData(response.data);
        } catch (error) {
            console.error(error);
        }
        }

        fetchData();
    }, []);

  return (
    <div className="container mx-auto mt-8">
        <h1 className="text-2xl font-bold mb-4">Welcome to the Football Website!</h1>
        <p className="text-gray-600">Discover the best football activities...</p>
        <ul>
            {data.map((item, index) => (
                <li key={item.id || index}>{item.name}</li>
            ))}
        </ul>
    </div>
  );
};

export default ComplexQueries;

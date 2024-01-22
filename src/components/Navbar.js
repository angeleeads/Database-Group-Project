import React, { useState } from 'react';
import { Link } from 'react-router-dom';

const Navbar = () => {
    const [isOpen, setIsOpen] = useState(false);

    const toggleMenu = () => {
        setIsOpen(!isOpen);
    };

    return (
        <nav className="bg-gray-800 p-4 text-white">
            <div className="container mx-auto flex justify-between items-center">
                <div className="flex items-center">
                    <img src="logo.png" alt="EA FC 24 Stats logo" className="pr-3"/>
                    <Link to="/" className={`text-2xl font-bold ${isOpen ? 'lg:mb-0' : 'lg:mb-0 mb-4'}`}>
                        EA FC 24 Stats
                    </Link>
                </div>

                <div className="lg:hidden">
                    <button onClick={toggleMenu} className="text-white focus:outline-none">
                        <svg
                            className="h-6 w-6"
                            fill="none"
                            stroke="currentColor"
                            viewBox="0 0 24 24"
                            xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                strokeLinecap="round"
                                strokeLinejoin="round"
                                strokeWidth="2"
                                d="M4 6h16M4 12h16m-7 6h7"
                            />
                        </svg>
                    </button>
                </div>

                <div className={`lg:flex ${isOpen ? 'mt-4 flex flex-col' : 'hidden'} lg:mt-0 lg:ml-4 pr-3`}>
                    <div className={`lg:block lg:mt-0 lg:ml-4 pr-3`}>
                        <Link to="/simple-stats" className="text-xl font-bold pr-4 hover:underline">Simple Stats</Link>
                        <Link to="/complex-stats" className="text-xl font-bold pr-4 hover:underline">Complex Stats</Link>
                        <Link to="/add-players" className="text-xl font-bold pr-4 hover:underline">Players</Link>
                        <Link to="/search" className="text-xl font-bold pr-4 hover:underline">Search</Link>
                    </div>
                </div>
            </div>
        </nav>
    );
};

export default Navbar;

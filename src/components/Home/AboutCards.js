import React from 'react';
import { Link } from 'react-router-dom';

const AboutCard = ({ path, title, text, image_url, alt_text }) => {
    return (
        <Link to={path} className="group bg-gray-800 rounded-lg overflow-hidden shadow-md flex items-center cursor-pointer transform hover:scale-105 transition-transform">
            <img src={image_url} alt={alt_text} className="w-full h-64 object-cover" />
            <div className="p-4 text-white text-center">
                <h3 className="text-xl font-bold mb-2 group-hover:underline">{title}</h3>
                <p>{text}</p>
            </div>
        </Link>
    );
};

export default AboutCard;

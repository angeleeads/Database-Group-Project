import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Navbar from './components/Navbar';
import HomePage from './pages/HomePage';
import SimpleStats from './pages/SimpleStatsPage';
import ComplexStats from './pages/ComplexStatsPage';
import AddPlayer from './pages/AddPlayerPage';
import SearchPage from './pages/SearchPage';

function App() {
  return (
    <Router className="bg-gray-700">
      <Navbar />
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/simple-stats" element={<SimpleStats />} />
        <Route path="/complex-stats" element={<ComplexStats />} />
        <Route path="/add-players" element={<AddPlayer />} />
        <Route path="/search" element={<SearchPage />} />
      </Routes>
    </Router>
  );
}

export default App;

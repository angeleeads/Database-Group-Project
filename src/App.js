import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Navbar from './components/Navbar';
import HomePage from './pages/HomePage';
import BestPlayers from './pages/BestPlayers';
import TeamsPage from './pages/TeamsPage';

function App() {
  return (
    <Router>
      <Navbar />
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/best-players" element={<BestPlayers />} />
        <Route path="/teams" element={<TeamsPage />} />
      </Routes>
    </Router>
  );
}

export default App;

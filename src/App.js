import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Navbar from './components/Navbar';
import HomePage from './pages/HomePage';
import SimpleStats from './pages/SimpleStatsPage';
import ComplexStats from './pages/ComplexStatsPage';

function App() {
  return (
    <Router>
      <Navbar />
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/simple-stats" element={<SimpleStats />} />
        <Route path="/complex-stats" element={<ComplexStats />} />
      </Routes>
    </Router>
  );
}

export default App;

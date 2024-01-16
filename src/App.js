import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Navbar from './components/Navbar';
import HomePage from './pages/HomePage';
import SimpleQueries from './pages/SimpleQueriesPage';
import ComplexQueries from './pages/ComplexQueriesPage';

function App() {
  return (
    <Router>
      <Navbar />
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/simple-queries" element={<SimpleQueries />} />
        <Route path="/complex-queries" element={<ComplexQueries />} />
      </Routes>
    </Router>
  );
}

export default App;

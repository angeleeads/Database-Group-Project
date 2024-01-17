import React from 'react';
import AboutCard from '../components/Home/AboutCards';
import PlayersCards from '../components/Home/PlayersCards';

const HomePage = () => {
  return (
    <div className="bg-gray-700 text-white min-h-screen">
      {/* Hero Section */}
      <section className="flex items-center justify-center h-screen bg-cover bg-center relative" style={{ backgroundImage: 'url("https://i.pinimg.com/originals/dd/b1/87/ddb18728a2772d3228ecaa8e83aa3c63.jpg")' }}>
        <div className="absolute inset-0 bg-black opacity-50"></div>
        <div className="text-center z-10">
          <h1 className="text-6xl font-bold mb-4">Welcome</h1>
          <p className="text-xl text-center">We are a comprehensive platform for managing and tracking "Üçlü Rebuild" football draft league</p>
          <p className="text-xl mb-8 text-center">including player statistics, draft results, and various league-related information, fostering a dynamic and interactive community around "Üçlü Rebuild".</p>
          <button className="bg-blue-500 text-white px-6 py-2 rounded-full">Get Started</button>
        </div>
      </section>

      {/* About Section */}
      <section className="container mx-auto my-16">
        <h2 className="text-3xl font-bold mb-8">About Us</h2>
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          <AboutCard path="/simple-stats" image_url="https://i.pinimg.com/originals/f1/15/33/f1153345cb7aa9503c9528e2f3bb1ca3.jpg" alt_text="simple pic" title="Simple queries" text="Description for simple queries"/>
          <AboutCard path="/complex-stats" image_url="https://i.pinimg.com/originals/a8/c3/38/a8c33859d466baaf1711a8c478f999e1.jpg" alt_text="complex pic" title="Complex queries" text="Description for complex queries"/>
        </div>
      </section>

      {/* Featured Players Section */}
      <section className="bg-gray-800 text-white py-16">
        <div className="container mx-auto text-center">
          <h2 className="text-3xl font-bold mb-8">Featured Players</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <PlayersCards image_url="https://i.pinimg.com/originals/d9/b0/66/d9b06688a2099a7ab6303233b2760e74.jpg" player_name="Alejo Veliz" club="Tottenham"/>
            <PlayersCards image_url="https://i.pinimg.com/originals/49/19/84/4919849afdf9e1f9ad13c5899d774891.jpg" player_name="Joel Matip" club="Liverpool"/>
            <PlayersCards image_url="https://i.pinimg.com/originals/0b/17/c9/0b17c93a60fa0912c120088d59a9afce.jpg" player_name="Alexia Putellas" club="FC Barcelona"/>
          </div>
        </div>
      </section>
    </div>
  );
};

export default HomePage;

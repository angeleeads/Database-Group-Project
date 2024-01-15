# Football Website Project

## Getting Started

### Prerequisites

- Node.js installed (version 14.x recommended)
- npm (Node Package Manager) installed

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/football-website.git
   ```

2. Navigate to the project directory:

   ```bash
   cd football-website
   ```

3. Install dependencies:

   ```bash
   npm install
   ```

### Database Migration

The project uses Knex.js for database migrations. Ensure you have a PostgreSQL database set up. Update the `knexfile.js` configuration file with your database connection details.

1. Run migrations to create the necessary tables:

   ```bash
   npm run migrate:latest
   ```

   This will apply any pending migrations and set up the database.

### Running the Application

1. Start the server:

   ```bash
   npm start
   ```

   The server will run on http://localhost:3001.

2. Start the React application:

   ```bash
   npm run start:client
   ```

   The React app will run on http://localhost:3000.

3. Open your web browser and visit http://localhost:3000 to view the Football Website.

## Adding More Queries

To add more queries to the server, you can follow these steps:

1. Open the `server.js` file.

2. Duplicate an existing endpoint and modify it for your new query.

   ```javascript
   app.get('/api/new-query', async (req, res) => {
     try {
       const newData = await db.select('*').from('new_table');
       res.json(newData);
     } catch (error) {
       console.error(error);
       res.status(500).json({ error: 'Internal server error' });
     }
   });
   ```

   Update the endpoint path, table name, and any additional logic as needed.

3. Restart the server to apply the changes.

   ```bash
   npm start
   ```

4. Update your React components to fetch data from the new endpoint.

   ```javascript
   // Example in your React component
   useEffect(() => {
     async function fetchNewData() {
       try {
         const response = await axios.get('http://localhost:3001/api/new-query');
         setNewData(response.data);
       } catch (error) {
         console.error(error);
       }
     }

     fetchNewData();
   }, []);
   ```

   Replace `'http://localhost:3001/api/new-query'` with your new endpoint.

## Questions?
Please feel free to ask me questions if needed this is my whatsapp number +34 660745418 or my email ahalouane23@ku.edu.tr
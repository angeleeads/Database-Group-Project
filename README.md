# EA FC 24 Stats

### Prerequisites

- Node.js installed (version 14.x recommended)
- npm (Node Package Manager) installed

### Installation

1. Clone the repository:

    ```bash
    git clone git@github.com:angeleeads/Database-Group-Project.git
    ```

2. Navigate to the project directory:

    ```bash
    cd Database-Group-Project
    ```

3. Install dependencies:

    ```bash
    npm install
    ```

### Database Migration

The project uses Knex.js for database migrations. Ensure you have a MySQL database set up. Update the `knexfile.js` configuration file with your database connection details. Modify the `user` and `password` to your own.

⚠️ Please make sure you have properly have the `sql_3rb` database before running the project.
The database file is `src/database/3rb-combined.sql` and you can import it to your database.

Import the `3rb-combined.sql` file to your database.:

    ```mysql
    source 'src/database/3rb-combined.sql'
    ```

### Running the Application

1. Start the server:

    ```bash
    node src/database/server.js
    ```

    The server will run on http://localhost:3001.

2. Start the React application:

    ```bash
    npm run start
    ```

    The React app will run on http://localhost:3000.

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
    node src/database/server.js
    ```

4. Update your React components to fetch data from the new endpoint.

    ```javascript
    useEffect(() => {
      async function fetchNewData() {
         try {
            const response = await axios.get('http://localhost:3001/api/new-query');
            setNewData(response.data);
         } catch (error) {
            console.error(error);
         }
      }
    }, []);
    ```

## Implemented Queries
## Simple Stats Queries
### [ GET ] : `/api/top-scorers`
### [ GET ] : `/api/top-assists`
### [ GET ] : `/api/top-cs`
### [ GET ] : `/api/top-performance`
### [ GET ] : `/api/top-players-onur`
### [ GET ] : `/api/top-players-arden`
### [ GET ] : `/api/top-players-ugur`

## Players Queries
### [ GET ] : `/api/players-data`
### [ GET ] : `/api/add-players`
### [ GET ] : `/api/delete-players`

## Search Queries
### [ GET ] : `/api/search`
### [ GET ] : `/player-names`
### [ GET ] : `/team-names`
### [ GET ] : `/positions`

## Complex Stats Queries
### [ GET ] : `/api/best-players-performance`
### [ GET ] : `/api/top-assists-players`
### [ GET ] : `/api/team-top-scorers`
### [ GET ] : `/api/striker-comparison`
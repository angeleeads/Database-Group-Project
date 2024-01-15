module.exports = {
    client: 'mysql',
    connection: {
      host: 'localhost',
      user: 'root',
      password: 'password',
      database: 'sql_3rb',
    },
    migrations: {
      tableName: 'knex_migrations',
      directory: './migrations',
    },
  };
  
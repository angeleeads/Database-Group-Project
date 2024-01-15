exports.up = function (knex) {
    return knex.schema.createTable('your_table_name', function (table) {
      table.increments('id').primary();
      table.string('name');
      // Add other columns as needed
    });
  };
  
  exports.down = function (knex) {
    return knex.schema.dropTable('your_table_name');
  };
  
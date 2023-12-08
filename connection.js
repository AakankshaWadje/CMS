const mysql = require('mysql');

const connection = mysql.createConnection({
  host: 'localhost', // Your database host
  user: 'root', // Your database username
  password: '', // Your database password
  database: 'typroject' // Your database name (typroject in this case)
  // port : 3307

});
module.exports=connection;

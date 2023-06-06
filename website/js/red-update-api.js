const fetch = require('node-fetch');
const mysql = require('mysql');

const apiURL = 'https://api.sampleapis.com/wines/reds';

const databaseHost = 'wheatley.cs.up.ac.za';
const databaseUsername = 'u22747886';
const databasePassword = 'UXQJ6LBF7PPDLD2KEQEP6WWHGBLPJZ7Y';
const databaseName = 'u22747886_WINE';

const dbConnection = mysql.createConnection({
  host: databaseHost,
  user: databaseUsername,
  password: databasePassword,
  database: databaseName,
});

dbConnection.connect((error) => {
  if (error) {
    console.error('Error connecting to the database:', error);
    return;
  }

  console.log('Connected to the database');

  fetch(apiURL)
    .then((response) => response.json())
    .then((redWines) => {
      redWines.forEach((wine) => {
        const wineName = wine.name;
        const imageURL = wine.image;

        const sql = `UPDATE Wines SET ImageURL = ? WHERE Name LIKE ?`;
        dbConnection.query(sql, [imageURL, `%${wineName}%`], (error, results) => {
          if (error) {
            console.error('Error updating ImageURL for wine:', wineName);
            console.error(error);
          } else {
            console.log(`Updated ImageURL for wine: ${wineName}`);
          }
        });
      });
    })
    .catch((error) => {
      console.error('Error fetching red wines from API:', error);
    })
    .finally(() => {
      dbConnection.end((error) => {
        if (error) {
          console.error('Error closing the database connection:', error);
        } else {
          console.log('Disconnected from the database');
        }
      });
    });
});

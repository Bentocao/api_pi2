require('dotenv').config()
const mysql = require('mysql')

var pool = mysql.createPool({
    "connectionLimit": 1000,
    "user" : "b17c2b4b480561",
    "password" : "9cfd3044",
    "database" : "heroku_87aabbbb53c029c",
    "host" : "us-cdbr-east-05.cleardb.net",
    "port" : 3306,

    // connectionLimit: 1000,
    // user: process.env.DB_USER,
    // password: process.env.DB_PASSWORD,
    // database: process.env.DB_NAME,
    // host: process.env.DB_HOST,
    // port : process.env.DB_PORT,
  
});

exports.execute = (query, params=[]) => {
    return new Promise((resolve, reject) => {
        pool.query(query, params, (error, result, fields) => {
            if (error) {
                reject(error);
            } else {
                resolve(result)
            }
        });
    })
}

exports.pool = pool;

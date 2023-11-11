
const express = require('express');
var router = express.Router();
const sqlite3 = require('sqlite3');




const db = new sqlite3.Database('./lib/pdbms.db', sqlite3.OPEN_READWRITE, (err) => {
    console.log("hii");
    if(err) 
    { 
        console.log("Error Occurred - " + err.message); 
    } 
    else
    { 
        console.log("DataBase Connected"); 
    } 
  })

module.exports = router;

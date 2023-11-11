var express = require('express');
var router = express.Router();
console.log("in index file");
/* GET home page. */
var sqlite3 = require('sqlite3');

console.log("working");
var connection = new sqlite3.Database('./lib/pdbms.db', sqlite3.OPEN_READWRITE, (err) => {
  if(err) 
  { 
      console.log("Error Occurred - " + err.message); 
  } 
  else
  { 
      console.log("DataBase Connected"); 
  } 
})

router.post('/add',function(req, res){
  console.log(req.body);
  
});

router.get('/123', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

module.exports = router;



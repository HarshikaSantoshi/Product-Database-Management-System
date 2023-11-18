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

router.get('/add', function(req, res, next) {
  res.render('add', { title: 'Express' });
});

router.get('/edit', function(req, res, next) {

  res.render('edit', { title: 'Express' });
});
router.get('/edit/:id/',function(req,res,next){
  const id = req.params.id;
  console.log(id);
  const sql = "Select * from Product where productID = ?";
  connection.get(sql, id, (err, row) => {
   console.log(row);
      
      res.render("edit", { db_rows_array: row });
   


  });
});

router.get('/display', function(req, res, next) {
  const sql = "SELECT * FROM Product"
  connection.all(sql, [], (err, rows) => {
      if (err) {
        return console.error(err.message);
      }console.log(rows);
      res.render("display", { db_rows_array: rows });
    });
 
});


module.exports = router;




const express = require('express');
const router = express.Router();
const db = require('sqlite3');

// Create a product
router.post('/add', (req, res) => {
  const data = {ProductID, ProductName, ProductCategory, ProductBrand, Price, Discount, InventoryID, ReviewID} = req.body;
  const sql = 'INSERT INTO Product (productID, product_name, product_category, product_brand, price, discount, inventoryID, reviewID) VALUES (?, ?, ?, ?, ?, ?, ?, ?)';
  connection.run(sql, data , function (err) {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.render(product/product_add, { db_rows_array: rows ,message: 'Product added', id: this.lastID });
  });
});

// Retrieve all products
router.get('/add', (req, res) => {
    const sql = "SELECT * FROM Product",
    data = {ProductID, ProductName, ProductCategory, ProductBrand, Price, Discount, InventoryID, ReviewID} = req.body;
    connection.all(sql, data, function (err, rows) {
        if (err) {
            return console.error(err.message);
        } console.log(rows);
        res.render("product/product_add", { db_rows_array: rows });
    });
});



// Update a product
router.post('/edit/:id', (req,res) => {
    console.log("Edit ID id:", req.params.id),
    id = req.params.id,
    data = [req.body.productID, req.body.product_name, req.body.product_category, req.body.product_brand, req.body.price, req.body.discount, req.body.inventoryID, req.body.reviewID] = req.body,
    sql = 'UPDATE Product SET productID = ?, product_name = ?, product_category = ?, product_brand = ?, price = ?, discount = ?, inventoryID = ?, reviewID = ? WHERE productID = ?',
    connection.run(sql, data, function (err) {
        if (err) {
            res.redirect('/views/display');
        };
    });
});

// Delete a product
router.get('/delete/:id', (req, res) => {
    const { id } = req.params.id;
    const sql = 'DELETE FROM Product WHERE productID = ?';
    connection.run(sql, id, err => {
        console.log("Record Deleted");
        res.redirect("/views/display");
    });
});

module.exports = router;

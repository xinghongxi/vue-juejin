var express = require('express');
var router = express.Router();
var con = require('../model/db.js');

// /* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

module.exports = router;






module.exports = router;
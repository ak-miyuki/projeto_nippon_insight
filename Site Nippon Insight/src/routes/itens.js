var express = require("express");
var router = express.Router();

var itensController = require("../controllers/itensController");

router.get("/buscarItens", function (req, res) {
  itensController.buscarItens(req, res);
});


router.get("/buscarItensPorViagem/:idViagem", function (req, res) {
  itensController.buscarItensPorViagem(req, res);
});

module.exports = router;
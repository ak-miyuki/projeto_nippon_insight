var express = require("express");
var router = express.Router();

var viagemController = require("../controllers/viagemController");

router.get("/:idUsuario", function (req, res) {
  viagemController.buscarViagemPorUsuario(req, res);
});

router.post("/cadastrar", function (req, res) {
  viagemController.cadastrar(req, res);
});

module.exports = router;
var express = require("express");
var router = express.Router();

var viagemController = require("../controllers/viagemController");

router.get("/:idUsuario", function (req, res) {
  viagemController.buscarViagemPorUsuario(req, res);
});

router.post("/cadastrar", function (req, res) {
  viagemController.cadastrar(req, res);
});

router.put("/atualizarViagem", function (req, res) {
  viagemController.atualizarViagem(req, res);
});

router.put("/atualizarCaixinha", function (req, res) {
  viagemController.atualizarCaixinha(req, res);
});

module.exports = router;

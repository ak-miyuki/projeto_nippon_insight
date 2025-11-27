var itensModel = require("../models/itensModel");

function buscarItens(req, res) {
  
  itensModel.buscarItens().then((resultado) => {
    if (resultado.length > 0) {
      res.status(200).json(resultado);
    } else {
      res.status(204).json([]);
    }
  }).catch(function (erro) {
    console.log(erro);
    console.log("Houve um erro ao buscar as itens: ", erro.sqlMessage);
    res.status(500).json(erro.sqlMessage);
  });
}

function buscarItensPorViagem(req, res) {
  var idViagem = req.params.idViagem;
  
  itensModel.buscarItensPorViagem(idViagem).then((resultado) => {
    if (resultado.length > 0) {
      res.status(200).json(resultado);
    } else {
      res.status(204).json([]);
    }
  }).catch(function (erro) {
    console.log(erro);
    console.log("Houve um erro ao buscar as itens por viagem: ", erro.sqlMessage);
    res.status(500).json(erro.sqlMessage);
  });
}


module.exports = {
  buscarItens,
  buscarItensPorViagem
}
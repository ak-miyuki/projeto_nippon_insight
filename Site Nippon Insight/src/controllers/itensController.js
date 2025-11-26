var itensModel = require("../models/itensModel");

function buscarItens(req, res) {
  var idViagem = req.params.idViagem;
  
  itensModel.buscarItens(idViagem).then((resultado) => {
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


module.exports = {
  buscarItens
}
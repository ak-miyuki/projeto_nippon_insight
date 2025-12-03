var escolhasModel = require("../models/escolhasModel");

function buscarVotosLugares(req, res) {
  var idViagem = req.params.idViagem;

  escolhasModel.buscarVotosLugares(idViagem).then((resultado) => {
    if (resultado.length > 0) {
      res.status(200).json(resultado);
    } else {
      res.status(204).json([]);
    }
  }).catch(function (erro) {
    console.log(erro);
    console.log("Houve um erro ao buscar as viagens: ", erro.sqlMessage);
    res.status(500).json(erro.sqlMessage);
  });
}


function buscarEscolhasPorViagem(req, res) {
  var idViagem = req.params.idViagem;

  escolhasModel.buscarEscolhasPorViagem(idViagem).then((resultado) => {
    if (resultado.length > 0) {
      res.status(200).json(resultado);
    } else {
      res.status(204).json([]);
    }
  }).catch(function (erro) {
    console.log(erro);
    console.log("Houve um erro ao buscar as viagens: ", erro.sqlMessage);
    res.status(500).json(erro.sqlMessage);
  });
}


function salvar(req, res) {

console.log("BODY RECEBIDO:", req.body);

  var fkViagem = req.body.fkViagemServer;
  var fkItem = req.body.fkItemServer;
  var qtd = req.body.qtdServer;

  
  escolhasModel.buscarEscolhaEspecifica(fkViagem, fkItem)
    .then(resultado => {

      if (resultado.length > 0) {

        console.log(resultado)

        return escolhasModel.atualizarEscolhas(fkViagem, fkItem, qtd)
          .then(() => {
            res.status(200).json({
              method: "PUT",
              headers: "Quantidade atualizada com sucesso"
            });
          });

      } else {

        return escolhasModel.cadastrar(fkViagem, fkItem, qtd)
          .then(() => {
            res.status(201).json({
              method: "POST",
              headers: "Item inserido com sucesso"
            });
          });
      }

    })
    .catch(function (erro) {
      console.log(erro);
      console.log("Erro ao salvar:", erro.sqlMessage);
      res.status(500).json(erro.sqlMessage);
    });
}


module.exports = {
  buscarVotosLugares,
  buscarEscolhasPorViagem,
  salvar
}
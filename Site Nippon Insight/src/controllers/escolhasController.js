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

function cadastrar(req, res) {
  var fkViagem = req.body.fkViagemServer;
  var fkItem = req.body.fkItemServer;
  var qtd = req.body.qtdServer;


  if (fkViagem == undefined) {
    res.status(400).send("idViagem está undefined!");
  }

  if (fkItem == undefined) {
    res.status(400).send("idItem está undefined!");
  }
  if (qtd == undefined) {
    res.status(400).send("qtd está undefined!");
  }


  escolhasModel.cadastrar(fkViagem, fkItem, qtd)
    .then((resultado) => {
      res.status(201).json(resultado);
    }
    ).catch((erro) => {
      console.log(erro);
      console.log(
        "\nHouve um erro ao realizar o cadastro! Erro: ",
        erro.sqlMessage
      );
      res.status(500).json(erro.sqlMessage);
    });
}


module.exports = {
  buscarVotosLugares,
  buscarEscolhasPorViagem,
  cadastrar
}
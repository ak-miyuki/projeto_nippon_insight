var viagemModel = require("../models/viagemModel");

function buscarViagemPorUsuario(req, res) {
  var idUsuario = req.params.idUsuario;

  viagemModel.buscarViagemPorUsuario(idUsuario).then((resultado) => {
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
  var fkUsuario = req.body.fkUsuarioServer;
  var estacao = req.body.estacaoServer;
  var dtIda = req.body.dtIdaServer;
  var dtVolta = req.body.dtVoltaServer;
  var qtdPessoas = req.body.qtdPessoasServer;
  var valorGuardado = req.body.valorGuardadoServer;

  if (fkUsuario == undefined) {
    res.status(400).send("idUsuario está undefined!");
  }

  if (estacao == undefined) {
    estacao = 'Indefinida';
  }
  if (dtIda == undefined) {
    dtIda = 'Indefinida';
  }
  if (dtVolta == undefined) {
    dtVolta = 'Indefinida';
  }
  if (valorGuardado == undefined) {
    valorGuardado = null;
  }


  viagemModel.cadastrar(fkUsuario, estacao, dtIda, dtVolta, qtdPessoas, valorGuardado)
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

function atualizarViagem(req, res) {
  var fkUsuario = req.body.fkUsuarioServer;
  var estacao = req.body.estacaoServer;
  var dtIda = req.body.dtIdaServer;
  var dtVolta = req.body.dtVoltaServer;
  var qtdPessoas = req.body.qtdPessoasServer;
  var valorGuardado = req.body.valorGuardadoServer;

  if (fkUsuario == undefined) {
    res.status(400).send("idUsuario está undefined!");
  }

  if (estacao == undefined) {
    estacao = 'Indefinida';
  }
  if (dtIda == undefined) {
    dtIda = 'Indefinida';
  }
  if (dtVolta == undefined) {
    dtVolta = 'Indefinida';
  }
  if (valorGuardado == undefined) {
    valorGuardado = null;
  }


  viagemModel.atualizarViagem(fkUsuario, estacao, dtIda, dtVolta, qtdPessoas, valorGuardado)
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



function atualizarCaixinha(req, res) {
  var idUsuario = req.body.idUsuarioServer;
  var novoValorGuardado = req.body.novoValorGuardadoServer;

  if (novoValorGuardado == undefined) {
    res.status(400).send("idUsuario está undefined!");
  }


  viagemModel.atualizarCaixinha(idUsuario, novoValorGuardado)
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
  buscarViagemPorUsuario,
  cadastrar,
  atualizarViagem,
  atualizarCaixinha
}

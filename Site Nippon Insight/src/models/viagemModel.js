var database = require("../database/config");

function buscarViagemPorUsuario(idUsuario) {

  var instrucaoSql = `SELECT * FROM vw_dadosViagem WHERE fkUsuario = ${idUsuario};`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}


function cadastrar(fkUsuario, estacao, dtIda, dtVolta, qtdPessoas, valorGuardado) {

  var instrucaoSql = `INSERT INTO viagem (fkUsuario, estacao, dtIda, dtVolta, qtdPessoas, valorGuardado) VALUES (${fkUsuario}, '${estacao}', '${dtIda}', '${dtVolta}', ${qtdPessoas}, ${valorGuardado})`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function cadastrar_idViagem(fkUsuario) {

  var instrucaoSql = `INSERT INTO viagem (fkUsuario) VALUES (${fkUsuario})`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function atualizarViagem(fkUsuario, estacao, dtIda, dtVolta, qtdPessoas, valorGuardado) {

  var instrucaoSql = `UPDATE viagem SET fkUsuario = ${fkUsuario}, estacao = '${estacao}', dtIda = '${dtIda}', dtVolta = '${dtVolta}', qtdPessoas = ${qtdPessoas}, valorGuardado = ${valorGuardado} WHERE fkUsuario = ${fkUsuario};`

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}


function atualizarCaixinha(novoValorGuardado, idUsuario) {

  var instrucaoSql = `UPDATE viagem SET valorGuardado = ${novoValorGuardado} WHERE fkUsuario = ${idUsuario};`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}


module.exports = {
  buscarViagemPorUsuario,
  cadastrar,
  cadastrar_idViagem,
  atualizarViagem,
  atualizarCaixinha
}

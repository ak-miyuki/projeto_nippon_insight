var database = require("../database/config");

function buscarViagemPorUsuario(idUsuario) {
  
  var instrucaoSql = `SELECT * FROM viagem WHERE fkUsuario = ${idUsuario}`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function cadastrar(fkUsuario, estacao, dtIda, dtVolta, valorGuardado) {
  
  var instrucaoSql = `INSERT INTO viagem (fkUsuario, estacao, dtIda, dtVolta, valorGuardado) VALUES (${fkUsuario}, '${estacao}', '${dtIda}', '${dtVolta}', ${valorGuardado})`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}


module.exports = {
  buscarViagemPorUsuario,
  cadastrar
}

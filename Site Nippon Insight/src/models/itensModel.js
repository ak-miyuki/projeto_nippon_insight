var database = require("../database/config");

function buscarItens(idViagem) {
  
  var instrucaoSql = `SELECT * FROM vw_itensUsuario
	WHERE idViagem IN(null, ${idViagem};`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

module.exports = {
  buscarItens
}

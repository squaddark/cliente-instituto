declare module "@salesforce/apex/listaDePresencaController.saveListaDePresenca" {
  export default function saveListaDePresenca(param: {statusPresenca: any, alunoId: any, data: any, dia: any, mes: any, ano: any, turma: any}): Promise<any>;
}
declare module "@salesforce/apex/listaDePresencaController.buscarChamadaMap" {
  export default function buscarChamadaMap(param: {turma: any, dia: any, mes: any, ano: any}): Promise<any>;
}
declare module "@salesforce/apex/listaDePresencaController.buscarChamadaList" {
  export default function buscarChamadaList(param: {turma: any, dia: any, mes: any, ano: any}): Promise<any>;
}
declare module "@salesforce/apex/listaDePresencaController.criarChamada" {
  export default function criarChamada(param: {status: any, aluno: any, data: any, ano: any, turma: any, treinador: any}): Promise<any>;
}
declare module "@salesforce/apex/listaDePresencaController.returnTreinador" {
  export default function returnTreinador(param: {turma: any}): Promise<any>;
}

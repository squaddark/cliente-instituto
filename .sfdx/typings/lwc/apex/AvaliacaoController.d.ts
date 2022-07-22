declare module "@salesforce/apex/AvaliacaoController.salvarAvaliacao" {
  export default function salvarAvaliacao(param: {idAvaliacao: any, mesReferencia: any, anoReferencia: any, codTreinador: any, primeiraVisita: any, segundaVisita: any, observacoes: any, respostas: any}): Promise<any>;
}
declare module "@salesforce/apex/AvaliacaoController.buscarAvaliacao" {
  export default function buscarAvaliacao(param: {codTreinador: any, anoReferencia: any, mesReferencia: any}): Promise<any>;
}
declare module "@salesforce/apex/AvaliacaoController.contarAlunos" {
  export default function contarAlunos(param: {codTreinador: any}): Promise<any>;
}
declare module "@salesforce/apex/AvaliacaoController.verificarCadastroCompleto" {
  export default function verificarCadastroCompleto(param: {codTreinador: any}): Promise<any>;
}
declare module "@salesforce/apex/AvaliacaoController.contarAvaliacaoEsportiva" {
  export default function contarAvaliacaoEsportiva(param: {codTreinador: any, mesReferencia: any}): Promise<any>;
}
declare module "@salesforce/apex/AvaliacaoController.contarAvaliacaoSocioemocional" {
  export default function contarAvaliacaoSocioemocional(param: {codTreinador: any, mesReferencia: any}): Promise<any>;
}
declare module "@salesforce/apex/AvaliacaoController.percentControleFrequencia" {
  export default function percentControleFrequencia(param: {codTreinador: any, mesReferencia: any, anoReferencia: any}): Promise<any>;
}
declare module "@salesforce/apex/AvaliacaoController.contarAlunosAprovados" {
  export default function contarAlunosAprovados(param: {codTreinador: any}): Promise<any>;
}
declare module "@salesforce/apex/AvaliacaoController.contarAlunosComNota" {
  export default function contarAlunosComNota(param: {codTreinador: any, mesReferencia: any}): Promise<any>;
}

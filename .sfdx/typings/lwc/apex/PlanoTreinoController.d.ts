declare module "@salesforce/apex/PlanoTreinoController.salvarPlano" {
  export default function salvarPlano(param: {plano: any, classificacao: any, planoAtividade: any}): Promise<any>;
}
declare module "@salesforce/apex/PlanoTreinoController.buscarPlano" {
  export default function buscarPlano(param: {dataPlano: any, idTurma: any}): Promise<any>;
}
declare module "@salesforce/apex/PlanoTreinoController.buscarClassificacao" {
  export default function buscarClassificacao(param: {dimensao: any, estrutura: any, tipo: any}): Promise<any>;
}
declare module "@salesforce/apex/PlanoTreinoController.getUrlOrg" {
  export default function getUrlOrg(): Promise<any>;
}

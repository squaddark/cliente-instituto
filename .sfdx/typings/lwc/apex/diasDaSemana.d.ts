declare module "@salesforce/apex/diasDaSemana.verificaDiasNoMes" {
  export default function verificaDiasNoMes(param: {mes: any, ano: any, dias: any, turma: any}): Promise<any>;
}
declare module "@salesforce/apex/diasDaSemana.adicionarDia" {
  export default function adicionarDia(param: {diaDaSemana: any, diasAtuais: any, mesAtual: any}): Promise<any>;
}

import { LightningElement, api, track } from 'lwc';
import uId from '@salesforce/user/Id'
import buscarDadosTurmas from '@salesforce/apex/ReportTreinadorController.buscarDadosTurmas';

const columns = [
    {label: 'Turma', fieldName: 'turma'},
    {label: 'Quantidade de alunos', fieldName: 'quantidade'}
];

const columnsDesistencia = [
    {label: 'Turma', fieldName: 'turma'},
    {label: 'Quantidade de desistências', fieldName: 'quantidade'}
];

export default class ReportTreinador extends LightningElement {
    dataTurmas = [];
    colunas = columns;
    dataTurmasDesistencia = [];
    colunasDesistencias = columnsDesistencia;

    userId = uId;
    // userId = '005Z0000005rRDBIA2';
    

    connectedCallback(){
        this.carregarGrid();
    }

    carregarGrid(){
        buscarDadosTurmas({userId: this.userId})
        .then(result => {
            this.dataTurmas = result.quantidadeAlunoTurma;
            this.dataTurmasDesistencia = result.quantidadeAlunoDesistenciaTurma;
        })
        .catch(error => {
            this.showToast('Erro', 'Falha ao carregar dados das turmas', 'error');
        })
    }

}
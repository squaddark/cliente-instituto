import { LightningElement, track, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
//import buscarAluno from '@salesforce/apex/contactDAO.buscarAluno';
//import buscarDias from '@salesforce/apex/porcentagemPresencaController.buscarDias';
//import calcularPorcentagem from '@salesforce/apex/porcentagemPresencaController.calcularPorcentagem';
import presencaAlunosByTurma from '@salesforce/apex/porcentagemPresencaController.presencaAlunosByTurma';
import buscarDiasAulas from '@salesforce/apex/porcentagemPresencaController.buscaDiasAulas';
import buscaTotais from '@salesforce/apex/porcentagemPresencaController.buscaTotais';
import formFactorPropertyName from '@salesforce/client/formFactor';

var hoje = new Date();
var anoAtual = hoje.getFullYear();
var anoPassado = anoAtual - 1;

export default class PorcentagemPresenca extends LightningElement {

    get isDesktop() {
        return formFactorPropertyName === 'Large';
    }

    get isPhone() {
        return formFactorPropertyName === 'Small';
    }

    @api recordId;
    @track turma;
    @track data;
    @track selectedMes;
    @track selectedMesId;
    @track selectedAno;
    @track alunos = [];
    @track list = [];
    @track listaTotais = [];
    @track diasNoMes;
    @track dias;
    @track selectDia;
    @track selectedDia;
    @track diaSelecionado;
    @track selectedPresenca;
    @track chamadaStatus;
    @track listaVisivel = false;
    @track semDados = false;

    @track anos = [
        {"label": anoPassado, "value": anoPassado},
        {"label": anoAtual, "value": anoAtual}
    ];

    @track meses = [
        {"label": 'Janeiro', "value": "Janeiro", "id": 1},
        {"label": 'Fevereiro', "value": "Fevereiro", "id":2},
        {"label": 'Março', "value": "Março", "id": 3},
        {"label": 'Abril', "value": "Abril", "id": 4},
        {"label": 'Maio', "value": "Maio", "id": 5},
        {"label": 'Junho', "value": "Junho", "id": 6},
        {"label": 'Julho', "value": "Julho", "id": 7},
        {"label": 'Agosto', "value": "Agosto", "id": 8},
        {"label": 'Setembro', "value": "Setembro", "id": 9},
        {"label": 'Outubro', "value": "Outubro", "id": 10},
        {"label": 'Novembro', "value": "Novembro", "id": 11},
        {"label": 'Dezembro', "value": "Dezembro", "id": 12}
    ];

    connectedCallback(){
        presencaAlunosByTurma({mes: this.selectedMes, ano: this.anoSelecionado, turma: this.recordId})
        .then(result => {
            this.alunos = [];
            this.alunos = result;
            
           
        });
        this.listaTotais = [
            { Id: '1', name: "Total de presenças/dia"},
            { Id: '2', name: "Total de faltas/dia"},
            { Id: '3', name: "% de presença"}
        ];
        /* presencaAlunosByTurma2()
        .then(result => {
            this.diasAulas = result;
            
        }) */
        /* buscarAluno({turma: this.recordId})
        .then(result => {
            this.alunos = result;
        })
        .catch(error => {
            this.showToast('Erro', error.body.message, 'error');
        }); */
    }

    calculoPorcentagem(){   
        presencaAlunosByTurma({mes: this.selectedMes, ano: this.anoSelecionado, turma: this.recordId})
        .then(result => {
            this.alunos = [];
            this.alunos = result;
            this.listaVisivel = true;
        });

        buscarDiasAulas({mes: this.selectedMes, ano: this.anoSelecionado, turma: this.recordId})
        .then(result => {
            this.list = [];
            this.list = result.lista;
        });
        buscaTotais({mes: this.selectedMes, ano: this.anoSelecionado, turma: this.recordId})
        .then(result => {
            this.listaTotais = [];
            this.listaTotais = result;
        });

        /* calcularPorcentagem({mes: this.selectedMes, ano: this.anoSelecionado, turma: this.recordId})
        .then(result => {
            this.porcentagem = result;
            var pos = 0;
                for(let aluno of this.alunos){
                    aluno.Porcentagem = this.porcentagem[pos];
                    pos = pos + 1;
                }
            this.listaVisivel = true;
        })
        .catch(error => {
            this.listaVisivel = false;
            this.showToast('Erro', 'Não existem dados para a chamada da data selecionada', 'error');
            console.log(error.body.message);
        }); */
    }

    selectMes(event){
        this.selectedMes = event.target.options.find(opt => opt.value == event.detail.value).label;
        this.selectedMesId = event.target.options.find(opt => opt.value == event.detail.value).id;

        /* buscarDias({
            turma: this.recordId,
            mes: this.selectedMes,
            ano: this.selectedAno
        })
        .then(result => {
            this.dias = result;
            console.log('RESULT:' + result);
        })
        .catch(error => {
            alert('Erro', error.body.message, 'error');
            console.log('selectMes ERRO:' + error.body.message);
        }); */

    }

    selectAno(event){
        this.selectedAno = event.target.options.find(opt => opt.value == event.detail.value).label;
        this.anoSelecionado = this.selectedAno.toString();
    }

    closeQuickAction() {
        const closeQA = new CustomEvent('close');
        this.dispatchEvent(closeQA);
    }

    showToast(title, message, variant) {
        const evt = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        });
        this.dispatchEvent(evt);
	}

}
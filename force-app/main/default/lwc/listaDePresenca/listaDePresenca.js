import { LightningElement, track, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import buscarAluno from '@salesforce/apex/contactDAO.buscarAluno';
import verificaDiasNoMes from '@salesforce/apex/diasDaSemana.verificaDiasNoMes';
import buscaDiasTreino from '@salesforce/apex/turmaDAO.buscaDiasTreino';
import buscarTurma from '@salesforce/apex/turmaDAO.buscarTurma';
import salvarPresencaAlunos from '@salesforce/apex/listaDePresencaController.saveListaDePresenca';
import buscarChamadaData from '@salesforce/apex/listaDePresencaController.buscarChamadaList';
import adicionarDia from '@salesforce/apex/diasDaSemana.adicionarDia';
import formFactorPropertyName from '@salesforce/client/formFactor';
import StayInTouchSubject from '@salesforce/schema/User.StayInTouchSubject';

var statusPresencaSelecionados = new Map()
var alunosSelecionados = new Map()
var hoje = new Date();
var anoAtual = hoje.getFullYear();
var anoPassado = anoAtual - 1;
var mesAtual = hoje.getMonth();


export default class ListaDePresenca extends LightningElement {

    statusPresencaSelecionados = statusPresencaSelecionados
    alunosSelecionados = alunosSelecionados

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
    @track alunos;
    @track diasNoMes;
    @track dias;
    @track selectDia;
    @track selectedDia;
    @track diaSelecionado;
    @track selectedPresenca;
    @track chamadaStatus;
    @track listaVisivel = false;
    @track optionsMobile = [];
    @track comboVisivel = false;
    @track adicionarDiaVisivel = false;
    @track diaAdicionar;

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

    status = [
        {"label": "Presente", "value": "Presente"},
        {"label": "Falta", "value": "Falta"},
        {"label": "Atestado", "value": "Atestado"},
        {"label": "Jogo", "value": "Jogo"},
        {"label": "Férias", "value": "Férias"},
        {"label": "Feriado", "value": "Feriado"},
        {"label": "Folga", "value": "Folga"}
    ]

    connectedCallback(){
        buscarAluno({
            turma: this.recordId,
            dia: '',
            mes: '',
            ano: ''
        })
        .then(result => {
            this.alunos = result;
            this.selectedAno = anoAtual;
            this.selectedMesId = mesAtual;
            this.selectedMes = this.meses[(mesAtual)].value;
            this.selectedMesId = this.meses[(mesAtual)].id;
            this.anoSelecionado = this.selectedAno.toString();
            this.verificarDias();
        })
        .catch(error => {
            this.showToast('Erro', error.body.message, 'error');
        });
    }

    carregaAlunos(){
        buscarAluno({
            turma: this.recordId,
            dia: this.diaSelecionado,
            mes: this.selectedMesId,
            ano: this.anoSelecionado
        })
        .then(result => {
            this.alunos = result;
            this.selectedAno = anoAtual;
            this.selectedMesId = mesAtual;
            this.selectedMes = this.meses[(mesAtual)].value;
            this.selectedMesId = this.meses[(mesAtual)].id;
            this.anoSelecionado = this.selectedAno.toString();
            this.verificarDias();
        })
        .catch(error => {
            this.showToast('Erro', error.body.message, 'error');
        });
    }

    carregaAlunosAddDay(){
        buscarAluno({
            turma: this.recordId,
            dia: this.diaSelecionado,
            mes: this.selectedMesId,
            ano: this.anoSelecionado
        })
        .then(result => {
            this.alunos = result;
            // this.selectedAno = anoAtual;
            // this.selectedMesId = mesAtual;
            // this.selectedMes = this.meses[(mesAtual)].value;
            // this.selectedMesId = this.meses[(mesAtual)].id;
            // this.anoSelecionado = this.selectedAno.toString();
        })
        .catch(error => {
            this.showToast('Erro', error.body.message, 'error');
        });
    }

    selectMes(event){
        this.selectedMes = event.target.options.find(opt => opt.value == event.detail.value).label;
        this.selectedMesId = event.target.options.find(opt => opt.value == event.detail.value).id;
        this.verificarDias();
    }

    verificarDias(){
        buscaDiasTreino({recId: this.recordId})
        .then(result => {
            this.dias = result;
            verificaDiasNoMes({ano: this.selectedAno, mes: this.selectedMesId, dias: this.dias, turma: this.recordId})
            .then(result => {
                this.optionsMobile = [];
                this.diasNoMes = result;
                this.listaVisivel = true;
                this.diasNoMes.forEach(element => {
                    this.optionsMobile.push(
                        {"label": element, "value": element });
                });
                
            })
            .catch(error => {
                this.showToast('Erro', error.body.message, 'error');
            });
        })

        .catch(error => {
            this.showToast('Erro', error.body.message, 'error');
        });
    }

    selectAno(event){
        this.selectedAno = event.target.options.find(opt => opt.value == event.detail.value).label;
        this.anoSelecionado = this.selectedAno.toString();
    }

    selectDay(event){
        for(let aluno of this.alunos){
            aluno.Presenca = '';
            aluno.StatusDisabled = false;
        }

        this.statusPresencaSelecionados.clear();
        this.alunosSelecionados.clear();

        this.comboVisivel = true;
        this.selectedDia = event.target.options.find(opt => opt.value == event.detail.value).label;
        this.diaSelecionado = this.selectedDia.toString();

        buscarAluno({
            turma: this.recordId,
            dia: this.diaSelecionado,
            mes: this.selectedMesId,
            ano: this.anoSelecionado
        })
        .then(result => {
            this.alunos = result;
            // this.selectedAno = anoAtual;
            // this.selectedMesId = mesAtual;
            // this.selectedMes = this.meses[(mesAtual)].value;
            // // this.selectedMesId = this.meses[(mesAtual)].id;
            // this.anoSelecionado = this.selectedAno.toString();
            this.verificarDias();

            buscarChamadaData({
                dia: this.diaSelecionado,
                mes: this.selectedMesId,
                ano: this.anoSelecionado,
                turma: this.recordId         
            })
            .then(result => {
                let chamadarealizada = false;
                for(let resultado of result){
                    for(let aluno of this.alunos){
                        if(resultado.Aluno__c == aluno.Id){
                            aluno.Presenca = resultado.Status__c;
                            aluno.StatusDisabled = false;
                            chamadarealizada = true;
                        }
                        aluno.StatusDisabled = false;
                    }
                }

                if(chamadarealizada){
                    this.showToast('Atenção!', 'Chamada para essa data já realizada.', 'warning');
                }
            })
            .catch(error => { 
                // for(let resultado of result){
                //     for(let aluno of this.alunos){
                //         if(resultado.Aluno__c == aluno.Id){
                //             aluno.Presenca = '';
                //         }
                //     }
                // }
            })
        })
        .catch(error => {
            this.showToast('Erro', error.body.message, 'error');
        });
    }

    selectPresenca(event){
        this.statusPresencaSelecionados.set(event.target.name, event.target.value);
        for(let aluno of this.alunos){
            this.alunosSelecionados.set(aluno.Id, aluno.Id);
        }
        this.selectedPresenca  = event.target.value;
    }

    selectAdicionarDia(event){
        this.diaAdicionar = event.target.value;
    }

    adicionarDia(){
        if(this.diaAdicionar == null || this.diaAdicionar == ''){
            this.showToast('Atenção!', 'Preencha o dia adicional.', 'warning');
        } else if(this.diaAdicionar.length == 1){
            this.showToast('Atenção!', 'O formato do dia deve conter dois números. Ex: 01, 12', 'warning');
        } else{
            adicionarDia({
                diaDaSemana: this.diaAdicionar,
                diasAtuais: this.diasNoMes,
                mesAtual: this.selectedMesId
            })
            .then(success => {
                this.diaSelecionado = success;
                this.diasNoMes.push(success);
                this.diasNoMes.sort();
                this.optionsMobile = [];
                this.diasNoMes.forEach(element => {
                    this.optionsMobile.push(
                        {"label": element, "value": element });
                });
                this.comboVisivel = true;
                this.selectedDia = success;
                this.carregaAlunosAddDay();
                this.showToast('Sucesso', 'Dia adicionado para chamada!', 'success')
            })
            .catch(error => { 
                console.log('ERROR ==>', error);
                this.showToast('Erro', error.body.message, 'error')
            })
        }
    }

    salvarPresenca(){
        //Transforma o Map em Obj
        let objMapStatus = this.mapToObj(this.statusPresencaSelecionados)
        let objMapAluno = this.mapToObj(this.alunosSelecionados)

        salvarPresencaAlunos({
            //Transforma o Obj em String para enviar para classe Apex
            statusPresenca: JSON.stringify(objMapStatus), 
            alunoId: JSON.stringify(objMapAluno),
            data: this.diaSelecionado,
            dia: this.diaSelecionado,
            mes: this.selectedMesId,
            ano: this.anoSelecionado,
            turma: this.recordId
        })
        .then(success => { 
            this.closeQuickAction();
            this.showToast('Sucesso', 'Lista de presença salva!', 'success')
        })
        .catch(error => { 
            console.log('ERROR ==>', error)
            this.showToast('Erro', 'Não é possível salvar a lista de presença!', 'error')
        })
    }

    marcarPresenca(){
        let selectedRows = this.template.querySelectorAll('lightning-input');
        
        for(let i = 0; i < selectedRows.length; i++) {
            if(selectedRows[i].type === 'checkbox' && selectedRows[i].checked === true) {
                for(let aluno of this.alunos){
                    if(aluno.Id == selectedRows[i].id.slice(0,18)){
                    aluno.Presenca = 'Presente';
                    this.statusPresencaSelecionados.set(aluno.Id, aluno.Presenca);
                    this.alunosSelecionados.set(aluno.Id, aluno.Id);
                    }
                }

            }
            selectedRows[i].checked = false;
        }
    }

    marcarFeriado(){
        let selectedRows = this.template.querySelectorAll('lightning-input');
        
        for(let i = 0; i < selectedRows.length; i++) {
            if(selectedRows[i].type === 'checkbox' && selectedRows[i].checked === true) {
                for(let aluno of this.alunos){
                    if(aluno.Id == selectedRows[i].id.slice(0,18)){
                    aluno.Presenca = 'Feriado';
                    this.statusPresencaSelecionados.set(aluno.Id, aluno.Presenca);
                    this.alunosSelecionados.set(aluno.Id, aluno.Id);
                    }
                }

            }
            selectedRows[i].checked = false;
        }
    }    

    marcarFolga(){
        let selectedRows = this.template.querySelectorAll('lightning-input');
        
        for(let i = 0; i < selectedRows.length; i++) {
            if(selectedRows[i].type === 'checkbox' && selectedRows[i].checked === true) {
                for(let aluno of this.alunos){
                    if(aluno.Id == selectedRows[i].id.slice(0,18)){
                    aluno.Presenca = 'Folga';
                    this.statusPresencaSelecionados.set(aluno.Id, aluno.Presenca);
                    this.alunosSelecionados.set(aluno.Id, aluno.Id);
                    }
                }

            }
            selectedRows[i].checked = false;
        }
    }   

    marcarJogo(){
        let selectedRows = this.template.querySelectorAll('lightning-input');
        
        for(let i = 0; i < selectedRows.length; i++) {
            if(selectedRows[i].type === 'checkbox' && selectedRows[i].checked === true) {
                for(let aluno of this.alunos){
                    if(aluno.Id == selectedRows[i].id.slice(0,18)){
                    aluno.Presenca = 'Jogo';
                    this.statusPresencaSelecionados.set(aluno.Id, aluno.Presenca);
                    this.alunosSelecionados.set(aluno.Id, aluno.Id);
                    }
                }

            }
            selectedRows[i].checked = false;
        }
    } 

    allSelected(event) {
        let selectedRows = this.template.querySelectorAll('lightning-input');
        
        for(let i = 0; i < selectedRows.length; i++) {
            if(selectedRows[i].type === 'checkbox') {
                selectedRows[i].checked = event.target.checked;
            }
        }
    }

    mapToObj(map){
        var obj = {}
        map.forEach(function(v, k){
          obj[k] = v
        })
        return obj
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
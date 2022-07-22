import { LightningElement, api, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import salvarAvaliacao from '@salesforce/apex/AvaliacaoController.salvarAvaliacao';
import buscarAvaliacao from '@salesforce/apex/AvaliacaoController.buscarAvaliacao';
import contarAlunos from '@salesforce/apex/AvaliacaoController.contarAlunos';
import verificarCadastroCompleto from '@salesforce/apex/AvaliacaoController.verificarCadastroCompleto';
import contarAvaliacaoEsportiva from '@salesforce/apex/AvaliacaoController.contarAvaliacaoEsportiva';
import contarAvaliacaoSocioemocional from '@salesforce/apex/AvaliacaoController.contarAvaliacaoSocioemocional';
import contarAlunosAprovados from '@salesforce/apex/AvaliacaoController.contarAlunosAprovados';
import percentControleFrequencia from '@salesforce/apex/AvaliacaoController.percentControleFrequencia';
import contarAlunosComNota from '@salesforce/apex/AvaliacaoController.contarAlunosComNota';

var hoje = new Date();
var anoAtual = hoje.getFullYear().toString();
var anoPassado = (anoAtual - 1).toString();


export default class AvaliacaoTutor extends LightningElement {
    @api recordId;

    //#region Campos Avaliação Tutor
        idvaliacao = '';
        mesReferencia = '';
        anoReferencia = '';
        codigoTreinador = '';
        primeiraVisita = '';
        segundaVisita = '';
        observacoes = '';
    //#endregion

    //#region Campos Resposta Avaliação Tutor
        //#region Indicador = Resposta numérica
            indicador1= '';
            indicador2= '';
            indicador3= '';
            indicador4= '';
            indicador5= '';
            indicador6= '';
            indicador7= '';
            indicador8= '';
            indicador9= '';
            indicador10= '';
            indicador11= '';
            indicador12= '';
            indicador13= '';
            indicador14= '';
            indicador15= '';
            indicador16= '';
            indicador17= '';
            indicador18= '';
            indicador19= '';
            indicador20= '';
            indicador21= '';
            indicador22= '';
            indicador23= '';
            indicador24= '';
            indicador25= '';
            indicador26= '';
            indicador27= '';
            indicador28= '';
            indicador29= '';
            indicador30= '';
            indicador31= '';
            indicador32= '';
        //#endregion
        //#region Id do Resposta
            Idresposta1= '';
            Idresposta2= '';
            Idresposta3= '';
            Idresposta4= '';
            Idresposta5= '';
            Idresposta6= '';
            Idresposta7= '';
            Idresposta8= '';
            Idresposta9= '';
            Idresposta10= '';
            Idresposta11= '';
            Idresposta12= '';
            Idresposta13= '';
            Idresposta14= '';
            Idresposta15= '';
            Idresposta16= '';
            Idresposta17= '';
            Idresposta18= '';
            Idresposta19= '';
            Idresposta20= '';
            Idresposta21= '';
            Idresposta22= '';
            Idresposta23= '';
            Idresposta24= '';
            Idresposta25= '';
            Idresposta26= '';
            Idresposta27= '';
            Idresposta28= '';
            Idresposta29= '';
            Idresposta30= '';
            Idresposta31= '';
            Idresposta32= '';
        //#endregion
        //#region Parametro = Resposta de texto
            parametro1 = '';
            parametro2 = '';
            parametro3 = '';
            parametro4 = '';
            parametro5 = '';
            parametro6 = '';
            parametro7 = '';
            parametro8 = '';
            parametro9 = '';
            parametro10 = '';
            parametro11 = '';
            parametro12 = '';
            parametro13 = '';
            parametro14 = '';
            parametro15 = '';
            parametro16 = '';
            parametro17 = '';
            parametro18 = '';
            parametro19 = '';
            parametro20 = '';
            parametro21 = '';
            parametro22 = '';
            parametro23 = '';
            parametro24 = '';
            parametro25 = '';
            parametro26 = '';
            parametro27 = '';
            parametro28 = '';
            parametro29 = '';
            parametro30 = '';
            parametro31 = '';
            parametro32 = '';
        //#endregion
    //#endregion

    //#region Variáveis usadas na tela
        pagina1;
        pagina2;
        pagina3;
        avaliacaoAbrAgo = false;
        avaliacaoAbrAgoNov = false;
        avaliacaoAbrjunSetNov = false;
        avaliacaoAnual = false;
        avaliacaoSemestral = false;
        avaliacaoJun = false;
        avaliacaoMar = false;
        avaliacaoNov = false;
        existeAvaliacao = false;
        isLoaded;
        numeroTurmas='';
        
        @track opcoesParametros1 = [
            { label: 'Não', value: 'Não', indicador: '0'},
            { label: numeroTurmas, value: numeroTurmas, indicador: '3'}
        ];    
        @track opcoesParametros2 = [
            { label: '0 a 15', value: '0 a 15', indicador: '0'},
            { label: '16 a 25', value: '16 a 25', indicador: '1'},
            { label: '26 a 39', value: '26 a 39', indicador: '2'},
            { label: '40', value: '40', indicador: '3'}
        ];
        @track opcoesParametros3 = [
            { label: 'até 40%', value: 'até 40%', indicador: '0'},
            { label: '41 a 70%', value: '41 a 70%', indicador: '1'},
            { label: '71 a 99%', value: '71 a 99%', indicador: '2'},
            { label: '100%', value: '100%', indicador: '3'}
        ];
        @track opcoesParametros4 = [
            { label: 'Não entregou nenhuma', value: 'Não entregou nenhuma', indicador: '0'},
            { label: 'Entregou parcialmente', value: 'Entregou parcialmente', indicador: '1'},
            { label: 'Entregou todas em atraso', value: 'Entregou todas em atraso', indicador: '2'},
            { label: 'Entregou todas no prazo', value: 'Entregou todas no prazo', indicador: '3'}
        ];
        @track opcoesParametros5 = [
            { label: 'Nunca', value: 'Nunca', indicador: '0'},
            { label: 'Às vezes', value: 'Às vezes', indicador: '1'},
            { label: 'Frequentemente', value: 'Frequentemente', indicador: '2'},
            { label: 'Sempre', value: 'Sempre', indicador: '3'}
        ];
        @track opcoesParametros6 = [
            { label: 'Não executou', value: 'Não executou', indicador: '0'},
            { label: 'Entregou em atraso', value: 'Entregou em atraso', indicador: '2'},
            { label: 'Entregou no prazo', value: 'Entregou no prazo', indicador: '3'}
        ];

        @track meses = [
            { label: 'Janeiro', value: "01"},
            { label: 'Fevereiro', value: "02"},
            { label: 'Março', value: "03"},
            { label: 'Abril', value: "04"},
            { label: 'Maio', value: "05"},
            { label: 'Junho', value: "06"},
            { label: 'Julho', value: "07"},
            { label: 'Agosto', value: "08"},
            { label: 'Setembro', value: "09"},
            { label: 'Outubro', value: "10"},
            { label: 'Novembro', value: "11"},
            { label: 'Dezembro', value: "12"},
        ];
        @track anos = [
            { label: anoPassado, value: anoPassado},
            { label: anoAtual, value: anoAtual}
        ];
    //#endregion

    connectedCallback(){
        console.log('connectedCallback()');
        this.codigoTreinador = this.recordId;
        this.pagina1 = true;
        this.pagina2 = false;
        this.isLoaded = false;
        this.anoReferencia = anoAtual;
        console.log(this.recordId);
    }

    buscarRegistro(){
        console.log('buscarRegistro()');
        this.isLoaded = true;
        buscarAvaliacao({
            codTreinador: this.codigoTreinador,
            mesReferencia: this.mesReferencia,
            anoReferencia: this.anoReferencia
        })
        .then(result => {
            if(result.idAvaliacao != null){
                this.primeiraVisita = result.dataPrimeiraVisita;
                this.segundaVisita = result.dataSegundaVisita;
                this.idAvaliacao = result.idAvaliacao;
                this.observacoes = result.observacoes;
                console.log('result.observacoes: '+result.observacoes);
                
                result.avaliacaoTutorTO.forEach(item => {
                    if(item.Sequencia == '1'){
                        this.Idresposta1 = item.Codigo;
                        this.parametro1 = item.Resposta;
                        this.indicador1 = item.ValorResposta;
                    } else if(item.Sequencia == '2'){
                        this.Idresposta2 = item.Codigo;
                        this.parametro2 = item.Resposta;
                        this.indicador2 = item.ValorResposta;
                    } else if(item.Sequencia == '3'){
                        this.Idresposta3 = item.Codigo;
                        this.parametro3 = item.Resposta;
                        this.indicador3 = item.ValorResposta;
                    } else if(item.Sequencia == '4'){
                        this.Idresposta4 = item.Codigo;
                        this.parametro4 = item.Resposta;
                        this.indicador4 = item.ValorResposta;
                    } else if(item.Sequencia == '5'){
                        this.Idresposta5 = item.Codigo;
                        this.parametro5 = item.Resposta;
                        this.indicador5 = item.ValorResposta;
                    } else if(item.Sequencia == '6'){
                        this.Idresposta6 = item.Codigo;
                        this.parametro6 = item.Resposta;
                        this.indicador6 = item.ValorResposta;
                    } else if(item.Sequencia == '7'){
                        this.Idresposta7 = item.Codigo;
                        this.parametro7 = item.Resposta;
                        this.indicador7 = item.ValorResposta;
                    } else if(item.Sequencia == '8'){
                        this.Idresposta8 = item.Codigo;
                        this.parametro8 = item.Resposta;
                        this.indicador8 = item.ValorResposta;
                    } else if(item.Sequencia == '9'){
                        this.Idresposta9 = item.Codigo;
                        this.parametro9 = item.Resposta;
                        this.indicador9 = item.ValorResposta;
                    } else if(item.Sequencia == '10'){
                        this.Idresposta10 = item.Codigo;
                        this.parametro10 = item.Resposta;
                        this.indicador10 = item.ValorResposta;
                    } else if(item.Sequencia == '11'){
                        this.Idresposta11 = item.Codigo;
                        this.parametro11 = item.Resposta;
                        this.indicador11 = item.ValorResposta;
                    } else if(item.Sequencia == '12'){
                        this.Idresposta12 = item.Codigo;
                        this.parametro12 = item.Resposta;
                        this.indicador12 = item.ValorResposta;
                    } else if(item.Sequencia == '13'){
                        this.Idresposta13 = item.Codigo;
                        this.parametro13 = item.Resposta;
                        this.indicador13 = item.ValorResposta;
                    } else if(item.Sequencia == '14'){
                        this.Idresposta14 = item.Codigo;
                        this.parametro14 = item.Resposta;
                        this.indicador14 = item.ValorResposta;
                    } else if(item.Sequencia == '15'){
                        this.Idresposta15 = item.Codigo;
                        this.parametro15 = item.Resposta;
                        this.indicador15 = item.ValorResposta;
                    } else if(item.Sequencia == '16'){
                        this.Idresposta16 = item.Codigo;
                        this.parametro16 = item.Resposta;
                        this.indicador16 = item.ValorResposta;
                    } else if(item.Sequencia == '17'){
                        this.Idresposta17 = item.Codigo;
                        this.parametro17 = item.Resposta;
                        this.indicador17 = item.ValorResposta;
                    } else if(item.Sequencia == '18'){
                        this.Idresposta18 = item.Codigo;
                        this.parametro18 = item.Resposta;
                        this.indicador18 = item.ValorResposta;
                    } else if(item.Sequencia == '19'){
                        this.Idresposta19 = item.Codigo;
                        this.parametro19 = item.Resposta;
                        this.indicador19 = item.ValorResposta;
                    } else if(item.Sequencia == '20'){
                        this.Idresposta20 = item.Codigo;
                        this.parametro20 = item.Resposta;
                        this.indicador20 = item.ValorResposta;
                    } else if(item.Sequencia == '21'){
                        this.Idresposta21 = item.Codigo;
                        this.parametro21 = item.Resposta;
                        this.indicador21 = item.ValorResposta;
                    } else if(item.Sequencia == '22'){
                        this.Idresposta22 = item.Codigo;
                        this.parametro22 = item.Resposta;
                        this.indicador22 = item.ValorResposta;
                    } else if(item.Sequencia == '23'){
                        this.Idresposta23 = item.Codigo;
                        this.parametro23 = item.Resposta;
                        this.indicador23 = item.ValorResposta;
                    } else if(item.Sequencia == '24'){
                        this.Idresposta24 = item.Codigo;
                        this.parametro24 = item.Resposta;
                        this.indicador24 = item.ValorResposta;
                    } else if(item.Sequencia == '25'){
                        this.Idresposta25 = item.Codigo;
                        this.parametro25 = item.Resposta;
                        this.indicador25 = item.ValorResposta;
                    } else if(item.Sequencia == '26'){
                        this.Idresposta26 = item.Codigo;
                        this.parametro26 = item.Resposta;
                        this.indicador26 = item.ValorResposta;
                    } else if(item.Sequencia == '27'){
                        this.Idresposta27 = item.Codigo;
                        this.parametro27 = item.Resposta;
                        this.indicador27 = item.ValorResposta;
                    } else if(item.Sequencia == '28'){
                        this.Idresposta28 = item.Codigo;
                        this.parametro28 = item.Resposta;
                        this.indicador28 = item.ValorResposta;
                    } else if(item.Sequencia == '29'){
                        this.Idresposta29 = item.Codigo;
                        this.parametro29 = item.Resposta;
                        this.indicador29 = item.ValorResposta;
                    } else if(item.Sequencia == '30'){
                        this.Idresposta30 = item.Codigo;
                        this.parametro30 = item.Resposta;
                        this.indicador30 = item.ValorResposta;
                    } else if(item.Sequencia == '31'){
                        this.Idresposta31 = item.Codigo;
                        this.parametro31 = item.Resposta;
                        this.indicador31 = item.ValorResposta;
                    } else if(item.Sequencia == '32'){
                        this.Idresposta32 = item.Codigo;
                        this.parametro32 = item.Resposta;
                        this.indicador32 = item.ValorResposta;
                    }
                });
                this.preparandoRespostasVazias();
                this.existeAvaliacao = true;
            }else{
                this.limparCampos();
                this.existeAvaliacao = false;
        //#region INSERIR CHAMADA DOS NOVOS MÉTODOS AQUI  
            //1-Número de turmas   ||   2-Número de alunos/turmas
                contarAlunos({
                    codTreinador: this.codigoTreinador
                })
                .then(result => {
                    console.log('contarAlunos()');
                    console.log('lQuantTurmas' + result[0]);
                    console.log('lQuantAlunos' + result[1]);
                    //Regra da resposta para Quantidade de Turmas
                    this.indicador1 = result[0] < 2 ? 0 : 3;
                    this.parametro1 = result[0].toString();
                    this.numeroTurmas =result[0];

                    //Regra da resposta para Quantidade de Alunos
                    if(result[1] < 15){
                        this.indicador2 = 0;
                        this.parametro2 = '0 a 15';
                    } else if(result[1] < 25){
                        this.indicador2 = 1;
                        this.parametro2 = '16 a 25';
                    } else if(result[1] < 39){
                        this.indicador2 = 2;
                        this.parametro2 = '26 a 39';
                    } else {
                        this.indicador2 = 3;
                        this.parametro2 = '40';
                    }
                })
                .catch(error => {
                    console.log('contarAlunos() - erro:' + error);
                    this.showToast('Erro', 'Ocorreu um erro ao consultar dados', 'Error');
                });
                
                contarAvaliacaoEsportiva({
                    codTreinador: this.codigoTreinador,
                    mesReferencia: this.mesReferencia
                })
                .then(result => {
                    console.log('contarAvaliacaoEsportiva()');
                    //Regra da resposta para Quantidade de alunos com avaliação esportiva
                    if(result<=40){
                        this.parametro5 = 'até 40%'
                        this.indicador5 = 0
                    }else if(result >= 41 && result <= 70){
                        this.parametro5 = '41 a 70%'
                        this.indicador5 = 1
                    }else if(result >= 71 && result <= 99){
                        this.parametro5 = '71 a 99%'
                        this.indicador5 = 2
                    }else if(result == 100){
                        this.parametro5 = '100%'
                        this.indicador5 = 3
                    }
                })
                .catch(error => {
                    console.log('Verificar porcentagem de alunos com a Avaliação Esportiva registrada - erro:' + error.message);
                    this.showToast('Erro', 'Ocorreu um erro ao consultar dados 2', 'Error');
                });
                verificarCadastroCompleto({
                    codTreinador: this.codigoTreinador
                })
                .then(result => {
                    console.log('verificarCadastroCompleto()');
                    console.log('RESULT => ' + result);
                    
                    if(result < 41){
                        this.indicador3 = 0;
                        this.parametro3 = 'até 40%';
                    } else if(result > 40 && result < 71){
                        this.indicador3 = 1;
                        this.parametro3 = '41 a 70%';
                    } else if(result > 70 && result < 100){
                        this.indicador3 = 2;
                        this.parametro3 = '71 a 99%';
                    } else if(result == 100){
                        this.indicador3 = 3;
                        this.parametro3 = '100%';
                    }
                    console.log('Indicador 3: ' + this.indicador3);
                    console.log('Parametro 3: ' + this.parametro3);
                })
                .catch(error => {
                    console.log('Verificar quantidade de cadastros completos - erro:' + error);
                    this.showToast('Erro', 'Ocorreu um erro ao consultar dados', 'Error');
                });
 
                contarAvaliacaoSocioemocional({
                    codTreinador: this.codigoTreinador,
                    mesReferencia: this.mesReferencia
                })
                .then(result => {
                    console.log('contarAvaliacaoSocioemocional()');
                    console.log('RESULT AVALIAÇÃO SOCIOEMOCIONAL' + result);
                    if(result < 41){
                        this.indicador6 = 0;
                        this.parametro6 = 'até 40%';
                    } else if(result > 40 && result < 71){
                        this.indicador6 = 1;
                        this.parametro6 = '41 a 70%';
                    } else if(result > 70 && result < 100){
                        this.indicador6 = 2;
                        this.parametro6 = '71 a 99%';
                    } else if(result == 100){
                        this.indicador6 = 3;
                        this.parametro6 = '100%';
                    }
                })
                .catch(error => {
                    console.log('Verificar porcentagem de alunos com a Avaliação Socioemocional registrada - erro:' + error.getMessage());
                    this.showToast('Erro', 'Ocorreu um erro ao consultar dados', 'Error');
                });

                contarAlunosAprovados({
                    codTreinador: this.codigoTreinador
                })
                .then(result => {
                    console.log('contarAlunosAprovados()');
                    if(result < 41){
                        this.indicador8 = 0;
                        this.parametro8 = 'até 40%';
                    } else if(result > 40 && result < 71){
                        this.indicador8 = 1;
                        this.parametro8 = '41 a 70%';
                    } else if(result > 70 && result < 100){
                        this.indicador8 = 2;
                        this.parametro8 = '71 a 99%';
                    } else if(result == 100){
                        this.indicador8 = 3;
                        this.parametro8 = '100%';
                    }
                    console.log('Indicador 8: ' + this.indicador8);
                    console.log('Parametro 8: ' + this.parametro8);
                })
                .catch(error => {
                    console.log('Verificar porcentagem de alunos Aprovados - erro:' + error);
                    this.showToast('Erro', 'Ocorreu um erro ao consultar dados', 'Error');
                });
            //4-Turmas com controle de frequência registrado (aulas ministradas)
                percentControleFrequencia({
                    codTreinador: this.codigoTreinador,
                    mesReferencia: parseInt(this.mesReferencia),
                    anoReferencia: parseInt(this.anoReferencia)
                })
                .then(result => {

                    //Regra da resposta para Controle de Frequência
                    if(result<=40){
                        this.parametro4 = 'até 40%'
                        this.indicador4 = 0
                    }else if(result >= 41 && result <= 70){
                        this.parametro4 = '41 a 70%'
                        this.indicador4 = 1
                    }else if(result >= 71 && result <= 99){
                        this.parametro4 = '71 a 99%'
                        this.indicador4 = 2
                    }else if(result == 100){
                        this.parametro4 = '100%'
                        this.indicador4 = 3
                    }
                })
                .catch(error => {
                    console.log('percentControleFrequencia() - erro:' + error);
                    this.showToast('Erro', 'Ocorreu um erro ao consultar dados', 'Error');
                });

                contarAlunosComNota({
                    codTreinador: this.codigoTreinador,
                    mesReferencia: this.mesReferencia
                })
                .then(result => {

                    //Regra da resposta para Controle de Frequência
                    if(result<=40){
                        this.parametro7 = 'até 40%'
                        this.indicador7 = 0
                    }else if(result >= 41 && result <= 70){
                        this.parametro7 = '41 a 70%'
                        this.indicador7 = 1
                    }else if(result >= 71 && result <= 99){
                        this.parametro7 = '71 a 99%'
                        this.indicador7 = 2
                    }else if(result == 100){
                        this.parametro7 = '100%'
                        this.indicador7 = 3
                    }
                })
                .catch(error => {
                    console.log('contarAlunosComNota() - erro:' + error.message);
                    this.showToast('Erro', 'Ocorreu um erro ao consultar dados', 'Error');
                });
            }
        //#endregion 
        })
        .catch(error => {
            this.limparCampos();
            console.log('buscarRegistro() erro:' + error);
            this.showToast('Erro', 'Ocorreu um erro ao consultar dados', 'Error');
        });

        this.isLoaded = false;
    }

    salvar (event) {
        console.log('salvar()');
        var resultado = this.respostasObrigatorias();
        console.log(resultado);
        if(resultado == 'Existem questões não respondidas! '){
            console.log('alerta de campos obrigatórios');
            this.showToast('Erro', resultado , 'Error');
        } else {
            let respostas = [
                {'Codigo' : this.Idresposta1, 'Sequencia' : '1', 'Resposta' : this.indicador1, 'ValorResposta' : this.parametro1},
                {'Codigo' : this.Idresposta2, 'Sequencia' : '2', 'Resposta' : this.indicador2, 'ValorResposta' : this.parametro2},
                {'Codigo' : this.Idresposta3, 'Sequencia' : '3', 'Resposta' : this.indicador3, 'ValorResposta' : this.parametro3},
                {'Codigo' : this.Idresposta4, 'Sequencia' : '4', 'Resposta' : this.indicador4, 'ValorResposta' : this.parametro4},
                {'Codigo' : this.Idresposta5, 'Sequencia' : '5', 'Resposta' : this.indicador5, 'ValorResposta' : this.parametro5},
                {'Codigo' : this.Idresposta6, 'Sequencia' : '6', 'Resposta' : this.indicador6, 'ValorResposta' : this.parametro6},
                {'Codigo' : this.Idresposta7, 'Sequencia' : '7', 'Resposta' : this.indicador7, 'ValorResposta' : this.parametro7},
                {'Codigo' : this.Idresposta8, 'Sequencia' : '8', 'Resposta' : this.indicador8, 'ValorResposta' : this.parametro8},
                {'Codigo' : this.Idresposta9, 'Sequencia' : '9', 'Resposta' : this.indicador9, 'ValorResposta' : this.parametro9},
                {'Codigo' : this.Idresposta10, 'Sequencia' : '10', 'Resposta' : this.indicador10, 'ValorResposta' : this.parametro10},
                {'Codigo' : this.Idresposta11, 'Sequencia' : '11', 'Resposta' : this.indicador11, 'ValorResposta' : this.parametro11},
                {'Codigo' : this.Idresposta12, 'Sequencia' : '12', 'Resposta' : this.indicador12, 'ValorResposta' : this.parametro12},
                {'Codigo' : this.Idresposta13, 'Sequencia' : '13', 'Resposta' : this.indicador13, 'ValorResposta' : this.parametro13},
                {'Codigo' : this.Idresposta14, 'Sequencia' : '14', 'Resposta' : this.indicador14, 'ValorResposta' : this.parametro14},
                {'Codigo' : this.Idresposta15, 'Sequencia' : '15', 'Resposta' : this.indicador15, 'ValorResposta' : this.parametro15},
                {'Codigo' : this.Idresposta16, 'Sequencia' : '16', 'Resposta' : this.indicador16, 'ValorResposta' : this.parametro16},
                {'Codigo' : this.Idresposta17, 'Sequencia' : '17', 'Resposta' : this.indicador17, 'ValorResposta' : this.parametro17},
                {'Codigo' : this.Idresposta18, 'Sequencia' : '18', 'Resposta' : this.indicador18, 'ValorResposta' : this.parametro18},
                {'Codigo' : this.Idresposta19, 'Sequencia' : '19', 'Resposta' : this.indicador19, 'ValorResposta' : this.parametro19},
                {'Codigo' : this.Idresposta20, 'Sequencia' : '20', 'Resposta' : this.indicador20, 'ValorResposta' : this.parametro20},
                {'Codigo' : this.Idresposta21, 'Sequencia' : '21', 'Resposta' : this.indicador21, 'ValorResposta' : this.parametro21},
                {'Codigo' : this.Idresposta22, 'Sequencia' : '22', 'Resposta' : this.indicador22, 'ValorResposta' : this.parametro22},
                {'Codigo' : this.Idresposta23, 'Sequencia' : '23', 'Resposta' : this.indicador23, 'ValorResposta' : this.parametro23},
                {'Codigo' : this.Idresposta24, 'Sequencia' : '24', 'Resposta' : this.indicador24, 'ValorResposta' : this.parametro24},
                {'Codigo' : this.Idresposta25, 'Sequencia' : '25', 'Resposta' : this.indicador25, 'ValorResposta' : this.parametro25},
                {'Codigo' : this.Idresposta26, 'Sequencia' : '26', 'Resposta' : this.indicador26, 'ValorResposta' : this.parametro26},
                {'Codigo' : this.Idresposta27, 'Sequencia' : '27', 'Resposta' : this.indicador27, 'ValorResposta' : this.parametro27},
                {'Codigo' : this.Idresposta28, 'Sequencia' : '28', 'Resposta' : this.indicador28, 'ValorResposta' : this.parametro28},
                {'Codigo' : this.Idresposta29, 'Sequencia' : '29', 'Resposta' : this.indicador29, 'ValorResposta' : this.parametro29},
                {'Codigo' : this.Idresposta30, 'Sequencia' : '30', 'Resposta' : this.indicador30, 'ValorResposta' : this.parametro30},
                {'Codigo' : this.Idresposta31, 'Sequencia' : '31', 'Resposta' : this.indicador31, 'ValorResposta' : this.parametro31},
                {'Codigo' : this.Idresposta32, 'Sequencia' : '32', 'Resposta' : this.indicador32, 'ValorResposta' : this.parametro32}
            ];

            salvarAvaliacao({
                idAvaliacao: this.idAvaliacao,
                mesReferencia: this.mesReferencia,
                anoReferencia: this.anoReferencia,
                codTreinador: this.codigoTreinador,
                primeiraVisita: this.primeiraVisita,
                segundaVisita: this.segundaVisita,
                observacoes: this.observacoes,
                respostas: JSON.stringify(respostas)
            })
            .then(result => {
                console.log('.then(result => { | result: '+ result);
                if(result){
                    this.showToast('Sucesso', 'Avaliação salva com sucesso!', 'success');
                    //this.closeQuickAction();
                    buscarAvaliacao({
                        codTreinador: this.codigoTreinador,
                        mesReferencia: this.mesReferencia,
                        anoReferencia: this.anoReferencia
                    })
                    .then(result => {
                        if(result.idAvaliacao != null){
                            this.idAvaliacao = result.idAvaliacao;
                            this.pagina2 = false;
                            this.pagina3 = true;
                        }
                    })
                    .catch(error => {
                        console.log('Não encontrou avaliação');
                        console.log('erro:' + error);
                        console.log('Avaliação.id: '+ this.idAvaliacao)
                        
                    });
                    this.pagina2 = false;
                    this.pagina3 = true;
                } else {
                    this.showToast('Erro', 'Erro ao salvar o registro, contate seu administrardor.', 'Error');
                }
            })
            .catch(error => {
                console.log('erro:' + error);
                this.showToast('Erro', 'Ocorreu um erro ao salvar os dados', 'Error');
            })
        }
    }

    //onChange: AvaliaçãoTutor__c
    atualizarValoresAvalicao (event) {
        console.log('atualizarValoresAvalicao()');
        let item = event.target.name;
        let value = event.target.value;

        if (item == 'CodigoTreinador') {
            this.codigoTreinador = value;
        } else if (item == 'DataPrimeiraVisita') {
            this.primeiraVisita = value;
        } else if (item == 'DataSegundaVisita') {
            this.segundaVisita = value;
        } else if (item == 'Observacoes') {
            this.observacoes = value;
            console.log('observacoes: '+this.observacoes);
        }
        if(item != 'Observacoes') {
            if(this.codigoTreinador !== '' && this.mesReferencia !== '' && this.anoReferencia !== '' && (item != 'DataPrimeiraVisita' && item != 'DataSegundaVisita')){
                this.buscarRegistro();
            }
        }
    }

    avancar(event){
        console.log('avancar()');
        var campoObrigatorio = 'Os seguintes campos precisam ser preenchidos: ';
        if (this.mesReferencia == undefined || this.mesReferencia == '') {
            campoObrigatorio += 'Mês referência; ';
            console.log(campoObrigatorio);
        }
        if (this.anoReferencia == undefined || this.anoReferencia == '') {
            campoObrigatorio += 'Ano referência; ';
            console.log(campoObrigatorio);
        }
        if (this.codigoTreinador == undefined || this.codigoTreinador == '') {
            campoObrigatorio += 'Código Treinador; ';
            console.log(campoObrigatorio);
        }
        if (this.primeiraVisita == undefined || this.primeiraVisita == '') {
            campoObrigatorio += 'Data primeira visita; ';
            console.log(campoObrigatorio);
        }
        if(campoObrigatorio == 'Os seguintes campos precisam ser preenchidos: '){
            this.pagina1 = false;
            this.pagina2 = true;
        } else {
            console.log('alerta de campos obrigatórios');
            this.showToast('Erro', campoObrigatorio , 'Error');
        }
        console.log('avaliacaoAbrAgo '+ this.avaliacaoAbrAgo);
        console.log('avaliacaoAbrAgoNov '+ this.avaliacaoAbrAgoNov);
        console.log('avaliacaoAbrjunSetNov '+ this.avaliacaoAbrjunSetNov);
        console.log('avaliacaoAnual '+ this.avaliacaoAnual);
        console.log('avaliacaoSemestral '+ this.avaliacaoSemestral);
        console.log('avaliacaoJun '+ this.avaliacaoJun);
        console.log('avaliacaoMar '+ this.avaliacaoMar);
        console.log('avaliacaoNov '+ this.avaliacaoNov);
    }

    //onChange: RespostasAvaliacaoTutor__c
    atualizarRespostas (event) {
        console.log('atualizarRespostas()');
        let item = event.target.name;
        let value = event.target.value;
        let indicador = event.target.options.find(opt => opt.value === event.detail.value).indicador;
        console.log('item: '+item);
        console.log('value: '+value);
        console.log('indicador: '+indicador);
        //let descricaoitem = event.target.options.find(opt => opt.value === event.detail.value).label;

        if (item == 'resposta1') {
            this.indicador1 = indicador;
            this.parametro1 = value;
        } else if (item == 'resposta2') {
            this.indicador2 = indicador;
            this.parametro2 = value;
        } else if (item == 'resposta3') {
            this.indicador3 = indicador;
            this.parametro3 = value;
        } else if (item == 'resposta4') {
            this.indicador4 = indicador;
            this.parametro4 = value;
        } else if (item == 'resposta5') {
            this.indicador5 = indicador;
            this.parametro5 = value;
        } else if (item == 'resposta6') {
            this.indicador6 = indicador;
            this.parametro6 = value;
        } else if (item == 'resposta7') {
            this.indicador7 = indicador;
            this.parametro7 = value;
        } else if (item == 'resposta8') {
            this.indicador8 = indicador;
            this.parametro8 = value;
        } else if (item == 'resposta9') {
            this.indicador9 = indicador;
            this.parametro9 = value;
        } else if (item == 'resposta10') {
            this.indicador10 = indicador;
            this.parametro10 = value;
        } else if (item == 'resposta11') {
            this.indicador11 = indicador;
            this.parametro11 = value;
        } else if (item == 'resposta12') {
            this.indicador12 = indicador;
            this.parametro12 = value;
        } else if (item == 'resposta13') {
            this.indicador13 = indicador;
            this.parametro13 = value;
        } else if (item == 'resposta14') {
            this.indicador14 = indicador;
            this.parametro14 = value;
        } else if (item == 'resposta15') {
            this.indicador15 = indicador;
            this.parametro15 = value;
        } else if (item == 'resposta16') {
            this.indicador16 = indicador;
            this.parametro16 = value;
        } else if (item == 'resposta17') {
            this.indicador17 = indicador;
            this.parametro17 = value;
        } else if (item == 'resposta18') {
            this.indicador18 = indicador;
            this.parametro18 = value;
        } else if (item == 'resposta19') {
            this.indicador19 = indicador;
            this.parametro19 = value;
        } else if (item == 'resposta20') {
            this.indicador20 = indicador;
            this.parametro20 = value;
        } else if (item == 'resposta21') {
            this.indicador21 = indicador;
            this.parametro21 = value;
        } else if (item == 'resposta22') {
            this.indicador22 = indicador;
            this.parametro22 = value;
        } else if (item == 'resposta23') {
            this.indicador23 = indicador;
            this.parametro23 = value;
        } else if (item == 'resposta24') {
            this.indicador24 = indicador;
            this.parametro24 = value;
        } else if (item == 'resposta25') {
            this.indicador25 = indicador;
            this.parametro25 = value;
        } else if (item == 'resposta26') {
            this.indicador26 = indicador;
            this.parametro26 = value;
        } else if (item == 'resposta27') {
            this.indicador27 = indicador;
            this.parametro27 = value;
        } else if (item == 'resposta28') {
            this.indicador28 = indicador;
            this.parametro28 = value;
        } else if (item == 'resposta29') {
            this.indicador29 = indicador;
            this.parametro29 = value;
        } else if (item == 'resposta30') {
            this.indicador30 = indicador;
            this.parametro30 = value;
        } else if (item == 'resposta31') {
            this.indicador31 = indicador;
            this.parametro31 = value;
        } else if (item == 'resposta32') {
            this.indicador32 = indicador;
            this.parametro32 = value;
        }
    }
    
    preparandoRespostasVazias(){
        console.log('preparandoRespostasVazias()');
        if(this.parametro1 == '' || this.parametro1 == undefined){
            console.log('vazia - 1');
            this.indicador1 = 0;
            this.parametro1 = 'Não preenchido';
        }
        if(this.parametro2 == '' || this.parametro2 == undefined){
            console.log('vazia - 2');
            this.indicador2 = 0;
            this.parametro2 = 'Não preenchido';
        }
        if(this.parametro3 == '' || this.parametro3 == undefined){
            console.log('vazia - 3');
            this.indicador3 = 0;
            this.parametro3 = 'Não preenchido';
        }
        if(this.parametro4 == '' || this.parametro4 == undefined){
            console.log('vazia - 4');
            this.indicador4 = 0;
            this.parametro4 = 'Não preenchido';
        }
        if((this.parametro5 == '' || this.parametro5 == undefined) && this.avaliacaoAbrAgoNov == true){
            console.log('vazia - 5');
            this.indicador5 = 0;
            this.parametro5 = 'Não preenchido';
        }
        if((this.parametro6 == '' || this.parametro6 == undefined) && this.avaliacaoAbrAgoNov == true){
            console.log('vazia - 6');
            this.indicador6 = 0;
            this.parametro6 = 'Não preenchido';
        }
        if((this.parametro7 == '' || this.parametro7 == undefined) && this.avaliacaoAbrjunSetNov == true){
            console.log('vazia - 7');
            this.indicador7 = 0;
            this.parametro7 = 'Não preenchido';
        }
        if((this.parametro8 == '' || this.parametro8 == undefined) && this.avaliacaoNov == true){
            console.log('vazia - 8');
            this.indicador8 = 0;
            this.parametro8 = 'Não preenchido';
        }
        if((this.parametro9 == '' || this.parametro9 == undefined) && this.avaliacaoMar == true){
            console.log('vazia - 9');
            this.indicador9 = 0;
            this.parametro9 = 'Não preenchido';
        }
        if(this.parametro10 == '' || this.parametro10 == undefined){
            console.log('vazia - 10');
            this.indicador10 = 0;
            this.parametro10 = 'Não preenchido';
        }
        if(this.parametro11 == '' || this.parametro11 == undefined){
            console.log('vazia - 11');
            this.indicador11 = 0;
            this.parametro11 = 'Não preenchido';
        }
        if((this.parametro12 == '' || this.parametro12 == undefined) && this.avaliacaoAbrAgo == true){
            console.log('vazia - 12');
            this.indicador12 = 0;
            this.parametro12 = 'Não preenchido';
        }
        if(this.parametro13 == '' || this.parametro13 == undefined){
            console.log('vazia - 13');
            this.indicador13 = 0;
            this.parametro13 = 'Não preenchido';
        }
        if((this.parametro14 == '' || this.parametro14 == undefined) && this.avaliacaoJun == true){
            console.log('vazia - 14');
            this.indicador14 = 0;
            this.parametro14 = 'Não preenchido';
        }
        if((this.parametro15 == '' || this.parametro15 == undefined) && this.avaliacaoNov == true){
            console.log('vazia - 15');
            this.indicador15 = 0;
            this.parametro15 = 'Não preenchido';
        }
        if(this.parametro16 == '' || this.parametro16 == undefined){
            console.log('vazia - 16');
            this.indicador16 = 0;
            this.parametro16 = 'Não preenchido';
        }
        if(this.parametro17 == '' || this.parametro17 == undefined){
            console.log('vazia - 17');
            this.indicador17 = 0;
            this.parametro17 = 'Não preenchido';
        }
        if(this.parametro18 == '' || this.parametro18 == undefined){
            console.log('vazia - 18');
            this.indicador18 = 0;
            this.parametro18 = 'Não preenchido';
        }
        if(this.parametro19 == '' || this.parametro19 == undefined){
            console.log('vazia - 19');
            this.indicador19 = 0;
            this.parametro19 = 'Não preenchido';
        }
        if(this.parametro20 == '' || this.parametro20 == undefined){
            console.log('vazia - 20');
            this.indicador20 = 0;
            this.parametro20 = 'Não preenchido';
        }
        if(this.parametro21 == '' || this.parametro21 == undefined){
            console.log('vazia - 21');
            this.indicador21 = 0;
            this.parametro21 = 'Não preenchido';
        }
        if(this.parametro22 == '' || this.parametro22 == undefined){
            console.log('vazia -22');
            this.indicador22 = 0;
            this.parametro22 = 'Não preenchido';
        }
        if(this.parametro23 == '' || this.parametro23 == undefined){
            console.log('vazia - 23');
            this.indicador23 = 0;
            this.parametro23 = 'Não preenchido';
        }
        if(this.parametro24 == '' || this.parametro24 == undefined){
            console.log('vazia - 24');
            this.indicador24 = 0;
            this.parametro24 = 'Não preenchido';
        }
        if(this.parametro25 == '' || this.parametro25 == undefined){
            console.log('vazia - 25');
            this.indicador25 = 0;
            this.parametro25 = 'Não preenchido';
        }
        if(this.parametro26 == '' || this.parametro26 == undefined){
            console.log('vazia - 26');
            this.indicador26 = 0;
            this.parametro26 = 'Não preenchido';
        }
        if(this.parametro27 == '' || this.parametro27 == undefined){
            console.log('vazia - 27');
            this.indicador27 = 0;
            this.parametro27 = 'Não preenchido';
        }
        if(this.parametro28 == '' || this.parametro28 == undefined){
            console.log('vazia - 28');
            this.indicador28 = 0;
            this.parametro28 = 'Não preenchido';
        }
        if(this.parametro29 == '' || this.parametro29 == undefined){
            console.log('vazia - 29');
            this.indicador29 = 0;
            this.parametro29 = 'Não preenchido';
        }
        if(this.parametro30 == '' || this.parametro30 == undefined){
            console.log('vazia - 30');
            this.indicador30 = 0;
            this.parametro30 = 'Não preenchido';
        }
        if(this.parametro31 == '' || this.parametro31 == undefined){
            console.log('vazia - 31');
            this.indicador31 = 0;
            this.parametro31 = 'Não preenchido';
        }
        if(this.parametro32 == '' || this.parametro32 == undefined){
            console.log('vazia - 32');
            this.indicador32 = 0;
            this.parametro32 = 'Não preenchido';
        }
    }

    atualizarMesReferencia(event){
        console.log('atualizaMesReferencia()');
        let item = event.target.name;
        let value = event.target.value;
        
        if(item == 'mesReferencia'){
            this.mesReferencia = value;
        } else if(item == 'anoReferencia'){
            this.anoReferencia = value;
        }
        if(item == 'mesReferencia'){
            if(value == 1){
                this.avaliacaoAbrAgo = false;
                this.avaliacaoAbrAgoNov = false;
                this.avaliacaoAbrjunSetNov = false;
                this.avaliacaoAnual = false;
                this.avaliacaoSemestral = false;
                this.avaliacaoJun = false;
                this.avaliacaoMar = false;
                this.avaliacaoNov = false;
            } else if(value == 2){
                this.avaliacaoAbrAgo = false;
                this.avaliacaoAbrAgoNov = false;
                this.avaliacaoAbrjunSetNov = false;
                this.avaliacaoAnual = false;
                this.avaliacaoSemestral = false;
                this.avaliacaoJun = false;
                this.avaliacaoMar = false;
                this.avaliacaoNov = false;
            } else if(value == 3){
                this.avaliacaoAbrAgo = false;
                this.avaliacaoAbrAgoNov = false;
                this.avaliacaoAbrjunSetNov = false;
                this.avaliacaoAnual = false;
                this.avaliacaoSemestral = false;
                this.avaliacaoJun = false;
                this.avaliacaoMar = true;
                this.avaliacaoNov = false;
            } else if(value == 4){
                this.avaliacaoAbrAgo = true;
                this.avaliacaoAbrAgoNov = true;
                this.avaliacaoAbrjunSetNov = true;
                this.avaliacaoAnual = false;
                this.avaliacaoSemestral = false;
                this.avaliacaoJun = false;
                this.avaliacaoMar = false;
                this.avaliacaoNov = false;
            } else if(value == 5){
                this.avaliacaoAbrAgo = false;
                this.avaliacaoAbrAgoNov = false;
                this.avaliacaoAbrjunSetNov = false;
                this.avaliacaoAnual = false;
                this.avaliacaoSemestral = false;
                this.avaliacaoJun = false;
                this.avaliacaoMar = false;
                this.avaliacaoNov = false;
            } else if(value == 6){
                this.avaliacaoAbrAgo = false;
                this.avaliacaoAbrAgoNov = false;
                this.avaliacaoAbrjunSetNov = true;
                this.avaliacaoAnual = false;
                this.avaliacaoSemestral = false;
                this.avaliacaoJun = true;
                this.avaliacaoMar = false;
                this.avaliacaoNov = false;
            } else if(value == 7){
                this.avaliacaoAbrAgo = false;
                this.avaliacaoAbrAgoNov = false;
                this.avaliacaoAbrjunSetNov = false;
                this.avaliacaoAnual = false;
                this.avaliacaoSemestral = false;
                this.avaliacaoJun = false;
                this.avaliacaoMar = false;
                this.avaliacaoNov = false;
            } else if(value == 8){
                this.avaliacaoAbrAgo = true;
                this.avaliacaoAbrAgoNov = true;
                this.avaliacaoAbrjunSetNov = false;
                this.avaliacaoAnual = false;
                this.avaliacaoSemestral = false;
                this.avaliacaoJun = false;
                this.avaliacaoMar = false;
                this.avaliacaoNov = false;
            } else if(value == 9){
                this.avaliacaoAbrAgo = false;
                this.avaliacaoAbrAgoNov = false;
                this.avaliacaoAbrjunSetNov = true;
                this.avaliacaoAnual = false;
                this.avaliacaoSemestral = false;
                this.avaliacaoJun = false;
                this.avaliacaoMar = false;
                this.avaliacaoNov = false;
            } else if(value == 10){
                this.avaliacaoAbrAgo = false;
                this.avaliacaoAbrAgoNov = false;
                this.avaliacaoAbrjunSetNov = false;
                this.avaliacaoAnual = false;
                this.avaliacaoSemestral = false;
                this.avaliacaoJun = false;
                this.avaliacaoMar = false;
                this.avaliacaoNov = false;
            } else if(value == 11){
                this.avaliacaoAbrAgo = false;
                this.avaliacaoAbrAgoNov = true;
                this.avaliacaoAbrjunSetNov = true;
                this.avaliacaoAnual = false;
                this.avaliacaoSemestral = false;
                this.avaliacaoJun = false;
                this.avaliacaoMar = false;
                this.avaliacaoNov = true;
            } else if(value == 12){
                this.avaliacaoAbrAgo = false;
                this.avaliacaoAbrAgoNov = false;
                this.avaliacaoAbrjunSetNov = false;
                this.avaliacaoAnual = false;
                this.avaliacaoSemestral = false;
                this.avaliacaoJun = false;
                this.avaliacaoMar = false;
                this.avaliacaoNov = false;
            }
            console.log('avaliacaoAbrAgo '+ this.avaliacaoAbrAgo);
            console.log('avaliacaoAbrAgoNov '+ this.avaliacaoAbrAgoNov);
            console.log('avaliacaoAbrjunSetNov '+ this.avaliacaoAbrjunSetNov);
            console.log('avaliacaoAnual '+ this.avaliacaoAnual);
            console.log('avaliacaoSemestral '+ this.avaliacaoSemestral);
            console.log('avaliacaoJun '+ this.avaliacaoJun);
            console.log('avaliacaoMar '+ this.avaliacaoMar);
            console.log('avaliacaoNov '+ this.avaliacaoNov);
        }

        if(this.codigoTreinador !== '' && this.mesReferencia !== '' && this.anoReferencia !== '' && (item === 'mesReferencia' || item === 'anoreferencia')){
            this.buscarRegistro();
        }
    }

    limparCampos(){
        console.log('limparCampos()');
        this.idAvaliacao = '';
        this.primeiraVisita = null;
        this.segundaVisita = null;

        this.idAvaliacao = '';
        this.Idresposta1 = '';
        this.Idresposta2 = '';
        this.Idresposta3 = '';
        this.Idresposta4 = '';
        this.Idresposta5 = '';
        this.Idresposta6 = '';
        this.Idresposta7 = '';
        this.Idresposta8 = '';
        this.Idresposta9 = '';
        this.Idresposta10 = '';
        this.Idresposta11 = '';
        this.Idresposta12 = '';
        this.Idresposta13 = '';
        this.Idresposta14 = '';
        this.Idresposta15 = '';
        this.Idresposta16 = '';
        this.Idresposta17 = '';
        this.Idresposta18 = '';
        this.Idresposta19 = '';
        this.Idresposta20 = '';
        this.Idresposta21 = '';
        this.Idresposta22 = '';
        this.Idresposta23 = '';
        this.Idresposta24 = '';
        this.Idresposta25 = '';
        this.Idresposta26 = '';
        this.Idresposta27 = '';
        this.Idresposta28 = '';
        this.Idresposta29 = '';
        this.Idresposta30 = '';
        this.Idresposta31 = '';
        this.Idresposta32 = '';

        this.indicador1 = '';
        this.indicador2 = '';
        this.indicador3 = '';
        this.indicador4 = '';
        this.indicador5 = '';
        this.indicador6 = '';
        this.indicador7 = '';
        this.indicador8 = '';
        this.indicador9 = '';
        this.indicador10 = '';
        this.indicador11 = '';
        this.indicador12 = '';
        this.indicador13 = '';
        this.indicador14 = '';
        this.indicador15 = '';
        this.indicador16 = '';
        this.indicador17 = '';
        this.indicador18 = '';
        this.indicador19 = '';
        this.indicador20 = '';
        this.indicador21 = '';
        this.indicador22 = '';
        this.indicador23 = '';
        this.indicador24 = '';
        this.indicador25 = '';
        this.indicador26 = '';
        this.indicador27 = '';
        this.indicador28 = '';
        this.indicador29 = '';
        this.indicador30 = '';
        this.indicador31 = '';
        this.indicador32 = '';

        this.parametro1 = '';
        this.parametro2 = '';
        this.parametro3 = '';
        this.parametro4 = '';
        this.parametro5 = '';
        this.parametro6 = '';
        this.parametro7 = '';
        this.parametro8 = '';
        this.parametro9 = '';
        this.parametro10 = '';
        this.parametro11 = '';
        this.parametro12 = '';
        this.parametro13 = '';
        this.parametro14 = '';
        this.parametro15 = '';
        this.parametro16 = '';
        this.parametro17 = '';
        this.parametro18 = '';
        this.parametro19 = '';
        this.parametro20 = '';
        this.parametro21 = '';
        this.parametro22 = '';
        this.parametro23 = '';
        this.parametro24 = '';
        this.parametro25 = '';
        this.parametro26 = '';
        this.parametro27 = '';
        this.parametro28 = '';
        this.parametro29 = '';
        this.parametro30 = '';
        this.parametro31 = '';
        this.parametro32 = '';
        this.preparandoRespostasVazias();
    }
    

    //#region Ferramentas
        respostasObrigatorias(){
            console.log('respostasObrigatorias()');
            var campoObrigatorio = 'Nenhuma questão não respondida ';
            //1-Número de turmas
            if (this.parametro1 == undefined || this.parametro1 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('1-Número de turmas');
                console.log(this.parametro1);
            }
            //2-Número de alunos/turmas
            else if (this.parametro2 == undefined || this.parametro2 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('2-Número de alunos/turmas');
                console.log(this.parametro2);
            }
            //3-Alunos/as matriculados com cadastro completo
            else if (this.parametro3 == undefined || this.parametro3 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('3-Alunos/as matriculados com cadastro completo');
                console.log(this.parametro3);
            }
            //4-Turmas com controle de frequência registrado (aulas ministradas)
            else if (this.parametro4 == undefined || this.parametro4 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('4-Turmas com controle de frequência registrado (aulas ministradas)');
                console.log(this.parametro4);
            }
            //5-Realização das avaliações esportivas (alunos matriculados)
            else if ((this.parametro5 == undefined || this.parametro5 == '') && this.avaliacaoAbrAgoNov == true) {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('5-Realização das avaliações esportivas (alunos matriculados)');
                console.log(this.parametro5);
            }
            //6-Realização das avaliações socioemocionais (alunos matriculados)
            else if ((this.parametro6 == undefined || this.parametro6 == '') && this.avaliacaoAbrAgoNov == true) {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('6-Realização das avaliações socioemocionais (alunos matriculados)');
                console.log(this.parametro6);
            }
            //7-Notas de português e matemática (alunos matriculados)
            else if ((this.parametro7 == undefined || this.parametro7 == '') && this.avaliacaoAbrjunSetNov == true) {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('7-Notas de português e matemática (alunos matriculados)');
                console.log(this.parametro7);
            }
            //8-Aprovação no ano letivo (alunos matriculados)
            else if ((this.parametro8 == undefined || this.parametro8 == '') && this.avaliacaoNov == true) {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('8-Aprovação no ano letivo (alunos matriculados)');
                console.log(this.parametro8);
            }
            //9-Realização de reuniões com famílias
            else if ((this.parametro9 == undefined || this.parametro9 == '') && this.avaliacaoMar == true) {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('9-Realização de reuniões com famílias');
                console.log(this.parametro9);
            }
            //10-Tarefas do curso online entregues no prazo
            else if (this.parametro10 == undefined || this.parametro10 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('10-Tarefas do curso online entregues no prazo');
                console.log(this.parametro10);
            }
            //11-Presença no encontro de formação
            else if (this.parametro11 == undefined || this.parametro11 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('11-Presença no encontro de formação');
                console.log(this.parametro11);
            }
            //12-Planeja o semestre de acordo com as diretrizes
            else if ((this.parametro12 == undefined || this.parametro12 == '') && this.avaliacaoAbrAgo == true) {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('12-Planeja o semestre de acordo com as diretrizes');
                console.log(this.parametro12);
            }
            //13-Utiliza o Passaporte Superação para estabelecimento de metas e acompanhamento dos/as atletas
            else if (this.parametro13 == undefined || this.parametro13 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('13-Utiliza o Passaporte Superação para estabelecimento de metas e acompanhamento dos/as atletas');
                console.log(this.parametro13);
            }
            //14-Realizou o Super Festival
            else if ((this.parametro14 == undefined || this.parametro14 == '') && this.avaliacaoJun == true) {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('14-Realizou o Super Festival');
                console.log(this.parametro14);
            }
            //15- Participou do Festival Superação
            else if ((this.parametro15 == undefined || this.parametro15 == '') && this.avaliacaoNov == true) {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('15- Participou do Festival Superação');
                console.log(this.parametro15);
            }
            //16-Prepara o espaço de treino com antecedência
            else if (this.parametro16 == undefined || this.parametro16 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('16-Prepara o espaço de treino com antecedência');
                console.log(this.parametro16);
            }
            //17-Tem planejamento prévio adequado à turma
            else if (this.parametro17 == undefined || this.parametro17 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('17-Tem planejamento prévio adequado à turma');
                console.log(this.parametro17);
            }
            //18-Realiza atividades de aprendizagem para desenvolvimento socioemocional
            else if (this.parametro18 == undefined || this.parametro18 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('18-Realiza atividades de aprendizagem para desenvolvimento socioemocional');
                console.log(this.parametro18);
            }
            //19-Utiliza as estratégias previstas no modelo Superação (roda, jogos de criatividade, desafios coordenativos, ...)
            else if (this.parametro19 == undefined || this.parametro19 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('19-Utiliza as estratégias previstas no modelo Superação (roda, jogos de criatividade, desafios coordenativos, ...)');
                console.log(this.parametro19);
            }
            //20-Mantém o ambiente esportivo positivo em todas as circunstâncias
            else if (this.parametro20 == undefined || this.parametro20 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('20-Mantém o ambiente esportivo positivo em todas as circunstâncias');
                console.log(this.parametro20);
            }
            //21-AUTOCONFIANÇA - Valoriza seu trabalho como treinador/a e reconhece a importância do que faz
            else if (this.parametro21 == undefined || this.parametro21 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('21-AUTOCONFIANÇA - Valoriza seu trabalho como treinador/a e reconhece a importância do que faz');
                console.log(this.parametro21);
            }
            //22-EMPATIA - Importa-se com a vida das/os atletas dentro e fora da quadra e age intencionalmente para conhecer e compreender cada um/a deles/as
            else if (this.parametro22 == undefined || this.parametro22 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('22-EMPATIA - Importa-se com a vida das/os atletas dentro e fora da quadra e age intencionalmente para conhecer e compreender cada um/a deles/as');
                console.log(this.parametro22);
            }
            //23-HONESTIDADE - É justo/a e lidera pelo exemplo com condutas éticas dentro e fora de quadra
            else if (this.parametro23 == undefined || this.parametro23 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('23-HONESTIDADE - É justo/a e lidera pelo exemplo com condutas éticas dentro e fora de quadra');
                console.log(this.parametro23);
            }
            //24-RESPEITO - Valoriza igualmente todo/a e cada atleta, independente do nível de habilidade ou papel na equipe
            else if (this.parametro24 == undefined || this.parametro24 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('24-RESPEITO - Valoriza igualmente todo/a e cada atleta, independente do nível de habilidade ou papel na equipe');
                console.log(this.parametro24);
            }
            //25-AUTONOMIA - É autodisciplinado/a e age em busca do seu crescimento pessoal e profissional
            else if (this.parametro25 == undefined || this.parametro25 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('25-AUTONOMIA - É autodisciplinado/a e age em busca do seu crescimento pessoal e profissional');
                console.log(this.parametro25);
            }
            //26-RESPONSABILIDADE - É pontual e assíduo/a, cumprindo com todas as suas atribuições como treinador(a) do Superação
            else if (this.parametro26 == undefined || this.parametro26 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('26-RESPONSABILIDADE - É pontual e assíduo/a, cumprindo com todas as suas atribuições como treinador(a) do Superação');
                console.log(this.parametro26);
            }
            //27-AUTOCONTROLE - Demonstra controle emocional mesmo sob pressão, preservando as relações cordiais com todos/as
            else if (this.parametro27 == undefined || this.parametro27 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('27-AUTOCONTROLE - Demonstra controle emocional mesmo sob pressão, preservando as relações cordiais com todos/as');
                console.log(this.parametro27);
            }
            //28-TOMADA DE DECISÃO - Toma decisões, mesmo sob pressão e stress, pautado/a pelo Valores da Mão
            else if (this.parametro28 == undefined || this.parametro28 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('28-TOMADA DE DECISÃO - Toma decisões, mesmo sob pressão e stress, pautado/a pelo Valores da Mão');
                console.log(this.parametro28);
            }
            //29-COOPERAÇÃO - Cria um ambiente esportivo positivo e divertido e garante espaços de escuta, diálogo e cooperação com os/as atletas
            else if (this.parametro29 == undefined || this.parametro29 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('29-COOPERAÇÃO - Cria um ambiente esportivo positivo e divertido e garante espaços de escuta, diálogo e cooperação com os/as atletas');
                console.log(this.parametro29);
            }
            //30-COMUNICAÇÃO - Comunica-se de maneira positiva, clara, eficaz e ética
            else if (this.parametro30 == undefined || this.parametro30 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('30-COMUNICAÇÃO - Comunica-se de maneira positiva, clara, eficaz e ética');
                console.log(this.parametro30);
            }
            //31-PERSISTÊNCIA - Demonstra empenho na busca por sua evolução pessoal como treinador/a do IS
            else if (this.parametro31 == undefined || this.parametro31 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('31-PERSISTÊNCIA - Demonstra empenho na busca por sua evolução pessoal como treinador/a do IS');
                console.log(this.parametro31);
            }
            //32-RESILIÊNCIA - Maneja seus próprios erros e derrotas de maneira positiva como etapa necessária para o aprendizado
            else if (this.parametro32 == undefined || this.parametro32 == '') {
                campoObrigatorio = 'Existem questões não respondidas! ';
                console.log('32-RESILIÊNCIA - Maneja seus próprios erros e derrotas de maneira positiva como etapa necessária para o aprendizado');
                console.log(this.parametro32);
            }

            return campoObrigatorio;
        }

        voltar(event){
            console.log('voltar()');
            this.pagina1 = true;
            this.pagina2 = false;
        }

        cancelar(event){
            console.log('cancelar()');
            this.closeQuickAction();
        }

        closeQuickAction() {
            console.log('closeQuickAction()');
            const closeQA = new CustomEvent('close');
            this.dispatchEvent(closeQA);
        }

        showToast(title, message, variant){
            console.log('showToast()');
            const event = new ShowToastEvent({
                title: title,
                message: message,
                variant: variant
            });

            this.dispatchEvent(event);
        }
    //#endregion
    

}
import { LightningElement, track, api, wire } from 'lwc';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import salvarPlano from '@salesforce/apex/PlanoTreinoController.salvarPlano';
import buscarPlano from '@salesforce/apex/PlanoTreinoController.buscarPlano';
import buscarClassificacao from '@salesforce/apex/PlanoTreinoController.buscarClassificacao';
import getUrlOrg from '@salesforce/apex/PlanoTreinoController.getUrlOrg';

import formFactorPropertyName from '@salesforce/client/formFactor';

import PLANOTREINO_OBJECT from '@salesforce/schema/PlanoTreino__c';
import TIPOTREINO_FIELD from '@salesforce/schema/PlanoTreino__c.TipoTreino__c';
import CONTEUDOAPLICADO_OBJECT from '@salesforce/schema/ConteudoAplicado__c';
import DIMENSAO_FIELD from '@salesforce/schema/ConteudoAplicado__c.Dimensao__c';
import ESTRUTURA_FIELD from '@salesforce/schema/ConteudoAplicado__c.Estrutura__c';
import TIPO_FIELD from '@salesforce/schema/ConteudoAplicado__c.Tipo__c';
import CONTEUDO_FIELD from '@salesforce/schema/ConteudoAplicado__c.Conteudo__c';
import COMPLEMENTOCONTEUDO_FIELD from '@salesforce/schema/ConteudoAplicado__c.ComplementoConteudo__c';

export default class PlanoTreino extends LightningElement {

    get isDesktop() {
        return formFactorPropertyName === 'Large';
    }

    get isPhone() {
        return formFactorPropertyName === 'Small';
    }

    @api recordId;
    
    //#region Variaveis
    pagina1 = false;
    pagina2 = false;
    pagina3 = false;
    btnVisualizar = true;
    showBtnSalvar = true;
    linha1 = true;
    linha2 = false;
    linha3 = false;
    linha4 = false;
    linha5 = false;
    linha6 = false;
    linha7 = false;
    linha8 = false;
    linha9 = false;
    linha10 = false;
    linha11 = false;
    linha12 = false;
    linha13 = false;
    linha14 = false;
    linha15 = false;
    linha16 = false;
    linha17 = false;
    linha18 = false;
    linha19 = false;
    linha20 = false;
    @track dimensaoOptions1;
    @track dimensaoOptions2;
    @track dimensaoOptions3;
    @track dimensaoOptions4;
    @track dimensaoOptions5;
    @track dimensaoOptions6;
    @track dimensaoOptions7;
    @track dimensaoOptions8;
    @track dimensaoOptions9;
    @track dimensaoOptions10;
    @track dimensaoOptions11;
    @track dimensaoOptions12;
    @track dimensaoOptions13;
    @track dimensaoOptions14;
    @track dimensaoOptions15;
    @track dimensaoOptions16;
    @track dimensaoOptions17;
    @track dimensaoOptions18;
    @track dimensaoOptions19;
    @track dimensaoOptions20;
    @track estruturaOptions1;
    @track estruturaOptions2;
    @track estruturaOptions3;
    @track estruturaOptions4;
    @track estruturaOptions5;
    @track estruturaOptions6;
    @track estruturaOptions7;
    @track estruturaOptions8;
    @track estruturaOptions9;
    @track estruturaOptions10;
    @track estruturaOptions11;
    @track estruturaOptions12;
    @track estruturaOptions13;
    @track estruturaOptions14;
    @track estruturaOptions15;
    @track estruturaOptions16;
    @track estruturaOptions17;
    @track estruturaOptions18;
    @track estruturaOptions19;
    @track estruturaOptions20;
    @track tipoOptions1;
    @track tipoOptions2;
    @track tipoOptions3;
    @track tipoOptions4;
    @track tipoOptions5;
    @track tipoOptions6;
    @track tipoOptions7;
    @track tipoOptions8;
    @track tipoOptions9;
    @track tipoOptions10;
    @track tipoOptions11;
    @track tipoOptions12;
    @track tipoOptions13;
    @track tipoOptions14;
    @track tipoOptions15;
    @track tipoOptions16;
    @track tipoOptions17;
    @track tipoOptions18;
    @track tipoOptions19;
    @track tipoOptions20;
    @track conteudoAplicadoOptions1;
    @track conteudoAplicadoOptions2;
    @track conteudoAplicadoOptions3;
    @track conteudoAplicadoOptions4;
    @track conteudoAplicadoOptions5;
    @track conteudoAplicadoOptions6;
    @track conteudoAplicadoOptions7;
    @track conteudoAplicadoOptions8;
    @track conteudoAplicadoOptions9;
    @track conteudoAplicadoOptions10;
    @track conteudoAplicadoOptions11;
    @track conteudoAplicadoOptions12;
    @track conteudoAplicadoOptions13;
    @track conteudoAplicadoOptions14;
    @track conteudoAplicadoOptions15;
    @track conteudoAplicadoOptions16;
    @track conteudoAplicadoOptions17;
    @track conteudoAplicadoOptions18;
    @track conteudoAplicadoOptions19;
    @track conteudoAplicadoOptions20;
    @track complementoConteudoOptions1;
    @track complementoConteudoOptions2;
    @track complementoConteudoOptions3;
    @track complementoConteudoOptions4;
    @track complementoConteudoOptions5;
    @track complementoConteudoOptions6;
    @track complementoConteudoOptions7;
    @track complementoConteudoOptions8;
    @track complementoConteudoOptions9;
    @track complementoConteudoOptions10;
    @track complementoConteudoOptions11;
    @track complementoConteudoOptions12;
    @track complementoConteudoOptions13;
    @track complementoConteudoOptions14;
    @track complementoConteudoOptions15;
    @track complementoConteudoOptions16;
    @track complementoConteudoOptions17;
    @track complementoConteudoOptions18;
    @track complementoConteudoOptions19;
    @track complementoConteudoOptions20;
    @track tipoTreinoOptions;
    idPlanoTreino;
    tipoTreinoSelecionado;
    dataPlanoSelecionado;
    objetivoTreino;
    nomePlano;
    qtdItens = 1;
    IdClassificacao1;
    IdClassificacao2;
    IdClassificacao3;
    IdClassificacao4;
    IdClassificacao5;
    IdClassificacao6;
    IdClassificacao7;
    IdClassificacao8;
    IdClassificacao9;
    IdClassificacao10;
    IdClassificacao11;
    IdClassificacao12;
    IdClassificacao13;
    IdClassificacao14;
    IdClassificacao15;
    IdClassificacao16;
    IdClassificacao17;
    IdClassificacao18;
    IdClassificacao19;
    IdClassificacao20;
    dimensao1;
    dimensao2;
    dimensao3;
    dimensao4;
    dimensao5;
    dimensao6;
    dimensao7;
    dimensao8;
    dimensao9;
    dimensao10;
    dimensao11;
    dimensao12;
    dimensao13;
    dimensao14;
    dimensao15;
    dimensao16;
    dimensao17;
    dimensao18;
    dimensao19;
    dimensao20;

    estrutura1;
    estrutura2;
    estrutura3;
    estrutura4;
    estrutura5;
    estrutura6;
    estrutura7;
    estrutura8;
    estrutura9;
    estrutura10;
    estrutura11;
    estrutura12;
    estrutura13;
    estrutura14;
    estrutura15;
    estrutura16;
    estrutura17;
    estrutura18;
    estrutura19;
    estrutura20;

    tipo1;
    tipo2;
    tipo3;
    tipo4;
    tipo5;
    tipo6;
    tipo7;
    tipo8;
    tipo9;
    tipo10;
    tipo11;
    tipo12;
    tipo13;
    tipo14;
    tipo15;
    tipo16;
    tipo17;
    tipo18;
    tipo19;
    tipo20;

    conteudo1;
    conteudo2;
    conteudo3;
    conteudo4;
    conteudo5;
    conteudo6;
    conteudo7;
    conteudo8;
    conteudo9;
    conteudo10;
    conteudo11;
    conteudo12;
    conteudo13;
    conteudo14;
    conteudo15;
    conteudo16;
    conteudo17;
    conteudo18;
    conteudo19;
    conteudo20;

    complemento1;
    complemento2;
    complemento3;
    complemento4;
    complemento5;
    complemento6;
    complemento7;
    complemento8;
    complemento9;
    complemento10;
    complemento11;
    complemento12;
    complemento13;
    complemento14;
    complemento15;
    complemento16;
    complemento17;
    complemento18;
    complemento19;
    complemento20;

    idPlanoAtividade1;
    idPlanoAtividade2;
    idPlanoAtividade3;
    idPlanoAtividade4;
    idPlanoAtividade5;
    idPlanoAtividade6;

    tempoAtividade1;
    tempoAtividade2;
    tempoAtividade3;
    tempoAtividade4;
    tempoAtividade5;
    tempoAtividade6;

    tempoRealizado1;
    tempoRealizado2;
    tempoRealizado3;
    tempoRealizado4;
    tempoRealizado5;
    tempoRealizado6;


    atividade1;
    atividade2;
    atividade3;
    atividade4;
    atividade5;
    atividade6;

    isLoaded;
    //#endregion

    //Carregamento de Data options
    @wire(getObjectInfo, {objectApiName: PLANOTREINO_OBJECT })
    planoTreinoInfo;

    @wire(getPicklistValues, {recordTypeId: '$planoTreinoInfo.data.defaultRecordTypeId', fieldApiName: TIPOTREINO_FIELD })
    setPicklistTipoTreinoOptions({error, data}) {
        if (data) {
            this.tipoTreinoOptions = data.values;
        } else if (error) {
            console.log(error);
        }
    }

    //Obtem informações do objeto
    @wire(getObjectInfo, {objectApiName: CONTEUDOAPLICADO_OBJECT })
    conteudoAplicadoInfo;

    //Define options de dimensão
    @wire(getPicklistValues, {recordTypeId: '$conteudoAplicadoInfo.data.defaultRecordTypeId', fieldApiName: DIMENSAO_FIELD })
    setPicklistDimensaoOptions({error, data}) {
        if (data) {
            this.dimensaoData = data;
            this.dimensaoOptions = data.values;
        } else if (error) {
            console.log(error);
        }
    }

    //Obtem data de definição de Estrutura
    @wire(getPicklistValues, {recordTypeId: '$conteudoAplicadoInfo.data.defaultRecordTypeId', fieldApiName: ESTRUTURA_FIELD })
    setPicklistEstruturaOptions({error, data}) {
        if (data) {
            this.estruturaData = data;
            this.estruturaOptions1 = data.values;
            this.estruturaOptions2 = data.values;
            this.estruturaOptions3 = data.values;
            this.estruturaOptions4 = data.values;
            this.estruturaOptions5 = data.values;
            this.estruturaOptions6 = data.values;
            this.estruturaOptions7 = data.values;
            this.estruturaOptions8 = data.values;
            this.estruturaOptions9 = data.values;
            this.estruturaOptions10 = data.values;
            this.estruturaOptions11 = data.values;
            this.estruturaOptions12 = data.values;
            this.estruturaOptions13 = data.values;
            this.estruturaOptions14 = data.values;
            this.estruturaOptions15 = data.values;
            this.estruturaOptions16 = data.values;
            this.estruturaOptions17 = data.values;
            this.estruturaOptions18 = data.values;
            this.estruturaOptions19 = data.values;
            this.estruturaOptions20 = data.values;
        } else if (error) {
            console.log(error);
        }
    }

    //Obtem data de tipo
    @wire(getPicklistValues, {recordTypeId: '$conteudoAplicadoInfo.data.defaultRecordTypeId', fieldApiName: TIPO_FIELD })
    setPicklistTipoOptions({error, data}) {
        if (data) {
            this.tipoData = data;
            this.tipoOptions1 = data.values;
            this.tipoOptions2 = data.values;
            this.tipoOptions3 = data.values;
            this.tipoOptions4 = data.values;
            this.tipoOptions5 = data.values;
            this.tipoOptions6 = data.values;
            this.tipoOptions7 = data.values;
            this.tipoOptions8 = data.values;
            this.tipoOptions9 = data.values;
            this.tipoOptions10 = data.values;
            this.tipoOptions11 = data.values;
            this.tipoOptions12 = data.values;
            this.tipoOptions13 = data.values;
            this.tipoOptions14 = data.values;
            this.tipoOptions15 = data.values;
            this.tipoOptions16 = data.values;
            this.tipoOptions17 = data.values;
            this.tipoOptions18 = data.values;
            this.tipoOptions19 = data.values;
            this.tipoOptions20 = data.values;
        } else if (error) {
            console.log(error);
        }
    }

    //Obtem data de Conteudo
    @wire(getPicklistValues, {recordTypeId: '$conteudoAplicadoInfo.data.defaultRecordTypeId', fieldApiName: CONTEUDO_FIELD })
    setPicklistConteudoOptions({error, data}) {
        if (data) {
            this.conteudoData = data;
            this.conteudoAplicadoOptions1 = data.values;
            this.conteudoAplicadoOptions2 = data.values;
            this.conteudoAplicadoOptions3 = data.values;
            this.conteudoAplicadoOptions4 = data.values;
            this.conteudoAplicadoOptions5 = data.values;
            this.conteudoAplicadoOptions6 = data.values;
            this.conteudoAplicadoOptions7 = data.values;
            this.conteudoAplicadoOptions8 = data.values;
            this.conteudoAplicadoOptions9 = data.values;
            this.conteudoAplicadoOptions10 = data.values;
            this.conteudoAplicadoOptions11 = data.values;
            this.conteudoAplicadoOptions12 = data.values;
            this.conteudoAplicadoOptions13 = data.values;
            this.conteudoAplicadoOptions14 = data.values;
            this.conteudoAplicadoOptions15 = data.values;
            this.conteudoAplicadoOptions16 = data.values;
            this.conteudoAplicadoOptions17 = data.values;
            this.conteudoAplicadoOptions18 = data.values;
            this.conteudoAplicadoOptions19 = data.values;
            this.conteudoAplicadoOptions20 = data.values;
        } else if (error) {
            console.log(error);
        }
    }

    //Obtem data de complemento
    @wire(getPicklistValues, {recordTypeId: '$conteudoAplicadoInfo.data.defaultRecordTypeId', fieldApiName: COMPLEMENTOCONTEUDO_FIELD })
    setPicklistComplementoOptions({error, data}) {
        if (data) {
            this.complementoConteudoData = data;
            this.complementoConteudoOptions1 = data.values;
            this.complementoConteudoOptions2 = data.values;
            this.complementoConteudoOptions3 = data.values;
            this.complementoConteudoOptions4 = data.values;
            this.complementoConteudoOptions5 = data.values;
            this.complementoConteudoOptions6 = data.values;
            this.complementoConteudoOptions7 = data.values;
            this.complementoConteudoOptions8 = data.values;
            this.complementoConteudoOptions9 = data.values;
            this.complementoConteudoOptions10 = data.values;
            this.complementoConteudoOptions11 = data.values;
            this.complementoConteudoOptions12 = data.values;
            this.complementoConteudoOptions13 = data.values;
            this.complementoConteudoOptions14 = data.values;
            this.complementoConteudoOptions15 = data.values;
            this.complementoConteudoOptions16 = data.values;
            this.complementoConteudoOptions17 = data.values;
            this.complementoConteudoOptions18 = data.values;
            this.complementoConteudoOptions19 = data.values;
            this.complementoConteudoOptions20 = data.values;
        } else if (error) {
            console.log(error);
        }
    }

    // initialize component
    connectedCallback() {
        this.pagina1 = true;
        this.isLoaded = true;
    }

    handleClickAddConteudo(event){
        if(this.linha19){
            this.linha20 = true;
        }else if(this.linha18){
            this.linha19 = true;
        }else if(this.linha17){
            this.linha18 = true;
        }else if(this.linha16){
            this.linha17 = true;
        }else if(this.linha15){
            this.linha16 = true;
        }else if(this.linha14){
            this.linha15 = true;
        }else if(this.linha13){
            this.linha14 = true;
        }else if(this.linha12){
            this.linha13 = true;
        }else if(this.linha11){
            this.linha12 = true;
        }else if(this.linha10){
            this.linha11= true;
        }else if(this.linha9){
            this.linha10 = true;
        }else if(this.linha8){
            this.linha9 = true;
        }else if(this.linha7){
            this.linha8 = true;
        }else if(this.linha6){
            this.linha7 = true;
        }else if(this.linha5){
            this.linha6 = true;
        }else if(this.linha4){
            this.linha5 = true;
        }else if(this.linha3){
            this.linha4 = true;
        }else if(this.linha2){
            this.linha3 = true;
        }else if(this.linha1){
            this.linha2 = true;
        }
    }
    
    avancarPagina(event){
        if(this.pagina1 == true){
            if(this.dataPlanoSelecionado != null){
                this.pagina1 = false;
                this.pagina2 = true;
                this.showBtnSalvar = true;
            }else{
                this.showToast('Campo obrigatório não preenchido', 'Data do plano é obrigatório', 'error');
            }
            
        }else if(this.pagina2 == true){
            this.pagina2 = false;
            this.pagina3 = true;
            this.showBtnSalvar = false;
        }
    }

    voltarPagina(event){
        if(this.pagina3 == true){
            this.pagina3 = false;
            this.pagina2 = true;
            this.showBtnSalvar = true;
        }else if(this.pagina2 == true){
            this.pagina2 = false;
            this.pagina1 = true;
            this.showBtnSalvar = true;
        }
    }

    //Selecionar dimensão
    handleDimensaoChange(event) {
        let key = this.estruturaData.controllerValues[event.target.value];
        let valor = event.target.value;

        if(event.target.name == 'dimensao1'){
            this.dimensao1 = valor;
            this.estrutura1 = null;
            this.tipo1 = null;
            this.conteudo1 = null;
            this.complemento1 = null;
            this.estruturaOptions1 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao2'){
            this.dimensao2 = valor;
            this.estrutura2 = null;
            this.tipo2 = null;
            this.conteudo2 = null;
            this.complemento2 = null;
            this.estruturaOptions2 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao3'){
            this.dimensao3 = valor;
            this.estrutura3 = null;
            this.tipo3 = null;
            this.conteudo3 = null;
            this.complemento3 = null;
            this.estruturaOptions3 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao4'){
            this.dimensao4 = valor;
            this.estrutura4 = null;
            this.tipo4 = null;
            this.conteudo4 = null;
            this.complemento4 = null;
            this.estruturaOptions4 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao5'){
            this.dimensao5 = valor;
            this.estrutura5 = null;
            this.tipo5 = null;
            this.conteudo5 = null;
            this.complemento5 = null;
            this.estruturaOptions5 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao6'){
            this.dimensao6 = valor;
            this.estrutura6 = null;
            this.tipo6 = null;
            this.conteudo6 = null;
            this.complemento6 = null;
            this.estruturaOptions6 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao7'){
            this.dimensao7 = valor;
            this.estrutura7 = null;
            this.tipo7 = null;
            this.conteudo7 = null;
            this.complemento7 = null;
            this.estruturaOptions7 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao8'){
            this.dimensao8 = valor;
            this.estrutura8 = null;
            this.tipo8 = null;
            this.conteudo8 = null;
            this.complemento8 = null;
            this.estruturaOptions8 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao9'){
            this.dimensao9 = valor;
            this.estrutura9 = null;
            this.tipo9 = null;
            this.conteudo9 = null;
            this.complemento9 = null;
            this.estruturaOptions9 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao10'){
            this.dimensao10 = valor;
            this.estrutura10 = null;
            this.tipo10 = null;
            this.conteudo10 = null;
            this.complemento10 = null;
            this.estruturaOptions10 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao11'){
            this.dimensao11 = valor;
            this.estrutura11 = null;
            this.tipo11 = null;
            this.conteudo11 = null;
            this.complemento11 = null;
            this.estruturaOptions11 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao12'){
            this.dimensao12 = valor;
            this.estrutura12 = null;
            this.tipo12 = null;
            this.conteudo12 = null;
            this.complemento12 = null;
            this.estruturaOptions12 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao13'){
            this.dimensao13 = valor;
            this.estrutura13 = null;
            this.tipo13 = null;
            this.conteudo13 = null;
            this.complemento13 = null;
            this.estruturaOptions13 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao14'){
            this.dimensao14 = valor;
            this.estrutura14 = null;
            this.tipo14 = null;
            this.conteudo14 = null;
            this.complemento14 = null;
            this.estruturaOptions14 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao15'){
            this.dimensao15 = valor;
            this.estrutura15 = null;
            this.tipo15 = null;
            this.conteudo15 = null;
            this.complemento15 = null;
            this.estruturaOptions15 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao16'){
            this.dimensao16 = valor;
            this.estrutura16 = null;
            this.tipo16 = null;
            this.conteudo16 = null;
            this.complemento16 = null;
            this.estruturaOptions16 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao17'){
            this.dimensao17 = valor;
            this.estrutura17 = null;
            this.tipo17 = null;
            this.conteudo17 = null;
            this.complemento17 = null;
            this.estruturaOptions17 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao18'){
            this.dimensao18 = valor;
            this.estrutura18 = null;
            this.tipo18 = null;
            this.conteudo18 = null;
            this.complemento18 = null;
            this.estruturaOptions18 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao19'){
            this.dimensao19 = valor;
            this.estrutura19 = null;
            this.tipo19 = null;
            this.conteudo19 = null;
            this.complemento19 = null;
            this.estruturaOptions19 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao20'){
            this.dimensao20 = valor;
            this.estrutura20 = null;
            this.tipo20 = null;
            this.conteudo20 = null;
            this.complemento20 = null;
            this.estruturaOptions20 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }
    }

    //Alteracao de estrutura
    handleEstruturaChange(event) {
        let key = this.tipoData.controllerValues[event.target.value];
        let valor = event.target.value;
        
        if(event.target.name == 'estrutura1'){
            this.tipo1 = null;
            this.conteudo1 = null;
            this.complemento1 = null;
            this.estrutura1 = valor;
            this.tipoOptions1 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'estrutura2'){
            this.tipo2 = null;
            this.conteudo2 = null;
            this.complemento2 = null;
            this.estrutura2 = valor;
            this.tipoOptions2 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'estrutura3'){
            this.tipo3 = null;
            this.conteudo3 = null;
            this.complemento3 = null;
            this.estrutura3 = valor;
            this.tipoOptions3 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'estrutura4'){
            this.tipo4 = null;
            this.conteudo4 = null;
            this.complemento4 = null;
            this.estrutura4 = valor;
            this.tipoOptions4 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'estrutura5'){
            this.tipo5 = null;
            this.conteudo5 = null;
            this.complemento5 = null;
            this.estrutura5 = valor;
            this.tipoOptions5 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'estrutura6'){
            this.tipo6 = null;
            this.conteudo6 = null;
            this.complemento6 = null;
            this.estrutura6 = valor;
            this.tipoOptions6 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'estrutura7'){
            this.tipo7 = null;
            this.conteudo7 = null;
            this.complemento7 = null;
            this.estrutura7 = valor;
            this.tipoOptions7 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'estrutura8'){
            this.tipo8 = null;
            this.conteudo8 = null;
            this.complemento8 = null;
            this.estrutura8 = valor;
            this.tipoOptions8 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'estrutura9'){
            this.tipo9 = null;
            this.conteudo9 = null;
            this.complemento9 = null;
            this.estrutura9 = valor;
            this.tipoOptions9 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'estrutura10'){
            this.tipo10 = null;
            this.conteudo10 = null;
            this.complemento10 = null;
            this.estrutura10 = valor;
            this.tipoOptions10 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'estrutura11'){
            this.tipo11 = null;
            this.conteudo11 = null;
            this.complemento11 = null;
            this.estrutura11 = valor;
            this.tipoOptions11 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'estrutura12'){
            this.tipo12 = null;
            this.conteudo12 = null;
            this.complemento12 = null;
            this.estrutura12 = valor;
            this.tipoOptions12 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'estrutura13'){
            this.tipo13 = null;
            this.conteudo13 = null;
            this.complemento13 = null;
            this.estrutura13 = valor;
            this.tipoOptions13 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'estrutura14'){
            this.tipo14 = null;
            this.conteudo14 = null;
            this.complemento14 = null;
            this.estrutura14 = valor;
            this.tipoOptions14 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'estrutura15'){
            this.tipo15 = null;
            this.conteudo15 = null;
            this.complemento15 = null;
            this.estrutura15 = valor;
            this.tipoOptions15 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'estrutura16'){
            this.tipo16 = null;
            this.conteudo16 = null;
            this.complemento16 = null;
            this.estrutura16 = valor;
            this.tipoOptions16 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'estrutura17'){
            this.tipo17 = null;
            this.conteudo17 = null;
            this.complemento17 = null;
            this.estrutura17 = valor;
            this.tipoOptions17 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'estrutura18'){
            this.tipo18 = null;
            this.conteudo18 = null;
            this.complemento18 = null;
            this.estrutura18 = valor;
            this.tipoOptions18 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'estrutura19'){
            this.tipo19 = null;
            this.conteudo19 = null;
            this.complemento19 = null;
            this.estrutura19 = valor;
            this.tipoOptions19 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'estrutura20'){
            this.tipo20 = null;
            this.conteudo20 = null;
            this.complemento20 = null;
            this.estrutura20 = valor;
            this.tipoOptions20 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }
    }

    //Selecionar tipo
    handleTipoChange(event) {
        let valor = event.target.value;
        let valores = [];
        let targetName = event.target.name;
        
        if(targetName == 'tipo1'){
            this.conteudo1 = null;
            this.complemento1 = null;
            this.tipo1 = valor;
            this.conteudoAplicadoOptions1 = null;
            buscarClassificacao({dimensao : this.dimensao1, estrutura : this.estrutura1, tipo : valor})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions1 = valores;
            })
        }else if(targetName == 'tipo2'){
            this.conteudo2 = null;
            this.complemento2 = null;
            this.tipo2 = valor;
            buscarClassificacao({dimensao : this.dimensao2, estrutura : this.estrutura2, tipo : valor})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions2 = valores;
            })
        }else if(targetName == 'tipo3'){
            this.conteudo3 = null;
            this.complemento3 = null;
            this.tipo3 = valor;
            buscarClassificacao({dimensao : this.dimensao3, estrutura : this.estrutura3, tipo : valor})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions3 = valores;
            })
        }else if(targetName == 'tipo4'){
            this.conteudo4 = null;
            this.complemento4 = null;
            this.tipo4 = valor;
            buscarClassificacao({dimensao : this.dimensao4, estrutura : this.estrutura4, tipo : valor})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions4 = valores;
            })
        }else if(targetName == 'tipo5'){
            this.conteudo5 = null;
            this.complemento5 = null;
            this.tipo5 = valor;
            buscarClassificacao({dimensao : this.dimensao5, estrutura : this.estrutura5, tipo : valor})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions5 = valores;
            })
        }else if(targetName == 'tipo6'){
            this.conteudo6 = null;
            this.complemento6 = null;
            this.tipo6 = valor;
            buscarClassificacao({dimensao : this.dimensao6, estrutura : this.estrutura6, tipo : valor})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions6 = valores;
            })
        }else if(targetName == 'tipo7'){
            this.conteudo7 = null;
            this.complemento7 = null;
            this.tipo7 = valor;
            buscarClassificacao({dimensao : this.dimensao7, estrutura : this.estrutura7, tipo : valor})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions7 = valores;
            })
        }else if(targetName == 'tipo8'){
            this.conteudo8 = null;
            this.complemento8 = null;
            this.tipo8 = valor;
            buscarClassificacao({dimensao : this.dimensao8, estrutura : this.estrutura8, tipo : valor})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions8 = valores;
            })
        }else if(targetName == 'tipo9'){
            this.conteudo9 = null;
            this.complemento9 = null;
            this.tipo9 = valor;
            buscarClassificacao({dimensao : this.dimensao9, estrutura : this.estrutura9, tipo : valor})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions9 = valores;
            })
        }else if(targetName == 'tipo10'){
            this.conteudo10 = null;
            this.complemento10 = null;
            this.tipo10 = valor;
            buscarClassificacao({dimensao : this.dimensao10, estrutura : this.estrutura10, tipo : valor})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions10 = valores;
            })
        }else if(targetName == 'tipo11'){
            this.conteudo11 = null;
            this.complemento11 = null;
            this.tipo11 = valor;
            buscarClassificacao({dimensao : this.dimensao11, estrutura : this.estrutura11, tipo : valor})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions11 = valores;
            })
        }else if(targetName == 'tipo12'){
            this.conteudo12 = null;
            this.complemento12 = null;
            this.tipo12 = valor;
            buscarClassificacao({dimensao : this.dimensao12, estrutura : this.estrutura12, tipo : valor})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions12 = valores;
            })
        }else if(targetName == 'tipo13'){
            this.conteudo13 = null;
            this.complemento13 = null;
            this.tipo13 = valor;
                        buscarClassificacao({dimensao : this.dimensao13, estrutura : this.estrutura13, tipo : valor})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions13 = valores;
            })
        }else if(targetName == 'tipo14'){
            this.conteudo14 = null;
            this.complemento14 = null;
            this.tipo14 = valor;
                        buscarClassificacao({dimensao : this.dimensao14, estrutura : this.estrutura14, tipo : valor})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions14 = valores;
            })
        }else if(targetName == 'tipo15'){
            this.conteudo15 = null;
            this.complemento15 = null;
            this.tipo15 = valor;
                        buscarClassificacao({dimensao : this.dimensao15, estrutura : this.estrutura15, tipo : valor})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions15 = valores;
            })
        }else if(targetName == 'tipo16'){
            this.conteudo16 = null;
            this.complemento16 = null;
            this.tipo16 = valor;
                        buscarClassificacao({dimensao : this.dimensao16, estrutura : this.estrutura16, tipo : valor})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions16 = valores;
            })
        }else if(targetName == 'tipo17'){
            this.conteudo17 = null;
            this.complemento17 = null;
            this.tipo17 = valor;
                        buscarClassificacao({dimensao : this.dimensao17, estrutura : this.estrutura17, tipo : valor})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions17 = valores;
            })
        }else if(targetName == 'tipo18'){
            this.conteudo18 = null;
            this.complemento18 = null;
            this.tipo18 = valor;
                        buscarClassificacao({dimensao : this.dimensao18, estrutura : this.estrutura18, tipo : valor})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions18 = valores;
            })
        }else if(targetName == 'tipo19'){
            this.conteudo19 = null;
            this.complemento19 = null;
            this.tipo19 = valor;
                        buscarClassificacao({dimensao : this.dimensao19, estrutura : this.estrutura19, tipo : valor})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions19 = valores;
            })
        }else if(targetName == 'tipo20'){
            this.conteudo20 = null;
            this.complemento20 = null;
            this.tipo20 = valor;
            buscarClassificacao({dimensao : this.dimensao20, estrutura : this.estrutura20, tipo : valor})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions20 = valores;
            })
        }
    }

    //Selecionar conteudo
    handleConteudoChange(event) {
        let key = this.complementoConteudoData.controllerValues[event.target.value];
        let valor = event.target.value;
        
        if(event.target.name == 'conteudo1'){
            this.complemento1 = null;
            this.conteudo1 = valor;
            this.complementoConteudoOptions1 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'conteudo2'){
            this.complemento2 = null;
            this.conteudo2 = valor;
            this.complementoConteudoOptions2 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'conteudo3'){
            this.complemento3 = null;
            this.conteudo3 = valor;
            this.complementoConteudoOptions3 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'conteudo4'){
            this.complemento4 = null;
            this.conteudo4 = valor;
            this.complementoConteudoOptions4 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'conteudo5'){
            this.complemento5 = null;
            this.conteudo5 = valor;
            this.complementoConteudoOptions5 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'conteudo6'){
            this.complemento6 = null;
            this.conteudo6 = valor;
            this.complementoConteudoOptions6 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'conteudo7'){
            this.complemento7 = null;
            this.conteudo7 = valor;
            this.complementoConteudoOptions7 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'conteudo8'){
            this.complemento8 = null;
            this.conteudo8 = valor;
            this.complementoConteudoOptions8 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'conteudo9'){
            this.complemento9 = null;
            this.conteudo9 = valor;
            this.complementoConteudoOptions9 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'conteudo10'){
            this.complemento10 = null;
            this.conteudo10 = valor;
            this.complementoConteudoOptions10 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'conteudo11'){
            this.complemento11 = null;
            this.conteudo11 = valor;
            this.complementoConteudoOptions11 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'conteudo12'){
            this.complemento12 = null;
            this.conteudo12 = valor;
            this.complementoConteudoOptions12 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'conteudo13'){
            this.complemento13 = null;
            this.conteudo13 = valor;
            this.complementoConteudoOptions13 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'conteudo14'){
            this.complemento14 = null;
            this.conteudo14 = valor;
            this.complementoConteudoOptions14 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'conteudo15'){
            this.complemento15 = null;
            this.conteudo15 = valor;
            this.complementoConteudoOptions15 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'conteudo16'){
            this.complemento16 = null;
            this.conteudo16 = valor;
            this.complementoConteudoOptions16 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'conteudo17'){
            this.complemento17 = null;
            this.conteudo17 = valor;
            this.complementoConteudoOptions17 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'conteudo18'){
            this.complemento18 = null;
            this.conteudo18 = valor;
            this.complementoConteudoOptions18 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'conteudo19'){
            this.complemento19 = null;
            this.conteudo19 = valor;
            this.complementoConteudoOptions19 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'conteudo20'){
            this.complemento20 = null;
            this.conteudo20 = valor;
            this.complementoConteudoOptions20 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }
    }

    //Selecionar conteudo
    handleComplementoConteudoChange(event) {
        let valor = event.target.value;

        if(event.target.name == 'complemento1'){
            this.complemento1 = valor;
        }else if(event.target.name == 'complemento2'){
            this.complemento2 = valor;
        }else if(event.target.name == 'complemento3'){
            this.complemento3 = valor;
        }else if(event.target.name == 'complemento4'){
            this.complemento4 = valor;
        }else if(event.target.name == 'complemento5'){
            this.complemento5 = valor;
        }else if(event.target.name == 'complemento6'){
            this.complemento6 = valor;
        }else if(event.target.name == 'complemento7'){
            this.complemento7 = valor;
        }else if(event.target.name == 'complemento8'){
            this.complemento8 = valor;
        }else if(event.target.name == 'complemento9'){
            this.complemento9 = valor;
        }else if(event.target.name == 'complemento10'){
            this.complemento10 = valor;
        }else if(event.target.name == 'complemento11'){
            this.complemento11 = valor;
        }else if(event.target.name == 'complemento12'){
            this.complemento12 = valor;
        }else if(event.target.name == 'complemento13'){
            this.complemento13 = valor;
        }else if(event.target.name == 'complemento14'){
            this.complemento14 = valor;
        }else if(event.target.name == 'complemento15'){
            this.complemento15 = valor;
        }else if(event.target.name == 'complemento16'){
            this.complemento16 = valor;
        }else if(event.target.name == 'complemento17'){
            this.complemento17 = valor;
        }else if(event.target.name == 'complemento18'){
            this.complemento18 = valor;
        }else if(event.target.name == 'complemento19'){
            this.complemento19 = valor;
        }else if(event.target.name == 'complemento20'){
            this.complemento20 = valor;
        }
    }

    //Filstrar dimensão
    handleEstruturaClick(event) {
        if(event.target.name == 'dimensao1'){
            let key = this.estruturaData.controllerValues[this.dimensao1];
            this.estruturaOptions1 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao2'){
            let key = this.estruturaData.controllerValues[this.dimensao2];
            this.estruturaOptions2 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao3'){
            let key = this.estruturaData.controllerValues[this.dimensao3];
            this.estruturaOptions3 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao4'){
            let key = this.estruturaData.controllerValues[this.dimensao4];
            this.estruturaOptions4 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao5'){
            let key = this.estruturaData.controllerValues[this.dimensao5];
            this.estruturaOptions5 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao6'){
            let key = this.estruturaData.controllerValues[this.dimensao6];
            this.estruturaOptions6 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao7'){
            let key = this.estruturaData.controllerValues[this.dimensao7];
            this.estruturaOptions7 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao8'){
            let key = this.estruturaData.controllerValues[this.dimensao8];
            this.estruturaOptions8 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao9'){
            let key = this.estruturaData.controllerValues[this.dimensao9];
            this.estruturaOptions9 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao10'){
            let key = this.estruturaData.controllerValues[this.dimensao10];
            this.estruturaOptions10 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao11'){
            let key = this.estruturaData.controllerValues[this.dimensao11];
            this.estruturaOptions11 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao12'){
            let key = this.estruturaData.controllerValues[this.dimensao12];
            this.estruturaOptions12 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao13'){
            let key = this.estruturaData.controllerValues[this.dimensao13];
            this.estruturaOptions13 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao14'){
            let key = this.estruturaData.controllerValues[this.dimensao14];
            this.estruturaOptions14 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao15'){
            let key = this.estruturaData.controllerValues[this.dimensao15];
            this.estruturaOptions15 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao16'){
            let key = this.estruturaData.controllerValues[this.dimensao16];
            this.estruturaOptions16 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao17'){
            let key = this.estruturaData.controllerValues[this.dimensao17];
            this.estruturaOptions17 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao18'){
            let key = this.estruturaData.controllerValues[this.dimensao18];
            this.estruturaOptions18 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao19'){
            let key = this.estruturaData.controllerValues[this.dimensao19];
            this.estruturaOptions19 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'dimensao20'){
            let key = this.estruturaData.controllerValues[this.dimensao20];
            this.estruturaOptions20 = this.estruturaData.values.filter(opt => opt.validFor.includes(key));
        }
    }
    
    //Filtrar tipos
    handleTipoClick(event) {
        if(event.target.name == 'tipo1'){
            let key = this.tipoData.controllerValues[this.estrutura1];
            this.tipoOptions1 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'tipo2'){
            let key = this.tipoData.controllerValues[this.estrutura2];
            this.tipoOptions2 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'tipo3'){
            let key = this.tipoData.controllerValues[this.estrutura3];
            this.tipoOptions3 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'tipo4'){
            let key = this.tipoData.controllerValues[this.estrutura4];
            this.tipoOptions4 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'tipo5'){
            let key = this.tipoData.controllerValues[this.estrutura5];
            this.tipoOptions5 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'tipo6'){
            let key = this.tipoData.controllerValues[this.estrutura6];
            this.tipoOptions6 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'tipo7'){
            let key = this.tipoData.controllerValues[this.estrutura7];
            this.tipoOptions7 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'tipo8'){
            let key = this.tipoData.controllerValues[this.estrutura8];
            this.tipoOptions8 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'tipo9'){
            let key = this.tipoData.controllerValues[this.estrutura9];
            this.tipoOptions9 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'tipo10'){
            let key = this.tipoData.controllerValues[this.estrutura10];
            this.tipoOptions10 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'tipo11'){
            let key = this.tipoData.controllerValues[this.estrutura11];
            this.tipoOptions11 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'tipo12'){
            let key = this.tipoData.controllerValues[this.estrutura12];
            this.tipoOptions12 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'tipo13'){
            let key = this.tipoData.controllerValues[this.estrutura13];
            this.tipoOptions13 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'tipo14'){
            let key = this.tipoData.controllerValues[this.estrutura14];
            this.tipoOptions14 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'tipo15'){
            let key = this.tipoData.controllerValues[this.estrutura15];
            this.tipoOptions15 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'tipo16'){
            let key = this.tipoData.controllerValues[this.estrutura16];
            this.tipoOptions16 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'tipo17'){
            let key = this.tipoData.controllerValues[this.estrutura17];
            this.tipoOptions17 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'tipo18'){
            let key = this.tipoData.controllerValues[this.estrutura18];
            this.tipoOptions18 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'tipo19'){
            let key = this.tipoData.controllerValues[this.estrutura19];
            this.tipoOptions19 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'tipo20'){
            let key = this.tipoData.controllerValues[this.estrutura20];
            this.tipoOptions20 = this.tipoData.values.filter(opt => opt.validFor.includes(key));
        }
    }

    //Filtrar Conteúdo
    handleConteudoClick(event) {
        let valor = event.target.value;
        let valores = [];
        let targetname = event.target.name;
        
        if(targetname == 'conteudo1'){
            buscarClassificacao({dimensao : this.dimensao1, estrutura : this.estrutura1, tipo : this.tipo1})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions1 = valores;
            })
        }else if(targetname == 'conteudo2'){
            buscarClassificacao({dimensao : this.dimensao2, estrutura : this.estrutura2, tipo : this.tipo1})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions2 = valores;
            })
        }else if(targetname == 'conteudo3'){
            buscarClassificacao({dimensao : this.dimensao3, estrutura : this.estrutura3, tipo : this.tipo1})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions3 = valores;
            })
        }else if(targetname == 'conteudo4'){
            buscarClassificacao({dimensao : this.dimensao4, estrutura : this.estrutura4, tipo : this.tipo1})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions4 = valores;
            })
        }else if(targetname == 'conteudo5'){
            buscarClassificacao({dimensao : this.dimensao5, estrutura : this.estrutura5, tipo : this.tipo1})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions5 = valores;
            })
        }else if(targetname == 'conteudo6'){
            buscarClassificacao({dimensao : this.dimensao6, estrutura : this.estrutura6, tipo : this.tipo1})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions6 = valores;
            })
        }else if(targetname == 'conteudo7'){
            buscarClassificacao({dimensao : this.dimensao7, estrutura : this.estrutura7, tipo : this.tipo1})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions7 = valores;
            })
        }else if(targetname == 'conteudo8'){
            buscarClassificacao({dimensao : this.dimensao8, estrutura : this.estrutura8, tipo : this.tipo1})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions8 = valores;
            })
        }else if(targetname == 'conteudo9'){
            buscarClassificacao({dimensao : this.dimensao9, estrutura : this.estrutura9, tipo : this.tipo1})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions9 = valores;
            })
        }else if(targetname == 'conteudo10'){
            buscarClassificacao({dimensao : this.dimensao10, estrutura : this.estrutura10, tipo : this.tipo1})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions10 = valores;
            })
        }else if(targetname == 'conteudo11'){
            buscarClassificacao({dimensao : this.dimensao11, estrutura : this.estrutura11, tipo : this.tipo1})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions11 = valores;
            })
        }else if(targetname == 'conteudo12'){
            buscarClassificacao({dimensao : this.dimensao12, estrutura : this.estrutura12, tipo : this.tipo1})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions12 = valores;
            })
        }else if(targetname == 'conteudo13'){
            buscarClassificacao({dimensao : this.dimensao13, estrutura : this.estrutura13, tipo : this.tipo1})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions13 = valores;
            })
        }else if(targetname == 'conteudo14'){
            buscarClassificacao({dimensao : this.dimensao14, estrutura : this.estrutura14, tipo : this.tipo1})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions14 = valores;
            })
        }else if(targetname == 'conteudo15'){
            buscarClassificacao({dimensao : this.dimensao15, estrutura : this.estrutura15, tipo : this.tipo1})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions15 = valores;
            })
        }else if(targetname == 'conteudo16'){
            buscarClassificacao({dimensao : this.dimensao16, estrutura : this.estrutura16, tipo : this.tipo1})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions16 = valores;
            })
        }else if(targetname == 'conteudo17'){
            buscarClassificacao({dimensao : this.dimensao17, estrutura : this.estrutura17, tipo : this.tipo1})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions17 = valores;
            })
        }else if(targetname == 'conteudo18'){
            buscarClassificacao({dimensao : this.dimensao18, estrutura : this.estrutura18, tipo : this.tipo1})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions18 = valores;
            })
        }else if(targetname == 'conteudo19'){
            buscarClassificacao({dimensao : this.dimensao19, estrutura : this.estrutura19, tipo : this.tipo1})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions19 = valores;
            })
        }else if(targetname == 'conteudo20'){
            buscarClassificacao({dimensao : this.dimensao20, estrutura : this.estrutura20, tipo : this.tipo1})
            .then(result => {
                if(result.length > 0){
                    for (let index = 0; index < result.length; index++) {
                        valores.push({ label: result[index], value: result[index]});
                    }
                }
                this.conteudoAplicadoOptions20 = valores;
            })
        }
    }

    
    //Filtrar complemento
    handleComplementoClick(event) {
        if(event.target.name == 'complemento1'){
            let key = this.complementoConteudoData.controllerValues[this.conteudo1];
            this.complementoConteudoOptions1 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'complemento2'){
            let key = this.complementoConteudoData.controllerValues[this.conteudo2];
            this.complementoConteudoOptions2 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'complemento3'){
            let key = this.complementoConteudoData.controllerValues[this.conteudo3];
            this.complementoConteudoOptions3 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'complemento4'){
            let key = this.complementoConteudoData.controllerValues[this.conteudo4];
            this.complementoConteudoOptions4 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'complemento5'){
            let key = this.complementoConteudoData.controllerValues[this.conteudo5];
            this.complementoConteudoOptions5 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'complemento6'){
            let key = this.complementoConteudoData.controllerValues[this.conteudo6];
            this.complementoConteudoOptions6 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'complemento7'){
            let key = this.complementoConteudoData.controllerValues[this.conteudo7];
            this.complementoConteudoOptions7 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'complemento8'){
            let key = this.complementoConteudoData.controllerValues[this.conteudo8];
            this.complementoConteudoOptions8 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'complemento9'){
            let key = this.complementoConteudoData.controllerValues[this.conteudo9];
            this.complementoConteudoOptions9 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'complemento10'){
            let key = this.complementoConteudoData.controllerValues[this.conteudo10];
            this.complementoConteudoOptions10 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'complemento11'){
            let key = this.complementoConteudoData.controllerValues[this.conteudo11];
            this.complementoConteudoOptions11 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'complemento12'){
            let key = this.complementoConteudoData.controllerValues[this.conteudo12];
            this.complementoConteudoOptions12 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'complemento13'){
            let key = this.complementoConteudoData.controllerValues[this.conteudo13];
            this.complementoConteudoOptions13 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'complemento14'){
            let key = this.complementoConteudoData.controllerValues[this.conteudo14];
            this.complementoConteudoOptions14 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'complemento15'){
            let key = this.complementoConteudoData.controllerValues[this.conteudo15];
            this.complementoConteudoOptions15 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'complemento16'){
            let key = this.complementoConteudoData.controllerValues[this.conteudo16];
            this.complementoConteudoOptions16 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'complemento17'){
            let key = this.complementoConteudoData.controllerValues[this.conteudo17];
            this.complementoConteudoOptions17 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'complemento18'){
            let key = this.complementoConteudoData.controllerValues[this.conteudo18];
            this.complementoConteudoOptions18 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'complemento19'){
            let key = this.complementoConteudoData.controllerValues[this.conteudo19];
            this.complementoConteudoOptions19 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }else if(event.target.name == 'complemento20'){
            let key = this.complementoConteudoData.controllerValues[this.conteudo20];
            this.complementoConteudoOptions20 = this.complementoConteudoData.values.filter(opt => opt.validFor.includes(key));
        }
    }
    

    //Tipo de treino selecionado
    tipoTreinoChange(event){
        this.tipoTreinoSelecionado = event.target.value;
    }

    //Data do plano de treino selecionado
    dataPlanoChange(event){
        //Carrega dados da página quando já existir cadastro
        this.dataPlanoSelecionado = event.target.value;
        this.isLoaded = false;
        buscarPlano({
            dataPlano: this.dataPlanoSelecionado,
            idTurma: this.recordId
        })
        .then(result => {
            if(result.plano != null){
                this.idPlanoTreino = result.plano.Id;
                this.tipoTreinoSelecionado = result.plano.Tipo;
                this.objetivoTreino = result.plano.Objetivo;
                this.nomePlano = result.plano.Nome;
                this.btnVisualizar = false;

                for(let i=0; i<result.atividade.length; i++){
                    if(result.atividade[i].Tipo == 'Roda Inicial'){
                        this.idPlanoAtividade1 = result.atividade[i].Id;
                        this.atividade1 = result.atividade[i].Atividade;
                        this.tempoAtividade1 = result.atividade[i].TempoPlanejado;
                        this.tempoRealizado1 = result.atividade[i].TempoRealizado;
                    }
                    if(result.atividade[i].Tipo == 'Jogos de criatividade'){
                        this.idPlanoAtividade2 = result.atividade[i].Id;
                        this.atividade2 = result.atividade[i].Atividade;
                        this.tempoAtividade2 = result.atividade[i].TempoPlanejado;
                        this.tempoRealizado2 = result.atividade[i].TempoRealizado;
                    }
                    if(result.atividade[i].Tipo == 'Desafios coordenativos'){
                        this.idPlanoAtividade3 = result.atividade[i].Id;
                        this.atividade3 = result.atividade[i].Atividade;
                        this.tempoAtividade3 = result.atividade[i].TempoPlanejado;
                        this.tempoRealizado3 = result.atividade[i].TempoRealizado;
                    }
                    if(result.atividade[i].Tipo == 'Desafios técnico-táticos e socioemocionais'){
                        this.idPlanoAtividade4 = result.atividade[i].Id;
                        this.atividade4 = result.atividade[i].Atividade;
                        this.tempoAtividade4 = result.atividade[i].TempoPlanejado;
                        this.tempoRealizado4 = result.atividade[i].TempoRealizado;
                    }
                    if(result.atividade[i].Tipo == 'Jogos reduzidos e jogo formal'){
                        this.idPlanoAtividade5 = result.atividade[i].Id;
                        this.atividade5 = result.atividade[i].Atividade;
                        this.tempoAtividade5 = result.atividade[i].TempoPlanejado;
                        this.tempoRealizado5 = result.atividade[i].TempoRealizado;
                    }
                    if(result.atividade[i].Tipo == 'Roda final'){
                        this.idPlanoAtividade6 = result.atividade[i].Id;
                        this.atividade6 = result.atividade[i].Atividade;
                        this.tempoAtividade6 = result.atividade[i].TempoPlanejado;
                        this.tempoRealizado6 = result.atividade[i].TempoRealizado;
                    }
                }

                for(let i=0; i<result.classificacao.length; i++){
                    if(i == 0){
                        this.dimensao1 = result.classificacao[i].Dimensao;
                        this.estrutura1 = result.classificacao[i].Estrutura;
                        this.tipo1 = result.classificacao[i].Tipo;
                        this.conteudo1 = result.classificacao[i].Conteudo;
                        this.complemento1 = result.classificacao[i].Complemento;
                        this.IdClassificacao1 = result.classificacao[i].Id;
                        this.linha1 = true;
                    }else if(i == 1){
                        this.conteudo2 = result.classificacao[i].Conteudo;
                        this.dimensao2 = result.classificacao[i].Dimensao;
                        this.estrutura2 = result.classificacao[i].Estrutura;
                        this.tipo2 = result.classificacao[i].Tipo;
                        this.complemento2 = result.classificacao[i].Complemento;
                        this.IdClassificacao2 = result.classificacao[i].Id;
                        this.linha2 = true;
                    }else if(i == 2){
                        this.conteudo3 = result.classificacao[i].Conteudo;
                        this.dimensao3 = result.classificacao[i].Dimensao;
                        this.estrutura3 = result.classificacao[i].Estrutura;
                        this.tipo3 = result.classificacao[i].Tipo;
                        this.complemento3 = result.classificacao[i].Complemento;
                        this.IdClassificacao3 = result.classificacao[i].Id;
                        this.linha3 = true;
                    }else if(i == 3){
                        this.conteudo4 = result.classificacao[i].Conteudo;
                        this.dimensao4 = result.classificacao[i].Dimensao;
                        this.estrutura4 = result.classificacao[i].Estrutura;
                        this.tipo4 = result.classificacao[i].Tipo;
                        this.complemento4 = result.classificacao[i].Complemento;
                        this.IdClassificacao4 = result.classificacao[i].Id;
                        this.linha4 = true;
                    }else if(i == 4){
                        this.conteudo5 = result.classificacao[i].Conteudo;
                        this.dimensao5 = result.classificacao[i].Dimensao;
                        this.estrutura5 = result.classificacao[i].Estrutura;
                        this.tipo5 = result.classificacao[i].Tipo;
                        this.complemento5 = result.classificacao[i].Complemento;
                        this.IdClassificacao5 = result.classificacao[i].Id;
                        this.linha5 = true;
                    }else if(i == 5){
                        this.conteudo6 = result.classificacao[i].Conteudo;
                        this.dimensao6 = result.classificacao[i].Dimensao;
                        this.estrutura6 = result.classificacao[i].Estrutura;
                        this.tipo6 = result.classificacao[i].Tipo;
                        this.complemento6 = result.classificacao[i].Complemento;
                        this.IdClassificacao6 = result.classificacao[i].Id;
                        this.linha6 = true;
                    }else if(i == 6){
                        this.conteudo7 = result.classificacao[i].Conteudo;
                        this.dimensao7 = result.classificacao[i].Dimensao;
                        this.estrutura7 = result.classificacao[i].Estrutura;
                        this.tipo7 = result.classificacao[i].Tipo;
                        this.complemento7 = result.classificacao[i].Complemento;
                        this.IdClassificacao7 = result.classificacao[i].Id;
                        this.linha7 = true;
                    }else if(i == 7){
                        this.conteudo8 = result.classificacao[i].Conteudo;
                        this.dimensao8 = result.classificacao[i].Dimensao;
                        this.estrutura8 = result.classificacao[i].Estrutura;
                        this.tipo8 = result.classificacao[i].Tipo;
                        this.complemento8 = result.classificacao[i].Complemento;
                        this.IdClassificacao8 = result.classificacao[i].Id;
                        this.linha8 = true;
                    }else if(i == 8){
                        this.conteudo9 = result.classificacao[i].Conteudo;
                        this.dimensao9 = result.classificacao[i].Dimensao;
                        this.estrutura9 = result.classificacao[i].Estrutura;
                        this.tipo9 = result.classificacao[i].Tipo;
                        this.complemento9 = result.classificacao[i].Complemento;
                        this.IdClassificacao9 = result.classificacao[i].Id;
                        this.linha9 = true;
                    }else if(i == 9){
                        this.conteudo10 = result.classificacao[i].Conteudo;
                        this.dimensao10 = result.classificacao[i].Dimensao;
                        this.estrutura10 = result.classificacao[i].Estrutura;
                        this.tipo10 = result.classificacao[i].Tipo;
                        this.complemento10 = result.classificacao[i].Complemento;
                        this.IdClassificacao10 = result.classificacao[i].Id;
                        this.linha10 = true;
                    }else if(i == 10){
                        this.conteudo11 = result.classificacao[i].Conteudo;
                        this.dimensao11 = result.classificacao[i].Dimensao;
                        this.estrutura11 = result.classificacao[i].Estrutura;
                        this.tipo11 = result.classificacao[i].Tipo;
                        this.complemento11 = result.classificacao[i].Complemento;
                        this.IdClassificacao11 = result.classificacao[i].Id;
                        this.linha11 = true;
                    }else if(i == 11){
                        this.conteudo12 = result.classificacao[i].Conteudo;
                        this.dimensao12 = result.classificacao[i].Dimensao;
                        this.estrutura12 = result.classificacao[i].Estrutura;
                        this.tipo12 = result.classificacao[i].Tipo;
                        this.complemento12 = result.classificacao[i].Complemento;
                        this.IdClassificacao12 = result.classificacao[i].Id;
                        this.linha12 = true;
                    }else if(i == 12){
                        this.conteudo13 = result.classificacao[i].Conteudo;
                        this.dimensao13 = result.classificacao[i].Dimensao;
                        this.estrutura13 = result.classificacao[i].Estrutura;
                        this.tipo13 = result.classificacao[i].Tipo;
                        this.complemento13 = result.classificacao[i].Complemento;
                        this.IdClassificacao13 = result.classificacao[i].Id;
                        this.linha13 = true;
                    }else if(i == 13){
                        this.conteudo14 = result.classificacao[i].Conteudo;
                        this.dimensao14 = result.classificacao[i].Dimensao;
                        this.estrutura14 = result.classificacao[i].Estrutura;
                        this.tipo14 = result.classificacao[i].Tipo;
                        this.complemento14 = result.classificacao[i].Complemento;
                        this.IdClassificacao14 = result.classificacao[i].Id;
                        this.linha14 = true;
                    }else if(i == 14){
                        this.conteudo15 = result.classificacao[i].Conteudo;
                        this.dimensao15 = result.classificacao[i].Dimensao;
                        this.estrutura15 = result.classificacao[i].Estrutura;
                        this.tipo15 = result.classificacao[i].Tipo;
                        this.complemento15 = result.classificacao[i].Complemento;
                        this.IdClassificacao15 = result.classificacao[i].Id;
                        this.linha15 = true;
                    }else if(i == 15){
                        this.conteudo16 = result.classificacao[i].Conteudo;
                        this.dimensao16 = result.classificacao[i].Dimensao;
                        this.estrutura16 = result.classificacao[i].Estrutura;
                        this.tipo16 = result.classificacao[i].Tipo;
                        this.complemento16 = result.classificacao[i].Complemento;
                        this.IdClassificacao16 = result.classificacao[i].Id;
                        this.linha16 = true;
                    }else if(i == 16){
                        this.conteudo17 = result.classificacao[i].Conteudo;
                        this.dimensao17 = result.classificacao[i].Dimensao;
                        this.estrutura17 = result.classificacao[i].Estrutura;
                        this.tipo17 = result.classificacao[i].Tipo;
                        this.complemento17 = result.classificacao[i].Complemento;
                        this.IdClassificacao17 = result.classificacao[i].Id;
                        this.linha17 = true;
                    }else if(i == 17){
                        this.conteudo18 = result.classificacao[i].Conteudo;
                        this.dimensao18 = result.classificacao[i].Dimensao;
                        this.estrutura18 = result.classificacao[i].Estrutura;
                        this.tipo18 = result.classificacao[i].Tipo;
                        this.complemento18 = result.classificacao[i].Complemento;
                        this.IdClassificacao18 = result.classificacao[i].Id;
                        this.linha18 = true;
                    }else if(i == 18){
                        this.conteudo19 = result.classificacao[i].Conteudo;
                        this.dimensao19 = result.classificacao[i].Dimensao;
                        this.estrutura19 = result.classificacao[i].Estrutura;
                        this.tipo19 = result.classificacao[i].Tipo;
                        this.complemento19 = result.classificacao[i].Complemento;
                        this.IdClassificacao19 = result.classificacao[i].Id;
                        this.linha19 = true;
                    }else if(i == 19){
                        this.conteudo20 = result.classificacao[i].Conteudo;
                        this.dimensao20 = result.classificacao[i].Dimensao;
                        this.estrutura20 = result.classificacao[i].Estrutura;
                        this.tipo20 = result.classificacao[i].Tipo;
                        this.complemento20 = result.classificacao[i].Complemento;
                        this.IdClassificacao20 = result.classificacao[i].Id;
                        this.linha20 = true;
                    }
                }
            }else{
                this.btnVisualizar = true;
                this.idPlanoTreino = '';
                this.tipoTreinoSelecionado = '';
                this.objetivoTreino = '';
                this.conteudo1 = null;
                this.conteudo2 = null;
                this.conteudo3 = null;
                this.conteudo4 = null;
                this.conteudo5 = null;
                this.conteudo6 = null;
                this.conteudo7 = null;
                this.conteudo8 = null;
                this.conteudo9 = null;
                this.conteudo10 = null;
                this.conteudo11 = null;
                this.conteudo12 = null;
                this.conteudo13 = null;
                this.conteudo14 = null;
                this.conteudo15 = null;
                this.conteudo16 = null;
                this.conteudo17 = null;
                this.conteudo18 = null;
                this.conteudo19 = null;
                this.conteudo20 = null;
                this.dimensao1 = null;
                this.dimensao2 = null;
                this.dimensao3 = null;
                this.dimensao4 = null;
                this.dimensao5 = null;
                this.dimensao6 = null;
                this.dimensao7 = null;
                this.dimensao8 = null;
                this.dimensao9 = null;
                this.dimensao10 = null;
                this.dimensao11 = null;
                this.dimensao12 = null;
                this.dimensao13 = null;
                this.dimensao14 = null;
                this.dimensao15 = null;
                this.dimensao16 = null;
                this.dimensao17 = null;
                this.dimensao18 = null;
                this.dimensao19 = null;
                this.dimensao20 = null;
                this.estrutura1 = null;
                this.estrutura2 = null;
                this.estrutura3 = null;
                this.estrutura4 = null;
                this.estrutura5 = null;
                this.estrutura6 = null;
                this.estrutura7 = null;
                this.estrutura8 = null;
                this.estrutura9 = null;
                this.estrutura10 = null;
                this.estrutura11 = null;
                this.estrutura12 = null;
                this.estrutura13 = null;
                this.estrutura14 = null;
                this.estrutura15 = null;
                this.estrutura16 = null;
                this.estrutura17 = null;
                this.estrutura18 = null;
                this.estrutura19 = null;
                this.estrutura20 = null;
                this.tipo1 = null;
                this.tipo2 = null;
                this.tipo3 = null;
                this.tipo4 = null;
                this.tipo5 = null;
                this.tipo6 = null;
                this.tipo7 = null;
                this.tipo8 = null;
                this.tipo9 = null;
                this.tipo10 = null;
                this.tipo11 = null;
                this.tipo12 = null;
                this.tipo13 = null;
                this.tipo14 = null;
                this.tipo15 = null;
                this.tipo16 = null;
                this.tipo17 = null;
                this.tipo18 = null;
                this.tipo19 = null;
                this.tipo20 = null;
                this.complemento1 = null;
                this.complemento2 = null;
                this.complemento3 = null;
                this.complemento4 = null;
                this.complemento5 = null;
                this.complemento6 = null;
                this.complemento7 = null;
                this.complemento8 = null;
                this.complemento9 = null;
                this.complemento10 = null;
                this.complemento11 = null;
                this.complemento12 = null;
                this.complemento13 = null;
                this.complemento14 = null;
                this.complemento15 = null;
                this.complemento16 = null;
                this.complemento17 = null;
                this.complemento18 = null;
                this.complemento19 = null;
                this.complemento20 = null;
                this.IdClassificacao1 = null;
                this.IdClassificacao2 = null;
                this.IdClassificacao3 = null;
                this.IdClassificacao4 = null;
                this.IdClassificacao5 = null;
                this.IdClassificacao6 = null;
                this.IdClassificacao7 = null;
                this.IdClassificacao8 = null;
                this.IdClassificacao9 = null;
                this.IdClassificacao10 = null;
                this.IdClassificacao11 = null;
                this.IdClassificacao12 = null;
                this.IdClassificacao13 = null;
                this.IdClassificacao14 = null;
                this.IdClassificacao15 = null;
                this.IdClassificacao16 = null;
                this.IdClassificacao17 = null;
                this.IdClassificacao18 = null;
                this.IdClassificacao19 = null;
                this.IdClassificacao20 = null;
                this.linha1 = true;
                this.linha2 = false;
                this.linha3 = false;
                this.linha4 = false;
                this.linha5 = false;
                this.linha6 = false;
                this.linha7 = false;
                this.linha8 = false;
                this.linha9 = false;
                this.linha10 = false;
                this.linha11 = false;
                this.linha12 = false;
                this.linha13 = false;
                this.linha14 = false;
                this.linha15 = false;
                this.linha16 = false;
                this.linha17 = false;
                this.linha18 = false;
                this.linha19 = false;
                this.linha20 = false;

                this.idPlanoAtividade1 = null;
                this.idPlanoAtividade2 = null;
                this.idPlanoAtividade3 = null;
                this.idPlanoAtividade4 = null;
                this.idPlanoAtividade5 = null;
                this.idPlanoAtividade6 = null;
                this.atividade1 = null;
                this.atividade2 = null;
                this.atividade3 = null;
                this.atividade4 = null;
                this.atividade5 = null;
                this.atividade6 = null;
                this.tempoAtividade1 = null;
                this.tempoAtividade2 = null;
                this.tempoAtividade3 = null;
                this.tempoAtividade4 = null;
                this.tempoAtividade5 = null;
                this.tempoAtividade6 = null;
                this.tempoRealizado1 = null;
                this.tempoRealizado2 = null;
                this.tempoRealizado3 = null;
                this.tempoRealizado4 = null;
                this.tempoRealizado5 = null;
                this.tempoRealizado6 = null;
            }

            this.isLoaded = true;
        })
        .catch(error => {
            this.isLoaded = true;
        })
    }

    //Objetivo do treino
    objetivoChange(event){
        this.objetivoTreino = event.target.value;
    }

    changeTempoAtividade(event){
        let item = event.target.name;
        let value = event.target.value;

        if(item == 'tempoAtividade1'){
            this.tempoAtividade1 = value;
        }else if(item == 'tempoAtividade2'){
            this.tempoAtividade2 = value;
        }else if(item == 'tempoAtividade3'){
            this.tempoAtividade3 = value;
        }else if(item == 'tempoAtividade4'){
            this.tempoAtividade4 = value;
        }else if(item == 'tempoAtividade5'){
            this.tempoAtividade5 = value;
        }else if(item == 'tempoAtividade6'){
            this.tempoAtividade6 = value;
        }
    }

    changeTempoRealizado(event){
        let item = event.target.name;
        let value = event.target.value;

        if(item == 'tempoRealizado1'){
            this.tempoRealizado1 = value;
        }else if(item == 'tempoRealizado2'){
            this.tempoRealizado2 = value;
        }else if(item == 'tempoRealizado3'){
            this.tempoRealizado3 = value;
        }else if(item == 'tempoRealizado4'){
            this.tempoRealizado4 = value;
        }else if(item == 'tempoRealizado5'){
            this.tempoRealizado5 = value;
        }else if(item == 'tempoRealizado6'){
            this.tempoRealizado6 = value;
        }
    }

    changeAtividade(event){
        let item = event.target.name;
        let value = event.target.value;

        if(item == 'atividade1'){
            this.atividade1 = value;
        }else if(item == 'atividade2'){
            this.atividade2 = value;
        }else if(item == 'atividade3'){
            this.atividade3 = value;
        }else if(item == 'atividade4'){
            this.atividade4 = value;
        }else if(item == 'atividade5'){
            this.atividade5 = value;
        }else if(item == 'atividade6'){
            this.atividade6 = value;
        }
    }

    salvarDados(event){
        let dadosPlano = {
            'Id' : this.idPlanoTreino,
            'DataPlano' : this.dataPlanoSelecionado,
            'Tipo' : this.tipoTreinoSelecionado,
            'Objetivo' : this.objetivoTreino,
            'Turma' : this.recordId,
            'Nome' : this.nomePlano
        };

        let classificacao = [
            {'Id' : this.IdClassificacao1, 'Dimensao' : this.dimensao1, 'Estrutura' : this.estrutura1, 'Tipo' : this.tipo1, 'Conteudo' : this.conteudo1, 'Complemento' : this.complemento1},
            {'Id' : this.IdClassificacao2, 'Dimensao' : this.dimensao3, 'Estrutura' : this.estrutura3, 'Tipo' : this.tipo3, 'Conteudo' : this.conteudo3, 'Complemento' : this.complemento3},
            {'Id' : this.IdClassificacao3, 'Dimensao' : this.dimensao4, 'Estrutura' : this.estrutura4, 'Tipo' : this.tipo4, 'Conteudo' : this.conteudo4, 'Complemento' : this.complemento4},
            {'Id' : this.IdClassificacao4, 'Dimensao' : this.dimensao5, 'Estrutura' : this.estrutura5, 'Tipo' : this.tipo5, 'Conteudo' : this.conteudo5, 'Complemento' : this.complemento5},
            {'Id' : this.IdClassificacao5, 'Dimensao' : this.dimensao2, 'Estrutura' : this.estrutura2, 'Tipo' : this.tipo2, 'Conteudo' : this.conteudo2, 'Complemento' : this.complemento2},
            {'Id' : this.IdClassificacao6, 'Dimensao' : this.dimensao6, 'Estrutura' : this.estrutura6, 'Tipo' : this.tipo6, 'Conteudo' : this.conteudo6, 'Complemento' : this.complemento6},
            {'Id' : this.IdClassificacao7, 'Dimensao' : this.dimensao7, 'Estrutura' : this.estrutura7, 'Tipo' : this.tipo7, 'Conteudo' : this.conteudo7, 'Complemento' : this.complemento7},
            {'Id' : this.IdClassificacao8, 'Dimensao' : this.dimensao8, 'Estrutura' : this.estrutura8, 'Tipo' : this.tipo8, 'Conteudo' : this.conteudo8, 'Complemento' : this.complemento8},
            {'Id' : this.IdClassificacao9, 'Dimensao' : this.dimensao9, 'Estrutura' : this.estrutura9, 'Tipo' : this.tipo9, 'Conteudo' : this.conteudo9, 'Complemento' : this.complemento9},
            {'Id' : this.IdClassificacao10, 'Dimensao' : this.dimensao10, 'Estrutura' : this.estrutura10, 'Tipo' : this.tipo10, 'Conteudo' : this.conteudo10, 'Complemento' : this.complemento10},
            {'Id' : this.IdClassificacao11, 'Dimensao' : this.dimensao11, 'Estrutura' : this.estrutura11, 'Tipo' : this.tipo11, 'Conteudo' : this.conteudo11, 'Complemento' : this.complemento11},
            {'Id' : this.IdClassificacao12, 'Dimensao' : this.dimensao12, 'Estrutura' : this.estrutura12, 'Tipo' : this.tipo12, 'Conteudo' : this.conteudo12, 'Complemento' : this.complemento12},
            {'Id' : this.IdClassificacao13, 'Dimensao' : this.dimensao13, 'Estrutura' : this.estrutura13, 'Tipo' : this.tipo13, 'Conteudo' : this.conteudo13, 'Complemento' : this.complemento13},
            {'Id' : this.IdClassificacao14, 'Dimensao' : this.dimensao14, 'Estrutura' : this.estrutura14, 'Tipo' : this.tipo14, 'Conteudo' : this.conteudo14, 'Complemento' : this.complemento14},
            {'Id' : this.IdClassificacao15, 'Dimensao' : this.dimensao15, 'Estrutura' : this.estrutura15, 'Tipo' : this.tipo15, 'Conteudo' : this.conteudo15, 'Complemento' : this.complemento15},
            {'Id' : this.IdClassificacao16, 'Dimensao' : this.dimensao16, 'Estrutura' : this.estrutura16, 'Tipo' : this.tipo16, 'Conteudo' : this.conteudo16, 'Complemento' : this.complemento16},
            {'Id' : this.IdClassificacao17, 'Dimensao' : this.dimensao17, 'Estrutura' : this.estrutura17, 'Tipo' : this.tipo17, 'Conteudo' : this.conteudo17, 'Complemento' : this.complemento17},
            {'Id' : this.IdClassificacao18, 'Dimensao' : this.dimensao18, 'Estrutura' : this.estrutura18, 'Tipo' : this.tipo18, 'Conteudo' : this.conteudo18, 'Complemento' : this.complemento18},
            {'Id' : this.IdClassificacao19, 'Dimensao' : this.dimensao19, 'Estrutura' : this.estrutura19, 'Tipo' : this.tipo19, 'Conteudo' : this.conteudo19, 'Complemento' : this.complemento19},
            {'Id' : this.IdClassificacao20, 'Dimensao' : this.dimensao20, 'Estrutura' : this.estrutura20, 'Tipo' : this.tipo20, 'Conteudo' : this.conteudo20, 'Complemento' : this.complemento20}
        ];

        let planoAtividade = [
            {'Id' : this.idPlanoAtividade1, 'Tipo' : 'Roda inicial', 'TempoPlanejado' : this.tempoAtividade1, 'TempoRealizado' : this.tempoRealizado1, 'Atividade': this.atividade1 },
            {'Id' : this.idPlanoAtividade2, 'Tipo' : 'Jogos de criatividade', 'TempoPlanejado' : this.tempoAtividade2, 'TempoRealizado' : this.tempoRealizado2, 'Atividade': this.atividade2 },
            {'Id' : this.idPlanoAtividade3, 'Tipo' : 'Desafios coordenativos', 'TempoPlanejado' : this.tempoAtividade3, 'TempoRealizado' : this.tempoRealizado3, 'Atividade': this.atividade3 },
            {'Id' : this.idPlanoAtividade4, 'Tipo' : 'Desafios técnico-táticos e socioemocionais', 'TempoPlanejado' : this.tempoAtividade4, 'TempoRealizado' : this.tempoRealizado4, 'Atividade': this.atividade4 },
            {'Id' : this.idPlanoAtividade5, 'Tipo' : 'Jogos reduzidos e jogo formal', 'TempoPlanejado' : this.tempoAtividade5, 'TempoRealizado' : this.tempoRealizado5, 'Atividade': this.atividade5 },
            {'Id' : this.idPlanoAtividade6, 'Tipo' : 'Roda final', 'TempoPlanejado' : this.tempoAtividade6, 'TempoRealizado' : this.tempoRealizado6, 'Atividade': this.atividade6 }
        ];

        salvarPlano({
            plano: JSON.stringify(dadosPlano),
            classificacao: JSON.stringify(classificacao),
            planoAtividade: JSON.stringify(planoAtividade)

        })
        .then(result => {
            if(result){
                this.showToast('Sucesso', 'Plano de treino cadastrado com sucesso', 'success');

                this.closeQuickAction();
            }else{
                this.showToast('Erro', 'Falha ao salvar plano de treino', 'error');
            }
        })
        .catch(error => {
            this.showToast('Erro', 'Falha ao salvar plano de treino', 'error');
        })
    }


    handlePdfClick(event){
        let _url = '';
        getUrlOrg().then(sucess => {
            _url = sucess;
        })

        const urlWithParameters = _url + 
        '/apex/ImprimirPlanoTreino' +
        '?' + 
        'Id=' + this.idPlanoTreino + 
        '&Data=' + this.dataPlanoSelecionado.replaceAll('-', '').replaceAll('.', '');

        window.open(urlWithParameters);
    }

    nomePlanoChange(event){
        this.nomePlano = event.target.value;
    }

    showToast(title, message, variant){
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        });

        this.dispatchEvent(event);
    }

    closeQuickAction() {
        const closeQA = new CustomEvent('close');
        this.dispatchEvent(closeQA);
    }

    buscarClassificacaoItem(eDimensao, eEstrutura, eTipo){
        let valores = [];

        buscarClassificacao({
            dimensao : eDimensao,
            estrutura : eEstrutura,
            tipo : eTipo
        })
        .then(result => {
            if(result.length > 0){
                for (let index = 0; index < result.length; index++) {
                    valores.push({ label: result[index], value: result[index]});
                }
            }else{
                valores = null;
            }
        })

        return valores;
    }

}
import { LightningElement, track, api } from 'lwc';
import IMAGENS_NIVEIS from '@salesforce/resourceUrl/niveis';
import IMAGENS_MEDALHAS from '@salesforce/resourceUrl/niveisMedalha';
import avaliarAluno from '@salesforce/apex/AvaliacaoAlunoController.avaliarAluno';

var hoje = new Date();
var anoAtual = hoje.getFullYear().toString();
var anoPassado = (anoAtual - 1).toString();

export default class AvaliacaoAluno extends LightningElement {
    exibir = false;

    @api recordId;
    nivelEsportivo = '';
    nivelEmocional = '';
    nivelAluno = '';
    anoSelecionado;
    Mensagem = 'Selecione o ano para listar a avaliação do aluno.'; 
    @track nivelAluno;
    @track anos = [
        { label: anoAtual, value: '2022'},
        { label: anoPassado, value: '2021'}
    ];

    // resultadoFinal = IMAGENS_NIVEIS + '/verde.png';
    // resultadoEsportivo = IMAGENS_MEDALHAS + '/verde.png';
    // resultadoSocioemocional = IMAGENS_MEDALHAS + '/azul.png';

    connectedCallback(){
        this.exibir = false;
    }

    avaliar(){
        avaliarAluno({
            alunoId: this.recordId, 
            ano: this.anoSelecionado,
        })
        .then(result =>{
            if(result.ResultadoEsportiva != null){
                this.resultadoEsportivo = IMAGENS_MEDALHAS +'/'+ result.ResultadoEsportiva + '.png';
                this.resultadoSocioemocional = IMAGENS_MEDALHAS +'/'+ result.ResultadoSocioemocional + '.png';
                this.resultadoFinal = IMAGENS_NIVEIS + '/'+ result.ResultadoFinal + '.png';
                this.exibir = true;
            }else{
                this.Mensagem = 'Aluno sem avaliação no período.';
                this.exibir = false;
            }
        });
    }
    atualizarValoresAnos (event) {
        let value = event.target.value;
        this.anoSelecionado = value;
        this.avaliar();
    }
}
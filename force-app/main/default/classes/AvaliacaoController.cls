public without sharing class AvaliacaoController {
    @AuraEnabled
    public static Boolean salvarAvaliacao(
        String idAvaliacao,
        String mesReferencia,
        String anoReferencia,
        String codTreinador, 
        Date primeiraVisita,
        Date segundaVisita,
        String observacoes,
        String respostas){ 
        System.debug('respostas: '+respostas);
        
        //Salva transação e caso de erro ocorre rollback
        Savepoint objSavepoint = Database.setSavepoint();
        
        Date dataReferencia = Date.newInstance(Integer.valueOf(anoReferencia), Integer.valueOf(mesReferencia), 01);

        AvaliacaoTutor__c objAvaliacaoTutor = new AvaliacaoTutor__c(
            Id = String.isNotBlank(idAvaliacao) ? Id.valueOf(idAvaliacao) : null,
            MesReferencia__c = dataReferencia,
            CodigoTreinador__c = codTreinador,
            DataPrimeiraVisita__c = primeiraVisita,
            DataSegundaVisita__c = segundaVisita,
            Observacoes__c = observacoes
        );
        
        List<AvaliacaoTutorTO> lstRespostas = (List<AvaliacaoTutorTO>)JSON.deserialize(respostas, List<AvaliacaoTutorTO>.class);

        Boolean retorno = AvaliacaoTutorBO.getInstance().createAvaliacao(objAvaliacaoTutor, lstRespostas);

        if(!retorno){
            Database.rollback(objSavepoint);
        }
        
        return retorno;
    }

    @AuraEnabled
    public static AvaliacaoTO buscarAvaliacao(
        String codTreinador,
        String anoReferencia,
        String mesReferencia){ 
        
        Date dataReferencia = Date.newInstance(Integer.valueOf(anoReferencia), Integer.valueOf(mesReferencia), 01);

        AvaliacaoTO retorno = AvaliacaoTutorBO.getInstance().buscarAvaliacao(codTreinador, dataReferencia);
        return retorno;
    }

    @AuraEnabled
    public static List<Integer> contarAlunos(string codTreinador){
        List<Integer> retorno = AvaliacaoTutorBO.getInstance().contarAlunos(codTreinador);
        return retorno;
    }
    
    @AuraEnabled
    public static Decimal verificarCadastroCompleto(string codTreinador){
        Decimal retorno = AvaliacaoTutorBO.getInstance().verificarCadastroCompleto(codTreinador);
        return retorno;
    }

    @AuraEnabled
    public static Decimal contarAvaliacaoEsportiva(string codTreinador, String mesReferencia){
        Decimal retorno = AvaliacaoTutorBO.getInstance().contarAvaliacaoEsportiva(codTreinador, mesReferencia);
        return retorno;
    }

    @AuraEnabled
    public static Decimal contarAvaliacaoSocioemocional(string codTreinador, String mesReferencia){
        Decimal retorno = AvaliacaoTutorBO.getInstance().contarAvaliacaoSocioemocional(codTreinador, mesReferencia);
        return retorno;
    }
    
    @AuraEnabled
    public static Decimal percentControleFrequencia(string codTreinador, integer mesReferencia, integer anoReferencia){
        Decimal retorno = AvaliacaoTutorBO.getInstance().percentControleFrequencia(codTreinador, mesReferencia, anoReferencia);
        return retorno;
    }

    @AuraEnabled
    public static Decimal contarAlunosAprovados(string codTreinador){
        Decimal retorno = AvaliacaoTutorBO.getInstance().contarAlunosAprovados(codTreinador);
        return retorno;
    }
    @AuraEnabled
    public static Decimal contarAlunosComNota(string codTreinador, String mesReferencia){
        Decimal retorno = AvaliacaoTutorBO.getInstance().contarAlunosComNota(codTreinador, mesReferencia);
        return retorno;
    }


    public class AvaliacaoTO{
        @AuraEnabled
        public Id idAvaliacao {get; set;}
        @AuraEnabled
        public String mesReferencia {get; set;}
        @AuraEnabled
        public String anoReferencia {get; set;}
        @AuraEnabled
        public String codigoTreinador {get; set;}
        @AuraEnabled
        public String dataPrimeiraVisita {get; set;}
        @AuraEnabled
        public String dataSegundaVisita {get; set;}
        @AuraEnabled
        public String indiceAproveitamento {get; set;}
        @AuraEnabled
        public String observacoes {get; set;}
        @AuraEnabled
        public List<AvaliacaoTutorTO> avaliacaoTutorTO{get; set;}
        public AvaliacaoTO(){
            avaliacaoTutorTO = new List<AvaliacaoTutorTO>();
        }
    }

    public class AvaliacaoTutorTO{
        @AuraEnabled
        public Id Codigo {get; set;}
        @AuraEnabled
        public String Sequencia {get; set;}
        @AuraEnabled
        public String Resposta {get; set;}
        @AuraEnabled
        public String ValorResposta {get; set;}
        @AuraEnabled
        public String Indicador {get; set;}
    }
}
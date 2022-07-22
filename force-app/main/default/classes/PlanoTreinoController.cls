public class PlanoTreinoController {
    @AuraEnabled
    public static Boolean salvarPlano(String plano, String classificacao, String planoAtividade){
        PlanoTreinoTO objPlanoTreino = new PlanoTreinoTO();

        objPlanoTreino.plano = (PlanoTO)Json.deserialize(plano, PlanoTO.class);
        objPlanoTreino.classificacao = (List<ClassificacaoTO>)Json.deserialize(classificacao, List<ClassificacaoTO>.class);
        objPlanoTreino.atividade = (List<PlanoAtividadeTO>)Json.deserialize(planoAtividade, List<PlanoAtividadeTO>.class);

        return PlanoTreinoBO.getInstance().inserirPlanoTreino(objPlanoTreino);
    }

    @AuraEnabled
    public static PlanoTreinoController.PlanoTreinoTO buscarPlano(String dataPlano, String idTurma){
        return PlanoTreinoBO.getInstance().buscarPlanoTreino(dataPlano, idTurma);   
    }

    @AuraEnabled
    public static List<String> buscarClassificacao(String dimensao, String estrutura, String tipo){
        return PlanoTreinoBO.getInstance().buscarClassficicacao(dimensao, estrutura, tipo);
    }

    @AuraEnabled
    public static string getUrlOrg(){
        UrlOrg__c urlOrg = UrlOrg__c.getInstance('Url');
        return urlOrg.Url__c;
    }

    public class PlanoTreinoTO{
        @AuraEnabled
        public PlanoTO plano {get; set;}
        @AuraEnabled
        public List<ClassificacaoTO> classificacao {get; set;} 
        @AuraEnabled
        public List<PlanoAtividadeTO> atividade {get; set;} 

        public PlanoTreinoTO(){
            classificacao = new List<ClassificacaoTO>();
            atividade = new List<PlanoAtividadeTO>();
        }

    }

    public class PlanoTO{
        @AuraEnabled
        public string Id {get; set;}
        @AuraEnabled
        public string Nome {get; set;}
        @AuraEnabled
        public string DataPlano {get; set;}
        @AuraEnabled
        public string Tipo {get; set;}
        @AuraEnabled
        public string Objetivo {get; set;}
        @AuraEnabled
        public string Turma {get; set;}
    }
    
    public class ClassificacaoTO{
        @AuraEnabled
        public string Id {get; set;}
        @AuraEnabled
        public string Dimensao {get; set;}
        @AuraEnabled
        public string Estrutura {get; set;}
        @AuraEnabled
        public string Tipo {get; set;}
        @AuraEnabled
        public string Conteudo {get; set;}
        @AuraEnabled
        public string Complemento {get; set;}
    }
    
    public class PlanoAtividadeTO{
        @AuraEnabled
        public string Id {get; set;}
        @AuraEnabled
        public string Tipo {get; set;}
        @AuraEnabled
        public string TempoPlanejado {get; set;}
        @AuraEnabled
        public string TempoRealizado {get; set;}
        @AuraEnabled
        public string Atividade {get; set;}
    }   
}
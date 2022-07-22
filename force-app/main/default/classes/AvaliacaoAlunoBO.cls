public with sharing class AvaliacaoAlunoBO{
    public static AvaliacaoAlunoBO.AvaliacaoAnualTO avaliarAluno(String alunoId, String ano){
        AvaliacaoAlunoBO.AvaliacaoAnualTO retorno = new AvaliacaoAlunoBO.AvaliacaoAnualTO();

        List<AvaliacaoEsportivaSocioemocional__c> lstAvaliacoes = AvaliacaoEsportivaSocioemocionalDAO.getInstance().getByAluno(alunoId, ano);

        for (AvaliacaoEsportivaSocioemocional__c item : lstAvaliacoes) {
            if(Util.getRecordTypeId('AvaliacaoEsportivaSocioEmocional__c', 'Esportivo') == item.RecordTypeId){
                if(item.NivelEsportivoDoAluno__c.contains('green') || item.NivelEsportivoDoAluno__c.contains('Verde')){
                    retorno.ResultadoEsportiva = 'verde';
                }else if(item.NivelEsportivoDoAluno__c.contains('orange') || item.NivelEsportivoDoAluno__c.contains('Laranja')){
                    retorno.ResultadoEsportiva = 'laranja';
                }else if(item.NivelEsportivoDoAluno__c.contains('blue') || item.NivelEsportivoDoAluno__c.contains('Azul')){
                    retorno.ResultadoEsportiva = 'azul';
                }if(item.NivelEsportivoDoAluno__c.contains('yellow') || item.NivelEsportivoDoAluno__c.contains('Amarelo')){
                    retorno.ResultadoEsportiva = 'amarela';
                }        
            }else{
                if(Util.getRecordTypeId('AvaliacaoEsportivaSocioEmocional__c', 'Socioemocional') == item.RecordTypeId){
                    if(item.Nivel_Socioemocional__c.contains('green') || item.Nivel_Socioemocional__c.contains('Verde')){
                        retorno.ResultadoSocioemocional = 'verde';
                    }else if(item.Nivel_Socioemocional__c.contains('orange') || item.Nivel_Socioemocional__c.contains('Laranja')){
                        retorno.ResultadoSocioemocional = 'laranja';
                    }else if(item.Nivel_Socioemocional__c.contains('blue') || item.Nivel_Socioemocional__c.contains('Azul')){
                        retorno.ResultadoSocioemocional = 'azul';
                    }if(item.Nivel_Socioemocional__c.contains('yellow') || item.Nivel_Socioemocional__c.contains('Amarelo')){
                        retorno.ResultadoSocioemocional = 'amarela';
                    }     
                }
            }
        }

        return retorno;
    }

    public class AvaliacaoAnualTO{
        @AuraEnabled
        public String ResultadoEsportiva {get; set;}
        @AuraEnabled
        public String ResultadoSocioemocional {get; set;}
    }

}
public with sharing class AvaliacaoEsportivaSocioemocionalDAO {
    private static final AvaliacaoEsportivaSocioemocionalDAO instance = new AvaliacaoEsportivaSocioemocionalDAO();

    public static AvaliacaoEsportivaSocioemocionalDAO getInstance(){
        return instance;
    }

    public List<AvaliacaoEsportivaSocioEmocional__c> getByAluno(Id pIdAluno, String pAnoBase) 
    {
        return [
            SELECT 
                Id,
                Aluno__c,
                Ano_Base_Socioemocional__c,
                AnoBaseEsportivo__c,
                Nivel_Socioemocional__c,
                NivelEsportivoDoAluno__c,
                RecordTypeId
            FROM 
                AvaliacaoEsportivaSocioEmocional__c 
            WHERE 
                Aluno__c = :pIdAluno 
            AND (Ano_Base_Socioemocional__c = :pAnoBase OR AnoBaseEsportivo__c = :pAnoBase)
        ];
    }
}
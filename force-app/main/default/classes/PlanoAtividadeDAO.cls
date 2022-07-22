public class PlanoAtividadeDAO {
    private static final PlanoAtividadeDAO instance = new PlanoAtividadeDAO();

    public static PlanoAtividadeDAO getInstance(){
        return instance;
    }

    public List<PlanoAtividade__c> getByPlanoTreino(Id idPlanoTreino){
        return [
            SELECT  
                Id,
                Atividade__c,
                PlanoTreino__c,
                TempoPlanejado__c,
                TempoRealizado__c,
                Tipo__c
            FROM 
                PlanoAtividade__c
            WHERE
                PlanoTreino__c = :idPlanoTreino
                
        ];
    }
}
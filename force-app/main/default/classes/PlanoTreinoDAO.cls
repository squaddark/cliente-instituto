public class PlanoTreinoDAO {
    private static final PlanoTreinoDAO instance = new PlanoTreinoDAO();

    public static PlanoTreinoDAO getInstance(){
        return instance;
    }

    public PlanoTreino__c getById(Id pId){
        return [
            SELECT  
                Id,
                Data__c,
                ConteudoAplicado__c,
                Name,
                Objetivo__c,
                TipoTreino__c,
                Turma__c
            FROM 
                PlanoTreino__c
            WHERE
                Id = :pId
        ];
    }

    public List<PlanoTreino__c> getByDataAndTurma(Date dataPlano, Id idTurma){
        return [
            SELECT  
                Id,
                Data__c,
                ConteudoAplicado__c,
                Name,
                Objetivo__c,
                TipoTreino__c,
                Turma__c
            FROM 
                PlanoTreino__c
            WHERE
                Data__c = :dataPlano AND
                Turma__c = :idTurma
        ];
    }
}
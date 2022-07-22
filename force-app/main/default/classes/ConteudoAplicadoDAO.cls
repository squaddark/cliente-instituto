public class ConteudoAplicadoDAO {
    private static final ConteudoAplicadoDAO instance = new ConteudoAplicadoDAO();

    public static ConteudoAplicadoDAO getInstance(){
        return instance;
    }

    public List<ConteudoAplicado__c> getByPlanoTreino(Id idPlanoTreino){
        return [
            SELECT  
                Id,
                Conteudo__c,
                ComplementoConteudo__c,
                Dimensao__c,
                Estrutura__c,
                Tipo__c
            FROM 
                ConteudoAplicado__c
            WHERE
                PlanoTreino__c = :idPlanoTreino
        ];
    }

    public List<ConteudoAplicado_Setting__mdt> getClassificacao(String dimensao, String estrutura, String tipo){
        return [
            SELECT  
                Conteudo__c,
                ConteudoAplicado__c,
                Dimensao__c,
                Estrutura__c,
                Tipo__c
            FROM 
                ConteudoAplicado_Setting__mdt
            WHERE
                Dimensao__c =: dimensao AND
                Estrutura__c =: estrutura AND
                Tipo__c =: tipo
        ];
    }
}
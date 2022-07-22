public class porcentagemPresencaDAO{
    public static List<Chamada__c> getchamadas(String turma, Date lDataIni, Date lDataFim){
        return [SELECT Aluno__c, Data__c, Status__c
                FROM Chamada__c
                WHERE turma__c = :turma AND Data__c >= :lDataIni AND Data__c < :lDataFim];
    }

    public static List<Contact> getAlunos(String turma, Date lDataIni, Date lDataFim){
        return [SELECT Id, Ano__c, Name, DataEntrada__c, DataSaida__c
                FROM Contact
                WHERE Papel__c = 'Aluno' 
                    AND DataEntrada__c <= :lDataFim 
                    AND (DataSaida__c >= :lDataIni OR DataSaida__c = null)
                    AND DataEntrada__c != null
                    AND Turma__c = :turma
                ORDER BY Name];
    }

    public static Turma__c buscarTurma(String Id){
        return [SELECT 
            Id, 
            NomeEscola__c, 
            Name, 
            SexoTurma__c, 
            Status__c, 
            Treinador__c, 
            DiasTreino__c, 
            Categoria__c, 
            (SELECT Id, DiaTreino__c FROM GradesHorarias__r)
                FROM Turma__c
                WHERE Id = :Id];
    }

}
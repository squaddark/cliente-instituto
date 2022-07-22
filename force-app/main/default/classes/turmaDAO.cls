public class turmaDAO {
    
    @AuraEnabled
    public static Turma__c buscarTurma(String Id){
      return[
        SELECT 
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
        WHERE Id = :Id
      ];
    }

    @AuraEnabled
    public static List<String> buscaDiasTreino(String recId){
      Set<String> diasTreinoSet = new Set<String>();

      for (GradeHoraria__c gradeHoraria : [SELECT Id, DiaTreino__c FROM GradeHoraria__c WHERE NomeTurma__c = :recId]) {
        diasTreinoSet.add(gradeHoraria.DiaTreino__c);
      }

      List<String> diasTreino = new List<String>(diasTreinoSet);
      return diasTreino;
    }

    public static List<Turma__c> buscarTurmasTreinador(Id pId){
      return [
        SELECT 
          Id,
          Name
        FROM
          Turma__c
        WHERE
          Treinador__c = :pId
      ];
    }

    public static List<Chamada__c> listaChamada(Date dataInicial, Date dataFinal, String turma){
      return[
        SELECT 
          Id, 
          Status__c, 
          Data__c
        FROM 
          Chamada__c 
        WHERE
          Data__c >: dataInicial AND 
          Data__c <: dataFinal AND
          Turma__c =: turma
        ORDER BY Data__c];
    }


    public static List<Contact> listaAlunos(String turma){
      return[
        SELECT 
          Id, 
          Ano__c, 
          Name, 
          (SELECT Id, Status__c FROM Chamadas__r) 
        FROM 
          Contact
        WHERE 
          Papel__c = 'Aluno' AND 
          Turma__c = :turma 
        ORDER BY Name];
    }
}
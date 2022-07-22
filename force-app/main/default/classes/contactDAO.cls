public without sharing  class contactDAO {
    public static Contact getById(Id pContactId) 
    {
        List<Contact> listContact = getBySetId(new Set<Id>{ pContactId });
        return listContact.isEmpty() ? null : listContact[0];
    }

    public static List<Contact> getBySetId(Set<Id> pSetId) 
    {
          return [
            SELECT 
              Id,
              Name,
              PapelEquipe__c,
              RecordType.Name,
              Account.Id
            FROM 
              Contact 
            WHERE Id IN :pSetId
            WITH SECURITY_ENFORCED];
    }


    public static List<Contact> getContactCompetitivo(){
      return [
              SELECT 
                Id, 
                PapelEquipe__c 
              FROM 
                Contact 
              WHERE 
                PapelEquipe__c includes ('TreinadorCompetitivo')];
    }

    @AuraEnabled
    public static List<contactTO> buscarAluno(String turma, String dia, String mes, String ano){
      List<contactTO> listaAlunos = new List<contactTO>();
      String data = null;
      Date diaSelecionado;

      if(!String.isBlank(dia) && !String.isBlank(mes) && !String.isBlank(ano)){
        data = dia + '/' + mes + '/' + ano;
        diaSelecionado = Date.parse(data);
      }

      List<Contact> lstAlunos = new List<Contact>();

      if(String.isBlank(data)){
        lstAlunos = [SELECT Id, Ano__c, Name, Turma__c FROM Contact WHERE Papel__c = 'Aluno' AND Turma__c = :turma order by Name];
      }else{
        lstAlunos = [SELECT 
                          Id,
                          Ano__c,
                          Name,
                          Turma__c 
                    FROM  Contact 
                    WHERE Papel__c = 'Aluno' AND 
                          Turma__c = :turma AND 
                          DataEntrada__c <= :diaSelecionado AND
                          (DataSaida__c >= :diaSelecionado OR 
                          DataSaida__c = NULL)
                    ORDER BY Name];
      }

      for(Contact contato : lstAlunos){
          contactTO aluno = new contactTO();

          aluno.Id = contato.Id;
          aluno.Ano = contato.Ano__c;
          aluno.Name = contato.Name;
          aluno.Turma = contato.Turma__c;
          aluno.StatusDisabled = false;
          listaAlunos.add(aluno);
      }

      return listaAlunos;
    }

    public static List<Contact> buscarAlunosTurma(Id pId){
      return [
              SELECT 
                    Id,
                    Ano__c,
                    Name,
                    Turma__c 
              FROM  Contact 
              WHERE Papel__c = 'Aluno' AND 
                    Turma__c = :pId
              ORDER BY Name
            ];
    }

    public static List<AggregateResult> buscarAlunosTurmaBySetId(Set<Id> pSetId){
      return [
              SELECT 
                Account.Name,
                COUNT(Id)
              FROM  Contact 
              WHERE Papel__c = 'Aluno' AND 
                    Turma__c IN :pSetId
              GROUP BY Account.Name
              LIMIT 200
            ];
    }

    public static List<AggregateResult> buscarDesistenciaTurmaBySetId(Set<Id> pSetId){
      return [
              SELECT 
                Account.Name,
                COUNT(Id)
              FROM  Contact 
              WHERE Papel__c = 'Aluno' AND 
                    DataSaida__c != null AND
                    Turma__c IN :pSetId
              GROUP BY Account.Name
              LIMIT 200
            ];
    }

    public static List<Contact> buscarAlunosByEscola(Set<Id> pSetAccountId){
      return [
              SELECT 
                Id,
                Name,
                AccountId
              FROM  Contact 
              WHERE Papel__c = 'Aluno' AND
                    AccountId IN :pSetAccountId
              LIMIT 200
            ];
    }
}
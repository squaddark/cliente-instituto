@IsTest
public class ContactTriggerTest {
    @IsTest
    public static void testandoCriarContato(){
        //*SETUP
        //Setup - retorna os recordTypesIds
        Id recAluno = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get('Aluno').getRecordTypeId();
        Id recTreinador = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get('TreinadorTutor').getRecordTypeId();

        //Setup - cria escola
        Account escola = new Account(Name = 'Supera', Numero__c = '123', NomeResponsavelEntidade__c = 'José', Site = 'Teste', NumberOfEmployees = 23, Type = 'Estadual');
        insert escola;

        //Setup - cria Tutor
        Contact Tutor = new Contact(FirstName = 'Tutor', LastName = 'Tutor01', RecordTypeId = recTreinador, AccountId = escola.Id, MailingStreet = 'teste', PapelEquipe__c = 'Tutor');
        insert Tutor;

        //Setup - cria turma
        Turma__c turma = new Turma__c(NomeEscola__c = escola.Id, Name = 'Superação', SexoTurma__c = 'Mista', Status__c = 'Ativo');
        insert turma;

        //Setup - cria aluno 1
        Contact Aluno1 = new Contact(FirstName = 'Flavio', LastName = 'Spedo', RecordTypeId = recAluno, Turma__c = turma.Id, AccountId = escola.Id, MailingStreet = 'teste');
        
        Test.startTest();
        insert Aluno1;
        Test.stopTest();

        System.assertNotEquals(null, Aluno1.Id);

    }
}
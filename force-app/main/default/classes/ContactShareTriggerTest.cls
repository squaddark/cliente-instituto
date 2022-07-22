@IsTest
public class ContactShareTriggerTest {
    @IsTest(SeeAllData=true)
    public static void testandoCriarContactShare(){
        //*SETUP
        //Setup - retorna os recordTypesIds
        Id recAluno = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get('Aluno').getRecordTypeId();
        Id recTreinador = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get('TreinadorTutor').getRecordTypeId();

        User objuser = [SELECT Id, ContactId, Contact.PapelEquipe__c FROM User WHERE Contact.PapelEquipe__c includes ('Tutor') limit 1];

        //Setup - cria escola
        Account escola = new Account(Name = 'Supera', Numero__c = '123', NomeResponsavelEntidade__c = 'José', Site = 'Teste', NumberOfEmployees = 23, Type = 'Estadual');
        insert escola;

        //Setup - cria Tutor
        Contact Tutor = new Contact(FirstName = 'Tutor', LastName = 'Tutor01', RecordTypeId = recTreinador, AccountId = escola.Id, MailingStreet = 'teste', PapelEquipe__c = 'Tutor',
        cpf__c = '08907764077');
        insert Tutor;

        //Setup - cria turma
        Turma__c turma = new Turma__c(NomeEscola__c = escola.Id, Name = 'Superação', SexoTurma__c = 'Mista', Status__c = 'Ativo');
        insert turma;

        //Setup - cria aluno 1
        Contact Aluno1 = new Contact(FirstName = 'Flavio', LastName = 'Spedo', RecordTypeId = recAluno, Turma__c = turma.Id, AccountId = escola.Id, MailingStreet = 'teste',
        cpf__c = '80460196073');
        insert Aluno1;
        
        AccountContactRelation objAccountContactRelation = new AccountContactRelation();
        objAccountContactRelation.ContactId = objuser.ContactId;
        objAccountContactRelation.AccountId = escola.Id;
        objAccountContactRelation.Roles = 'Tutor';
        objAccountContactRelation.IsActive = true;
        System.debug(objuser);

        Test.startTest();
        insert objAccountContactRelation;
        Test.stopTest();

        System.assertNotEquals(null, Aluno1.Id);

    }

    @IsTest(SeeAllData=true)
    public static void testandoRemoverContactShare(){
        //*SETUP
        //Setup - retorna os recordTypesIds
        Id recAluno = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get('Aluno').getRecordTypeId();
        Id recTreinador = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get('TreinadorTutor').getRecordTypeId();

        User objuser = [SELECT Id, ContactId, Contact.PapelEquipe__c FROM User WHERE Contact.PapelEquipe__c includes ('Tutor') limit 1];

        //Setup - cria escola
        Account escola = new Account(Name = 'Supera', Numero__c = '123', NomeResponsavelEntidade__c = 'José', Site = 'Teste', NumberOfEmployees = 23, Type = 'Estadual');
        insert escola;

        //Setup - cria Tutor
        Contact Tutor = new Contact(FirstName = 'Tutor', LastName = 'Tutor01', RecordTypeId = recTreinador, AccountId = escola.Id, MailingStreet = 'teste', PapelEquipe__c = 'Tutor',
        cpf__c = '08907764077');
        insert Tutor;

        //Setup - cria turma
        Turma__c turma = new Turma__c(NomeEscola__c = escola.Id, Name = 'Superação', SexoTurma__c = 'Mista', Status__c = 'Ativo');
        insert turma;

        //Setup - cria aluno 1
        Contact Aluno1 = new Contact(FirstName = 'Flavio', LastName = 'Spedo', RecordTypeId = recAluno, Turma__c = turma.Id, AccountId = escola.Id, MailingStreet = 'teste',
        cpf__c = '80460196073');
        insert Aluno1;
        
        AccountContactRelation objAccountContactRelation = new AccountContactRelation();
        objAccountContactRelation.ContactId = objuser.ContactId;
        objAccountContactRelation.AccountId = escola.Id;
        objAccountContactRelation.Roles = 'Tutor';
        objAccountContactRelation.IsActive = true;
        
        insert objAccountContactRelation;

        objAccountContactRelation = [SELECT ID FROM AccountContactRelation WHERE Id = :objAccountContactRelation.Id];

        Test.startTest();
        delete objAccountContactRelation;
        Test.stopTest();

        System.assertNotEquals(null, Aluno1.Id);

    }
}
@isTest
public class GradeHorariaControllerTest {
    @IsTest
    static void testandoSalvarGrade(){

        Account objEscola = new Account(Name = 'Supera', Numero__c = '123', NomeResponsavelEntidade__c = 'José', Site = 'Teste', NumberOfEmployees = 23, Type = 'Estadual');
        insert objEscola;

        //Setup - cria turma
        Turma__c turma = new Turma__c(NomeEscola__c = objEscola.Id, Name = 'Superação', SexoTurma__c = 'Mista', Status__c = 'Ativo');
        insert turma;

        GradeHoraria__c grade1 = new GradeHoraria__c(NomeTurma__c = turma.Id, DiaTreino__c = 'Segunda-feira');
        insert grade1;

        Test.startTest();
        Boolean retorno = GradeHorariaController.salvar(grade1.Id, objEscola.Id);
        Test.stopTest();

        System.assertEquals(true, retorno);
    }

    @IsTest
    static void testandoSalvarAccount(){
        Id recTreinador = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get('TreinadorTutor').getRecordTypeId();

        Account objEscola = new Account(Name = 'Supera', Numero__c = '123', NomeResponsavelEntidade__c = 'José', Site = 'Teste', NumberOfEmployees = 23, Type = 'Estadual');
        insert objEscola;

        //Setup - cria treinador1
        Contact contato = new Contact(FirstName = 'Tulio', LastName = 'Malaquias', RecordTypeId = recTreinador, AccountId = objEscola.Id, MailingStreet = 'teste');
        insert contato;

        //Setup - cria turma
        Turma__c turma = new Turma__c(NomeEscola__c = objEscola.Id, Name = 'Superação', SexoTurma__c = 'Mista', Status__c = 'Ativo');
        insert turma;

        GradeHoraria__c grade1 = new GradeHoraria__c(NomeTurma__c = turma.Id, DiaTreino__c = 'Segunda-feira');
        insert grade1;

        Test.startTest();
        Boolean retorno = GradeHorariaController.salvar(contato.Id, objEscola.Id);
        Test.stopTest();

        System.assertEquals(true, retorno);
    }

    @IsTest
    static void testandoSalvarGradeErro(){

        Test.startTest();
        Boolean retorno = GradeHorariaController.salvar(null, null);
        Test.stopTest();

        System.assertEquals(false, retorno);
    }
}
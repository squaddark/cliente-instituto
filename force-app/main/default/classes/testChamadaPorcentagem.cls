@IsTest
public class testChamadaPorcentagem {
    @IsTest
    static void testandoVerificaDiasNoMes(){

        //*SETUP
        //Setup - retorna os recordTypesIds
        Id recAluno = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get('Aluno').getRecordTypeId();
        Id recTreinador = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get('TreinadorTutor').getRecordTypeId();
        
        //Setup - cria escola
        Account escola = new Account(Name = 'Supera', Numero__c = '123', NomeResponsavelEntidade__c = 'José', Site = 'Teste', NumberOfEmployees = 23, Type = 'Estadual');
        insert escola;

        //Setup - cria treinador1
        Contact tulio = new Contact(FirstName = 'Tulio', LastName = 'Malaquias', RecordTypeId = recTreinador, AccountId = escola.Id, MailingStreet = 'teste');
        insert tulio;
        
        //Setup - cria turma
        Turma__c turma = new Turma__c(NomeEscola__c = escola.Id, Name = 'Superação', SexoTurma__c = 'Mista', Status__c = 'Ativo');
        insert turma;
        
        //Setup - cria grade horaria - segunda-feira
        GradeHoraria__c grade1 = new GradeHoraria__c(NomeTurma__c = turma.Id, DiaTreino__c = 'Segunda-feira');
        insert grade1;

        //Setup - cria grade horaria - terça-feira
        GradeHoraria__c grade2 = new GradeHoraria__c(NomeTurma__c = turma.Id, DiaTreino__c = 'Terça-feira');
        insert grade2;
        
        //Setup - cria grade horaria - quarta-feira
        GradeHoraria__c grade3 = new GradeHoraria__c(NomeTurma__c = turma.Id, DiaTreino__c = 'Quarta-feira');
        insert grade3;
        
        //Setup - cria grade horaria - quarta-feira
        GradeHoraria__c grade4 = new GradeHoraria__c(NomeTurma__c = turma.Id, DiaTreino__c = 'Sábado');
        insert grade4;
        
        //Setup - cria aluno 1
        Contact flavio = new Contact(FirstName = 'Flavio', LastName = 'Spedo', RecordTypeId = recAluno, Turma__c = turma.Id, AccountId = escola.Id, MailingStreet = 'teste');
        insert flavio;

        //Setup - cria aluno 2
        Contact igor = new Contact(FirstName = 'Igor', LastName = 'Rangel', RecordTypeId = recAluno, Turma__c = turma.Id, AccountId = escola.Id, MailingStreet = 'teste');
        insert igor;

        //Setup - cria aluno 3
        Contact maria = new Contact(FirstName = 'Maria', LastName = 'Conceição', RecordTypeId = recAluno, Turma__c = turma.Id, AccountId = escola.Id, MailingStreet = 'teste');
        insert maria;
		
        
        //Setup: chamadas
        Chamada__c chamada1 = new Chamada__c(Data__c = Date.newInstance(2021, 10, 04), Status__c = 'Presente', Turma__c = turma.Id, Aluno__c = flavio.Id);
        Chamada__c chamada2 = new Chamada__c(Data__c = Date.newInstance(2021, 10, 04), Status__c = 'Presente', Turma__c = turma.Id, Aluno__c = igor.Id);
        Chamada__c chamada3 = new Chamada__c(Data__c = Date.newInstance(2021, 10, 04), Status__c = 'Presente', Turma__c = turma.Id, Aluno__c = maria.Id);
        insert chamada1;
        insert chamada2;
        insert chamada3;

        List<String> dias = new List<String>();
        dias.add('Segunda-Feira');
        dias.add('Terça-Feira');
        dias.add('Quarta-Feira');
        dias.add('Quinta-Feira');
        dias.add('Sexta-Feira');
        dias.add('Sábado');
        dias.add('Domingo');
        
        Test.startTest();
        List<String> retorno = diasDaSemana.verificaDiasNoMes(10, 2021, dias, turma.Id);
        Test.stopTest();


        System.assertNotEquals(null, retorno);
    }
    
    @IsTest
    static void testandoAdicionarDiasSucesso(){
        List<String> lstDias = new List<String>();
        
        Test.startTest();
        String retorno = diasDaSemana.adicionarDia('10', lstDias, '01');
        Test.stopTest();

        System.assertNotEquals(null, retorno);
    }
}
@IsTest
public with sharing class listaDePresencaControllerTest {
    @TestSetup static void testarMetodosDePresenca(){
        Id recAluno = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get('Aluno').getRecordTypeId();
        Id recTreinador = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get('TreinadorTutor').getRecordTypeId();

        Account objEscola = new Account(Name = 'Supera', Numero__c = '123', NomeResponsavelEntidade__c = 'José', Site = 'Teste', NumberOfEmployees = 23, Type = 'Estadual');
        insert objEscola;

        System.debug('1');

        Contact objTreinador = new Contact(FirstName = 'Tulio', LastName = 'Malaquias', Cpf__c = '70189814098',  RecordTypeId = recTreinador, AccountId = objEscola.Id, MailingStreet = 'teste', PapelEquipe__c = 'Treinador');
        insert objTreinador;
        System.debug('2');

        Turma__c objTurma = new Turma__c(NomeEscola__c = objEscola.Id, Name = 'Superação', SexoTurma__c = 'Mista', Status__c = 'Ativo');
        insert objTurma;

        System.debug('3');

        List<GradeHoraria__c> lstGrade = new List<GradeHoraria__c>();
        lstGrade.add(
            new GradeHoraria__c(NomeTurma__c = objTurma.Id, DiaTreino__c = 'Segunda-feira')
        );
        lstGrade.add(
            new GradeHoraria__c(NomeTurma__c = objTurma.Id, DiaTreino__c = 'Terça-feira')
        );
        lstGrade.add(
            new GradeHoraria__c(NomeTurma__c = objTurma.Id, DiaTreino__c = 'Quarta-feira')
        );
        lstGrade.add(
            new GradeHoraria__c(NomeTurma__c = objTurma.Id, DiaTreino__c = 'Sábado')
        );

        insert lstGrade;

        
        System.debug('4');

        List<Contact> lstAlunos = new List<Contact>();
        lstAlunos.add(
            new Contact(FirstName = 'Flavio', LastName = 'Spedo', RecordTypeId = recAluno, Turma__c = objTurma.Id, AccountId = objEscola.Id, MailingStreet = 'teste')
        );

        lstAlunos.add(
            new Contact(FirstName = 'Igor', LastName = 'Rangel', RecordTypeId = recAluno, Turma__c = objTurma.Id, AccountId = objEscola.Id, MailingStreet = 'teste')
        );

        lstAlunos.add(
            new Contact(FirstName = 'Maria', LastName = 'Conceição', RecordTypeId = recAluno, Turma__c = objTurma.Id, AccountId = objEscola.Id, MailingStreet = 'teste')
        );

        insert lstAlunos;

        
        System.debug('5');

        List<Chamada__c> lstChamada = new List<Chamada__c>();
        lstChamada.add(
            new Chamada__c(Data__c = Date.newInstance(2021, 10, 04), Status__c = 'Presente', Turma__c = objTurma.Id, Aluno__c = lstAlunos[0].Id)    
        );

        lstChamada.add(
            new Chamada__c(Data__c = Date.newInstance(2021, 10, 04), Status__c = 'Presente', Turma__c = objTurma.Id, Aluno__c = lstAlunos[1].Id)
        );

        lstChamada.add(
            new Chamada__c(Data__c = Date.newInstance(2021, 10, 04), Status__c = 'Presente', Turma__c = objTurma.Id, Aluno__c = lstAlunos[2].Id)
        );

        insert lstChamada;

        
        System.debug('6');
    }

    @IsTest
    static void testandoSalvarListaDePresenca(){
        Id recAluno = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get('Aluno').getRecordTypeId();
        List<Contact> lstContact = [SELECT Id FROM Contact WHERE RecordTypeId = :recAluno]; 
        List<Turma__c> lstTurma = [SELECT Id FROM Turma__c]; 

        String presencasMap = '{"'+lstContact[0].Id+'":"Presente","'+lstContact[1].Id+'":"Falta","'+lstContact[2].Id+'":"Atestado"}';
        String alunosMap = '{"'+lstContact[0].Id+'":"'+lstContact[0].Id+'","'+lstContact[1].Id+'":"'+lstContact[1].Id+'","'+lstContact[2].Id+'":"'+lstContact[2].Id+'"}';

        Test.startTest();
        listaDePresencaController.saveListaDePresenca(presencasMap, alunosMap, '', '06', '01', '2022', lstTurma[0].Id);
        Test.stopTest();

        Date dataChamada = Date.newInstance(2022, 01, 06);
        List<Chamada__c> lstChamada = [SELECT Id, Data__c FROM Chamada__c WHERE Data__c = :dataChamada];

        System.assertNotEquals(null, lstChamada);
    }

    @IsTest
    static void testandoSalvarListaDePresencaSemDadosIniciais(){
        Id recAluno = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get('Aluno').getRecordTypeId();
        List<Contact> lstContact = [SELECT Id FROM Contact WHERE RecordTypeId = :recAluno]; 
        List<Turma__c> lstTurma = [SELECT Id FROM Turma__c]; 
        

        String presencasMap = '{"'+lstContact[0].Id+'":"Presente","'+lstContact[1].Id+'":"Falta","'+lstContact[2].Id+'":"Atestado"}';
        String alunosMap = '{"'+lstContact[0].Id+'":"'+lstContact[0].Id+'","'+lstContact[1].Id+'":"'+lstContact[1].Id+'","'+lstContact[2].Id+'":"'+lstContact[2].Id+'"}';

        Test.startTest();
        listaDePresencaController.saveListaDePresenca(presencasMap, alunosMap, '', '04', '10', '2021', lstTurma[0].Id);
        Test.stopTest();

        Date dataChamada = Date.newInstance(2022, 01, 06);
        List<Chamada__c> lstChamada = [SELECT Id, Data__c FROM Chamada__c WHERE Data__c = :dataChamada];

        System.assertNotEquals(null, lstChamada);
    }

    @IsTest
    static void testandoBuscarChamada(){
        List<Turma__c> lstTurma = [SELECT Id FROM Turma__c];
        
        Test.startTest();
		Map<String, Chamada__c> objRetorno = listaDePresencaController.buscarChamadaMap(lstTurma[0].Id, '04', '10', '2021');
		Test.stopTest();

        System.debug(objRetorno);

        System.assertNotEquals(null, objRetorno);
    }

    @IsTest
    static void testandoBuscarChamadaLista()
    {
        List<Turma__c> lstTurma = [SELECT Id FROM Turma__c];

        Test.startTest();
        List<Chamada__c> listaChamada = listaDePresencaController.buscarChamadaList(lstTurma[0].Id, '04', '10', '2021');
        Test.stopTest();

        System.assertNotEquals(null, listaChamada);
    }
}
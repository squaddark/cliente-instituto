@IsTest
public with sharing class AvaliacaoTutorTest {
    @IsTest
    static void testandoSalvarAvaliacao(){
        Id recAluno = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get('Aluno').getRecordTypeId();
        Id recTreinador = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get('TreinadorTutor').getRecordTypeId();
        
        //Setup - cria escola
        Account escola = new Account(Name = 'Supera', Numero__c = '123', NomeResponsavelEntidade__c = 'José', Site = 'Teste', NumberOfEmployees = 23, Type = 'Estadual');
        insert escola;

        //Setup - cria treinador1
        Contact treinador = new Contact(FirstName = 'Tulio', LastName = 'Malaquias', RecordTypeId = recTreinador, AccountId = escola.Id, MailingStreet = 'teste');
        insert treinador;

        List<AvaliacaoController.AvaliacaoTutorTO> lstAvaliacao = new List<AvaliacaoController.AvaliacaoTutorTO>();
        AvaliacaoController.AvaliacaoTutorTO objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Não';
        objAvaliacao.Sequencia = '1';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = '0 a 15';
        objAvaliacao.Sequencia = '2';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = '41 a 70%';
        objAvaliacao.Sequencia = '3';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = '41 a 70%';
        objAvaliacao.Sequencia = '4';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = '41 a 70%';
        objAvaliacao.Sequencia = '5';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = '41 a 70%';
        objAvaliacao.Sequencia = '6';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = '41 a 70%';
        objAvaliacao.Sequencia = '7';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = '41 a 70%';
        objAvaliacao.Sequencia = '8';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Não';
        objAvaliacao.Sequencia = '9';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Não entregou nenhuma';
        objAvaliacao.Sequencia = '10';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Não';
        objAvaliacao.Sequencia = '11';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Não executou';
        objAvaliacao.Sequencia = '12';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Não';
        objAvaliacao.Sequencia = '13';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Não';
        objAvaliacao.Sequencia = '14';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Não';
        objAvaliacao.Sequencia = '15';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '16';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '17';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '18';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '19';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '20';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '21';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '22';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '23';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '24';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '25';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '26';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '27';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '28';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '29';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '30';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '31';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '32';


        lstAvaliacao.add(objAvaliacao);

        String respostas = JSON.serialize(lstAvaliacao);
        
        Test.startTest();
        Boolean retorno = AvaliacaoController.salvarAvaliacao('', '01', '2022', String.valueOf(treinador.Name), Date.today(), null, '', respostas);
        Test.stopTest();

        System.assertEquals(true, retorno);
    }

    @IsTest
    static void testandoBuscarAvaliacao(){
        Id recAluno = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get('Aluno').getRecordTypeId();
        Id recTreinador = Schema.SObjectType.Contact.getRecordTypeInfosByDeveloperName().get('TreinadorTutor').getRecordTypeId();
        
        //Setup - cria escola
        Account escola = new Account(Name = 'Supera', Numero__c = '123', NomeResponsavelEntidade__c = 'José', Site = 'Teste', NumberOfEmployees = 23, Type = 'Estadual');
        insert escola;

        //Setup - cria treinador1
        Contact treinador = new Contact(FirstName = 'Tulio', LastName = 'Malaquias', RecordTypeId = recTreinador, AccountId = escola.Id, MailingStreet = 'teste');
        insert treinador;

        List<AvaliacaoController.AvaliacaoTutorTO> lstAvaliacao = new List<AvaliacaoController.AvaliacaoTutorTO>();
        AvaliacaoController.AvaliacaoTutorTO objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Não';
        objAvaliacao.Sequencia = '1';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = '0 a 15';
        objAvaliacao.Sequencia = '2';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = '41 a 70%';
        objAvaliacao.Sequencia = '3';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = '41 a 70%';
        objAvaliacao.Sequencia = '4';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = '41 a 70%';
        objAvaliacao.Sequencia = '5';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = '41 a 70%';
        objAvaliacao.Sequencia = '6';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = '41 a 70%';
        objAvaliacao.Sequencia = '7';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = '41 a 70%';
        objAvaliacao.Sequencia = '8';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Não';
        objAvaliacao.Sequencia = '9';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Não entregou nenhuma';
        objAvaliacao.Sequencia = '10';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Não';
        objAvaliacao.Sequencia = '11';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Não executou';
        objAvaliacao.Sequencia = '12';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Não';
        objAvaliacao.Sequencia = '13';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Não';
        objAvaliacao.Sequencia = '14';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Não';
        objAvaliacao.Sequencia = '15';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '16';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '17';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '18';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '19';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '20';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '21';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '22';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '23';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '24';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '25';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '26';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '27';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '28';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '29';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '30';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '31';


        lstAvaliacao.add(objAvaliacao);

        objAvaliacao = new AvaliacaoController.AvaliacaoTutorTO();

        objAvaliacao.Codigo = null;
        objAvaliacao.Indicador = '1';
        objAvaliacao.Resposta = '0';
        objAvaliacao.ValorResposta = 'Nunca';
        objAvaliacao.Sequencia = '32';


        lstAvaliacao.add(objAvaliacao);

        String respostas = JSON.serialize(lstAvaliacao);
        
        AvaliacaoController.salvarAvaliacao('', '01', '2022', String.valueOf(treinador.Name), Date.today(), null, '', respostas);


        Test.startTest();
        AvaliacaoController.AvaliacaoTO retorno = AvaliacaoController.buscarAvaliacao(String.valueOf(treinador.Name), '2022', '01');
        Test.stopTest();

        System.assertNotEquals(null, retorno);
    }
    @IsTest
    static void testContarAlunos(){
        Account escola = TestDataFactory.criarEscola('Escola teste');
        Contact treinador = TestDataFactory.criarTreinador('Fitzz');
        Turma__c turma = TestDataFactory.criarTurma('turma teste', treinador.Id, escola.Id);
        Contact aluno = TestDataFactory.criarAluno('Aluno', turma.Id);

        Test.startTest();
        List<Integer> retorno = AvaliacaoController.ContarAlunos(treinador.Name);
        Test.stopTest();

        System.assertEquals(1, retorno[0]);
        System.assertEquals(1, retorno[1]);
    }
    @IsTest
    static void testandocontarAvaliacaoEsportivaTrue(){
        List<AvaliacaoEsportivaSocioemocional__c> listRetorno = new List<AvaliacaoEsportivaSocioemocional__c>();

        Account escola = TestDataFactory.criarEscola('Escola teste');
        Contact treinador = TestDataFactory.criarTreinador('Fitzz');
        Turma__c turma = TestDataFactory.criarTurma('turma teste', treinador.Id, escola.Id);
        Contact aluno = TestDataFactory.criarAluno('Aluno', turma.Id);
        // QUANDO FOR FAZER DEPLOY PARA UAT TROCAR O ID PARA '0128800000007cbAAA'
        AvaliacaoEsportivaSocioemocional__c avaliacao1 = TestDataFactory.criarAvaliacao(turma.Id, aluno.Id, '012Z0000000b0njIAA');
        AvaliacaoEsportivaSocioemocional__c avaliacao2 = TestDataFactory.criarAvaliacao(turma.Id, aluno.Id, '012Z0000000b0njIAA');
        AvaliacaoEsportivaSocioemocional__c avaliacao3 = TestDataFactory.criarAvaliacao(turma.Id, aluno.Id, '012Z0000000b0njIAA');
        avaliacao1.Periodo_de_Avaliacao__c='1ª Avaliação';
        avaliacao2.Periodo_de_Avaliacao__c='2ª Avaliação';
        avaliacao3.Periodo_de_Avaliacao__c='3ª Avaliação';
        listRetorno.add(avaliacao1);
        listRetorno.add(avaliacao2);
        listRetorno.add(avaliacao3);
        
        insert listRetorno;

        Test.startTest();
        Decimal retorno1 = AvaliacaoController.contarAvaliacaoEsportiva(treinador.Name, '04');
        Decimal retorno2 = AvaliacaoController.contarAvaliacaoEsportiva(treinador.Name, '08');
        Decimal retorno3 = AvaliacaoController.contarAvaliacaoEsportiva(treinador.Name, '11');
        Test.stopTest();

        System.assertEquals(100, retorno1);
        System.assertEquals(100, retorno2);
        System.assertEquals(100, retorno3);
    }
    @IsTest
    static void testandocontarAvaliacaoEsportivaFalse(){
        Contact treinador = TestDataFactory.criarTreinador('Fitzz');
        Test.startTest();
        Decimal retorno = AvaliacaoController.contarAvaliacaoEsportiva(treinador.Name, '04');
        Test.stopTest();

        System.assertEquals(200, retorno);
    }
    @IsTest
    static void testandocontarAvaliacaoSocioemocionalTrue(){
        List<AvaliacaoEsportivaSocioemocional__c> listRetorno = new List<AvaliacaoEsportivaSocioemocional__c>();
        
        Account escola = TestDataFactory.criarEscola('Escola teste');
        Contact treinador = TestDataFactory.criarTreinador('Fitzz');
        Turma__c turma = TestDataFactory.criarTurma('turma teste', treinador.Id, escola.Id);
        Contact aluno = TestDataFactory.criarAluno('Aluno', turma.Id);
        // QUANDO FOR FAZER DEPLOY PARA UAT TROCAR O ID PARA '0128800000007ccAAA'
        AvaliacaoEsportivaSocioemocional__c avaliacao1 = TestDataFactory.criarAvaliacao(turma.Id, aluno.Id, '012Z0000000b0noIAA');
        AvaliacaoEsportivaSocioemocional__c avaliacao2 = TestDataFactory.criarAvaliacao(turma.Id, aluno.Id, '012Z0000000b0noIAA');
        AvaliacaoEsportivaSocioemocional__c avaliacao3 = TestDataFactory.criarAvaliacao(turma.Id, aluno.Id, '012Z0000000b0noIAA');
        avaliacao1.Periodo_de_Avaliacao__c='1ª Avaliação';
        avaliacao2.Periodo_de_Avaliacao__c='2ª Avaliação';
        avaliacao3.Periodo_de_Avaliacao__c='3ª Avaliação';
        listRetorno.add(avaliacao1);
        listRetorno.add(avaliacao2);
        listRetorno.add(avaliacao3);
        
        insert listRetorno;


        Test.startTest();
        Decimal retorno1 = AvaliacaoController.contarAvaliacaoSocioemocional(treinador.Name, '04');
        Decimal retorno2 = AvaliacaoController.contarAvaliacaoSocioemocional(treinador.Name, '08');
        Decimal retorno3 = AvaliacaoController.contarAvaliacaoSocioemocional(treinador.Name, '11');
        Test.stopTest();

        System.assertEquals(100, retorno1);
        System.assertEquals(100, retorno2);
        System.assertEquals(100, retorno3);
    }
    @IsTest
    static void testandocontarAvaliacaoSocioemocionalFalse(){
        Contact treinador = TestDataFactory.criarTreinador('Fitzz');
        Test.startTest();
        Decimal retorno = AvaliacaoController.contarAvaliacaoSocioemocional(treinador.Name, '04');
        Test.stopTest();

        System.assertEquals(200, retorno);
    }


    @IsTest
    static void testVerificarCadastroCompleto(){
        List<Contact> listCtt = new List<Contact>();
        // #################### CRIANDO ESCOLA ####################
        Account escola = TestDataFactory.criarEscola('Escola teste');
        
        // #################### CRIANDO TREINADOR ####################
        Contact treinador = TestDataFactory.criarTreinador('Fitzz');
        
        // #################### CRIANDO TURMA ####################
        Turma__c turma = TestDataFactory.criarTurma('turma teste', treinador.Id, escola.Id);


        // #################### CRIANDO REGISTROS DE ALUNOS ####################
        for(Integer i = 0; i < 100; i++){
            Contact ctt = new Contact();
            ctt.RecordTypeId = '0124W000001h11kQAA';
            // CAMPOS OBRIGATÓRIOS
            ctt.FirstName = 'Test' + i;
            ctt.LastName = 'Batata' + i;
            ctt.Rg__c = '03983736';
            ctt.NaturalDe__c = 'test' + i;
            ctt.Sexo__c = 'Masculino';
            ctt.RacaCor__c = 'Preto';
            ctt.MobilePhone = '8798768465';
            ctt.EmCasoEmergenciaAvisar__c = 'A ninguem' + i;
            ctt.Phone = '615468426';
            ctt.Ano__c = '1° Ano';
            ctt.Periodo__c = 'Tarde';
            ctt.Birthdate = system.today();
            ctt.DataEntrada__c = system.today();
            ctt.Turma__c = turma.Id;
            ctt.PossuiAlgumaAlergia__c = 'Não' + i;
            ctt.PlanoSaude__c = 'Amil';
            ctt.AlgumaDoencaDeficienciaQual__c = 'Não' + i;
            ctt.TomaRemedioRegularmente__c = 'Não' + i;
            // QUANDO FOR FAZER DEPLOY PARA UAT TROCAR A RendaFamiliarTotal PARA 'até R$ 1.300,00 por mês'
            ctt.RendaFamiliarTotal__c = 'até R$ 1.300,00';
            ctt.QuantasPessoas__c = i;
            ctt.RecebeAlgumAuxilioGoverno__c = 'Sim';
            ctt.NomeReponsavel__c = 'Test' + i;
            ctt.OcupacaoResponsavel__c = 'Pedreiro' + i;
            ctt.GrauParentesco__c = 'Pai';
            ctt.GrauInstrucaoResponsavel__c = 'Analfabeto';
            ctt.RgResponsavel__c = '68465432';
            ctt.CelularResponsavel__c = '6542318' + i;
            ctt.CpfResponsavel__c = '80252435087';
            ctt.Numero__c = '2' + i;
            ctt.Bairro__c = 'Batatinha' + i;
            ctt.MailingStreet = 'Rua Celso de Carvalho';
            ctt.MailingCity = 'Salgado';
            ctt.MailingState = 'SE';
            ctt.MailingPostalCode = '49390000';
            ctt.Complemento__c = 'Frente da pizzaria';
            
            if(i < 45){
                // CAMPOS NÃO OBRIGATÓRIOS
                ctt.Cpf__c = '58670848090';
                ctt.UsoImagemAutorizado__c = 'Sim';
                ctt.DeclaracaoSaudeEntregue__c = 'Sim';
                ctt.Email = 'teste@testando.com' + i;
                ctt.AccountId = escola.Id;
                ctt.MotivoSaida__c = 'Desinteresse';
                ctt.Altura__c = 1.78;
                ctt.Peso__c = 80.0;
                ctt.UsoMaos__c = 'Destro';
                ctt.TamanhoCamiseta__c = 'P';
                ctt.TamanhoTenis__c = ''+i;
                ctt.TipoSanguineo__c = 'A+';
                ctt.OndeFazAcompanhamento__c = 'Ali ' + i;
                ctt.VoceTrabalhaOnde__c = 'Sim, ' + i;
                ctt.Renda__c = 5000.00;
                ctt.TemFilhosQuantos__c = i;
                ctt.TemParenteParticipanteSuperacao__c = 'Sim ' + i;
                ctt.EmQualEscola__c = 'Batata' + i;
                ctt.FazAtividadeOutraInstituicao__c = 'Não ' + i;
                ctt.QualAtividade__c = 'Basquete ' + i;
                ctt.QualPeriodo__c = 'Tarde';
                ctt.CumpriuMedidaSocioEducativa__c = 'Sim';
                ctt.EFederado__c = 'Sim';
                ctt.QualAuxilio__c = 'Pensão ' + i;
                ctt.EmailRresponsavel__c = 'testando@gmail.com' + i;
                ctt.NomeResponsavel2__c = 'Resp ' + i;
                ctt.GrauParentesco2__c = 'Pai';
                ctt.RGResponsavel2__c = '68154684' + i;
                ctt.CPFResponsavel2__c = '28464775075';
                ctt.OcupacaoResponsavel2__c = 'Pedreiro' + i;
                ctt.GrauInstrucaoResponsavel2__c = 'Analfabeto';
                ctt.CelularResponsavel2__c = '6546846512';
                ctt.EmailResponsavel2__c = 'maisum@teste.com' + i;
                ctt.DataSaida__c = Date.today(); 
                // ctt.MailingAddress = ' ' + i;
                // ctt.EstadoEscola__c = ' ' + i;
                // ctt.CodigoContato__c = ' ' + i;
            }
            
            listCtt.add(ctt);
        }
        insert listCtt;

        Test.startTest();
            Decimal retorno = AvaliacaoController.verificarCadastroCompleto(treinador.Name);
        Test.stopTest();
        System.assertEquals(45, retorno);
    }

    @IsTest
    static void testContarAlunosAprovados(){
        List<Contact> listCtt = new List<Contact>();
        List<NotaAcademica__c> listNtAc = new List<NotaAcademica__c>();
       // #################### CRIANDO ESCOLA ####################
       Account escola = TestDataFactory.criarEscola('Escola teste');
        
       // #################### CRIANDO TREINADOR ####################
       Contact treinador = TestDataFactory.criarTreinador('Fitzz');
       
       // #################### CRIANDO TURMA ####################
       Turma__c turma = TestDataFactory.criarTurma('turma teste', treinador.Id, escola.Id);


        for(Integer i = 0; i < 100; i++){
            // #################### CRIANDO REGISTROS DE ALUNOS ####################
            Contact ctt = new Contact();

            ctt.FirstName = 'Test' + i;
            ctt.LastName = 'Batata' + i;
            ctt.Rg__c = '03983736';
            ctt.NaturalDe__c = 'test' + i;
            ctt.Sexo__c = 'Masculino';
            ctt.RacaCor__c = 'Preto';
            ctt.MobilePhone = '8798768465';
            ctt.EmCasoEmergenciaAvisar__c = 'A ninguem' + i;
            ctt.Phone = '615468426';
            ctt.Ano__c = '1° Ano';
            ctt.Periodo__c = 'Tarde';
            ctt.Birthdate = system.today();
            ctt.DataEntrada__c = system.today();
            ctt.Turma__c = turma.Id;
            ctt.PossuiAlgumaAlergia__c = 'Não' + i;
            ctt.PlanoSaude__c = 'Amil';
            ctt.AlgumaDoencaDeficienciaQual__c = 'Não' + i;
            ctt.TomaRemedioRegularmente__c = 'Não' + i;
            // QUANDO FOR FAZER DEPLOY PARA UAT TROCAR A RendaFamiliarTotal PARA 'até R$ 1.300,00 por mês'
            ctt.RendaFamiliarTotal__c = 'até R$ 1.300,00';
            ctt.QuantasPessoas__c = i;
            ctt.RecebeAlgumAuxilioGoverno__c = 'Sim';
            ctt.NomeReponsavel__c = 'Test' + i;
            ctt.OcupacaoResponsavel__c = 'Pedreiro' + i;
            ctt.GrauParentesco__c = 'Pai';
            ctt.GrauInstrucaoResponsavel__c = 'Analfabeto';
            ctt.RgResponsavel__c = '68465432';
            ctt.CelularResponsavel__c = '6542318' + i;
            ctt.CpfResponsavel__c = '80252435087';
            ctt.Numero__c = '2' + i;
            ctt.Bairro__c = 'Batatinha' + i;
            ctt.MailingStreet = 'Rua Celso de Carvalho';
            ctt.MailingCity = 'Salgado';
            ctt.MailingState = 'SE';
            ctt.MailingPostalCode = '49390000';
            ctt.Complemento__c = 'Frente da pizzaria';
            
            listCtt.add(ctt);
        }
        insert listCtt;
        

        for(Integer i = 0; i < 45; i++){
            NotaAcademica__c ntAcMat = new NotaAcademica__c();
            ntAcMat.Name = 'Teste' + i;
            ntAcMat.Disciplina__c = 'Matemática';
            ntAcMat.MagnitudeNota__c = i;
            ntAcMat.Aluno__c = listCtt[i].Id;
            ntAcMat.Turma__c = listCtt[i].Turma__c;
            ntAcMat.Aprovado__c = 'Sim';

            NotaAcademica__c ntAcPor = new NotaAcademica__c();
            ntAcPor.Name = 'Teste' + i;
            ntAcPor.Disciplina__c = 'Língua Portuguesa';
            ntAcPor.MagnitudeNota__c = i;
            ntAcPor.Aluno__c = listCtt[i].Id;
            ntAcPor.Turma__c = listCtt[i].Turma__c;
            ntAcPor.Aprovado__c = 'Sim';



            
            listNtAc.add(ntAcMat);
            listNtAc.add(ntAcPor);
        }
        insert listNtAc;

        Test.startTest();
            Decimal retorno = AvaliacaoController.contarAlunosAprovados(treinador.Name);
        Test.stopTest();
        
        System.assertEquals(45, retorno);
    }
    @IsTest
    static void testandoPercentControleFrequenciaTrue(){
        Account escola = TestDataFactory.criarEscola('Escola teste');
        Contact treinador = TestDataFactory.criarTreinador('Fitzz');
        Turma__c turma = TestDataFactory.criarTurma('turma teste', treinador.Id, escola.Id);
        Contact aluno = TestDataFactory.criarAluno('Aluno', turma.Id);

        GradeHoraria__c grade = new GradeHoraria__c(
            DiaTreino__c='Terça-feira',
            NomeTurma__c=turma.Id,
            HoraInicio__c=Time.newInstance(0, 2, 2, 0));
        insert grade;

        Chamada__c chamada = new Chamada__c(
            Aluno__c=aluno.Id, 	
            Treinador__c=treinador.Id, 
            Turma__c=turma.Id,
            Data__c=Date.newInstance(2022, 6, 14));
        insert chamada;
        
        Test.startTest();
        Decimal retorno = AvaliacaoController.percentControleFrequencia(treinador.Name, 6, 2022);
        Test.stopTest();

        System.assertEquals(25, retorno);
    }
    @IsTest
    static void testandoPercentControleFrequenciaFalse(){
        Account escola = TestDataFactory.criarEscola('Escola teste');
        Contact treinador = TestDataFactory.criarTreinador('Fitzz');
        Turma__c turma = TestDataFactory.criarTurma('turma teste', treinador.Id, escola.Id);
        Contact aluno = TestDataFactory.criarAluno('Aluno', turma.Id);

        GradeHoraria__c grade = new GradeHoraria__c(
            DiaTreino__c='Terça-feira',
            NomeTurma__c=turma.Id,
            HoraInicio__c=Time.newInstance(0, 2, 2, 0));
        insert grade;   


        Test.startTest();
        Decimal retorno = AvaliacaoController.percentControleFrequencia(treinador.Name, 6, 2022);
        Test.stopTest();

        System.assertEquals(0, retorno);
    }
    @IsTest
    static void testandoPercentControleFrequenciaFalse2(){
        Account escola = TestDataFactory.criarEscola('Escola teste');
        Contact treinador = TestDataFactory.criarTreinador('Fitzz');
        Turma__c turma = TestDataFactory.criarTurma('turma teste', treinador.Id, escola.Id);
        Contact aluno = TestDataFactory.criarAluno('Aluno', turma.Id);

        Chamada__c chamada = new Chamada__c(
            Aluno__c=aluno.Id, 	
            Treinador__c=treinador.Id, 
            Turma__c=turma.Id,
            Data__c=Date.newInstance(2022, 6, 14));
        insert chamada;
        


        Test.startTest();
        Decimal retorno = AvaliacaoController.percentControleFrequencia(treinador.Name, 6, 2022);
        Test.stopTest();

        System.assertEquals(0, retorno);
    }
    
    @IsTest
    static void testContarAlunosComNota(){
        List<Contact> listCtt = new List<Contact>();
        List<NotaAcademica__c> listNtAc = new List<NotaAcademica__c>();
        // #################### CRIANDO ESCOLA ####################
        Account escola = new Account();
        escola.Name = 'Escola de Teste';
        escola.Estado__c = 'SP';
        escola.RecordTypeId = '0124W000000AKveQAG';
        insert escola;

        // #################### CRIANDO TREINADOR ####################
        Contact treinador = new Contact();
        treinador.RecordTypeId = '0124W000001h1GTQAY';
        treinador.AccountId = escola.Id;
        treinador.FirstName = 'Teste';
        treinador.LastName = 'Teste Treinador';
        treinador.Email = 'Treinador@test.com';
        treinador.MailingStreet = 'Rua test';
        treinador.Cpf__c = '00639498060';
        insert treinador;
        
        // #################### CRIANDO TURMA ####################
        Turma__c turma = new Turma__c();
        turma.Name = 'Turma Test';
        turma.NomeEscola__c = escola.Id;
        turma.Treinador__c = treinador.Id;
        insert turma;


        for(Integer i = 0; i < 100; i++){
            // #################### CRIANDO REGISTROS DE ALUNOS ####################
            Contact ctt = new Contact();

            ctt.FirstName = 'Test' + i;
            ctt.LastName = 'Batata' + i;
            ctt.Rg__c = '03983736';
            ctt.NaturalDe__c = 'test' + i;
            ctt.Sexo__c = 'Masculino';
            ctt.RacaCor__c = 'Preto';
            ctt.MobilePhone = '8798768465';
            ctt.EmCasoEmergenciaAvisar__c = 'A ninguem' + i;
            ctt.Phone = '615468426';
            ctt.Ano__c = '1° Ano';
            ctt.Periodo__c = 'Tarde';
            ctt.Birthdate = system.today();
            ctt.DataEntrada__c = system.today();
            ctt.Turma__c = turma.Id;
            ctt.PossuiAlgumaAlergia__c = 'Não' + i;
            ctt.PlanoSaude__c = 'Amil';
            ctt.AlgumaDoencaDeficienciaQual__c = 'Não' + i;
            ctt.TomaRemedioRegularmente__c = 'Não' + i;
            // QUANDO FOR FAZER DEPLOY PARA UAT TROCAR A RendaFamiliarTotal PARA 'até R$ 1.300,00 por mês'
            ctt.RendaFamiliarTotal__c = 'até R$ 1.300,00';
            ctt.QuantasPessoas__c = i;
            ctt.RecebeAlgumAuxilioGoverno__c = 'Sim';
            ctt.NomeReponsavel__c = 'Test' + i;
            ctt.OcupacaoResponsavel__c = 'Pedreiro' + i;
            ctt.GrauParentesco__c = 'Pai';
            ctt.GrauInstrucaoResponsavel__c = 'Analfabeto';
            ctt.RgResponsavel__c = '68465432';
            ctt.CelularResponsavel__c = '6542318' + i;
            ctt.CpfResponsavel__c = '80252435087';
            ctt.Numero__c = '2' + i;
            ctt.Bairro__c = 'Batatinha' + i;
            ctt.MailingStreet = 'Rua Celso de Carvalho';
            ctt.MailingCity = 'Salgado';
            ctt.MailingState = 'SE';
            ctt.MailingPostalCode = '49390000';
            ctt.Complemento__c = 'Frente da pizzaria';
            
            
            listCtt.add(ctt);
        }
        insert listCtt;

        for(Integer i = 0; i < 100; i++){
            
            NotaAcademica__c ntAcMat = new NotaAcademica__c();
            ntAcMat.Name = 'Teste' + i;
            ntAcMat.Disciplina__c = 'Matemática';
            ntAcMat.MagnitudeNota__c = i;
            ntAcMat.Aluno__c = listCtt[i].Id;
            ntAcMat.Turma__c = listCtt[i].Turma__c;

            NotaAcademica__c ntAcPor = new NotaAcademica__c();
            ntAcPor.Name = 'Teste' + i;
            ntAcPor.Disciplina__c = 'Língua Portuguesa';
            ntAcPor.MagnitudeNota__c = i;
            ntAcPor.Aluno__c = listCtt[i].Id;
            ntAcPor.Turma__c = listCtt[i].Turma__c;
            
            listNtAc.add(ntAcMat);
            listNtAc.add(ntAcPor);
        }
        insert listNtAc;
        
        Test.startTest();
            Decimal retorno = AvaliacaoController.contarAlunosComNota(treinador.Name,'Abril');
        Test.stopTest();
        
        System.assertEquals(0, retorno);
    }
    @IsTest
    static void testContarAvaliacaoDiasDaSemanaTrue(){
        Set<Id> setTurmaId = new Set<Id>();

        Account escola = TestDataFactory.criarEscola('Escola teste');
        Contact treinador = TestDataFactory.criarTreinador('Fitzz');
        Turma__c turma = TestDataFactory.criarTurma('turma teste', treinador.Id, escola.Id);
        Contact aluno = TestDataFactory.criarAluno('Aluno', turma.Id);


        setTurmaId.add(turma.Id);

        List<String> lstDias = new List<String>();
        lstDias.add('Segunda-Feira');
        lstDias.add('Terça-Feira');
        lstDias.add('Quarta-Feira');
        lstDias.add('Quinta-Feira');
        lstDias.add('Sexta-Feira');
        lstDias.add('Sábado');
        lstDias.add('Domingo');

        Test.startTest();
        List<String> retorno = AvaliacaoTutorDiasDaSemana.verificaDiasNoMes(5, 2022, lstDIas, setTurmaId);
        Test.stopTest();

        System.assertEquals(31, retorno.size());
    }


    @IsTest
    static void testContarAvaliacaoDiasDaSemanaTrueAlternativo(){
        Set<Id> setTurmaId = new Set<Id>();
        List<Chamada__c> lstChamadas = new List<Chamada__c>();
        Account escola = TestDataFactory.criarEscola('Escola teste');
        Contact treinador = TestDataFactory.criarTreinador('Fitzz');
        Turma__c turma = TestDataFactory.criarTurma('turma teste', treinador.Id, escola.Id);
        Contact aluno = TestDataFactory.criarAluno('Aluno', turma.Id);

        GradeHoraria__c grade = new GradeHoraria__c(
            DiaTreino__c='Terça-feira',
            NomeTurma__c=turma.Id,
            HoraInicio__c=Time.newInstance(0, 2, 2, 0));
        insert grade;

        Chamada__c chamada = new Chamada__c(
            Aluno__c=aluno.Id, 	
            Treinador__c=treinador.Id, 
            Turma__c=turma.Id,
            Data__c=Date.newInstance(2022, 5, 7),
            Ano__c='2022');

        Chamada__c chamada2 = new Chamada__c(
            Aluno__c=aluno.Id, 	
            Treinador__c=treinador.Id, 
            Turma__c=turma.Id,
            Data__c=Date.newInstance(2022, 5, 21),
            Ano__c='2022');

        lstChamadas.add(chamada);
        lstChamadas.add(chamada2);
        insert lstChamadas;


        setTurmaId.add(turma.Id);

        List<String> lstDias = new List<String>();
        lstDias.add('Segunda-Feira');

        Test.startTest();
        List<String> retorno = AvaliacaoTutorDiasDaSemana.verificaDiasNoMes(5, 2022, lstDIas, setTurmaId);
        Test.stopTest();

        System.assertEquals(7, retorno.size());
    }
}
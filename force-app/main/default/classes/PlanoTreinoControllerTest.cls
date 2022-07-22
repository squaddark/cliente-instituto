@IsTest
private class PlanoTreinoControllerTest {
    @IsTest
    static void testandoSalvarPlano(){
        Account objEscola = new Account(Name = 'Supera', Numero__c = '123', NomeResponsavelEntidade__c = 'José', Site = 'Teste', NumberOfEmployees = 23, Type = 'Estadual');
        insert objEscola;
        
        Turma__c objTurma = new Turma__c(
            Name = 'NomeTurmaTeste',
            NomeEscola__c = objEscola.Id
        );

        insert objTurma;


        String plano = '{"DataPlano":"2022-01-11","Tipo":"Reunião","Objetivo":"teste","Turma": "' + objTurma.Id + '"}';
        String classificacao = '[{"Id": "","Dimensao":"DESENVOLVIMENTO SOCIOEMOCIONAL","Estrutura":"","Tipo":"","Conteudo":"","Complemento":null},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}]';
        String planoAtividade = '[{"Id": "", "Tipo":"Roda inicial"},{"Id": "", "Tipo":"Jogos de criatividade"},{"Id": "", "Tipo":"Desafios coordenativos"},{"Id": "", "Tipo":"Desafios técnico-táticos e socioemocionais"},{"Id": "", "Tipo":"Jogos reduzidos e jogo formal"},{"Id": "", "Tipo":"Roda final"}]';

        Test.startTest();
        Boolean retorno = PlanoTreinoController.salvarPlano(plano, classificacao, planoAtividade);
        Test.stopTest();

    }

    @IsTest
    static void testandoBuscarPlano(){
        Account objEscola = new Account(Name = 'Supera', Numero__c = '123', NomeResponsavelEntidade__c = 'José', Site = 'Teste', NumberOfEmployees = 23, Type = 'Estadual');
        insert objEscola;
        
        Turma__c objTurma = new Turma__c(
            Name = 'NomeTurmaTeste',
            NomeEscola__c = objEscola.Id
        );

        insert objTurma;

        String plano = '{"DataPlano":"2022-01-11","Tipo":"Reunião","Objetivo":"teste","Turma":"'+ objTurma.Id + '"}';
        String classificacao = '[{"Dimensao":"DESENVOLVIMENTO SOCIOEMOCIONAL","Estrutura":"","Tipo":"","Conteudo":"","Complemento":null},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}]';
        String planoAtividade = '[{"Tipo":"Roda inicial"},{"Tipo":"Jogos de criatividade"},{"Tipo":"Desafios coordenativos"},{"Tipo":"Desafios técnico-táticos e socioemocionais"},{"Tipo":"Jogos reduzidos e jogo formal"},{"Tipo":"Roda final"}]';

        PlanoTreinoController.salvarPlano(plano, classificacao, planoAtividade);

        Test.startTest();
        PlanoTreinoController.PlanoTreinoTO retorno = PlanoTreinoController.buscarPlano('2022-01-11', objTurma.Id);
        Test.stopTest();


        System.assertNotEquals(null, retorno);
    }  
    
    @IsTest
    static void testandoBuscarClassificacao(){
        Test.startTest();
        List<String> retorno = PlanoTreinoBO.getInstance().buscarClassficicacao('DESENVOLVIMENTO ESPORTIVO', '1X0 COM BOLA - ATAQUE', 'TÁTICO');
        Test.stopTest();


        System.assertNotEquals(null, retorno);
    }  
}
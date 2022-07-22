@IsTest
public class PorcentagemPresencaControllerTest {
    @TestSetup
    static void makeData(){
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
            Status__c='Presente',
            Data__c=Date.newInstance(2022, 5, 17));
        insert chamada;
        
    }
    @IsTest
    static void presencaAlunosByTurmaTest(){
        Turma__c turma = [SELECT Id FROM Turma__c LIMIT 1];

        Test.startTest();
        List<porcentagemPresencaBO.AlunoTO> retorno = porcentagemPresencaController.presencaAlunosByTurma('Maio', '2022', turma.Id);
        Test.stopTest();

        System.assertEquals(1, retorno.size());
        System.assertEquals('aluno Aluno', retorno[0].nome);
    }
    @IsTest
    static void buscaDiasAulasTest(){
        Turma__c turma = [SELECT Id FROM Turma__c LIMIT 1];
        GradeHoraria__c grade = new GradeHoraria__c(
            DiaTreino__c='Segunda-feira',
            NomeTurma__c=turma.Id,
            HoraInicio__c=Time.newInstance(0, 2, 2, 0));
        insert grade;
        GradeHoraria__c grade1 = new GradeHoraria__c(
            DiaTreino__c='Quarta-feira',
            NomeTurma__c=turma.Id,
            HoraInicio__c=Time.newInstance(0, 2, 2, 0));
        insert grade1;
        GradeHoraria__c grade2 = new GradeHoraria__c(
            DiaTreino__c='Quinta-feira',
            NomeTurma__c=turma.Id,
            HoraInicio__c=Time.newInstance(0, 2, 2, 0));
        insert grade2;
        GradeHoraria__c grade4 = new GradeHoraria__c(
            DiaTreino__c='Sexta-feira',
            NomeTurma__c=turma.Id,
            HoraInicio__c=Time.newInstance(0, 2, 2, 0));
        insert grade4;
        GradeHoraria__c grade5 = new GradeHoraria__c(
            DiaTreino__c='Sábado',
            NomeTurma__c=turma.Id,
            HoraInicio__c=Time.newInstance(0, 2, 2, 0));
        insert grade5;
        GradeHoraria__c grade7 = new GradeHoraria__c(
            DiaTreino__c='Domingo',
            NomeTurma__c=turma.Id,
            HoraInicio__c=Time.newInstance(0, 2, 2, 0));
        insert grade7;


        Test.startTest();
        porcentagemPresencaBO.ListaTO retorno = porcentagemPresencaController.buscaDiasAulas('Maio', '2022', turma.Id);
        Test.stopTest();

        System.assertEquals(31, retorno.lista.size());
    }
    @IsTest
    static void buscaTotaisTest(){
        Turma__c turma = [SELECT Id FROM Turma__c LIMIT 1];

        Test.startTest();
        List<porcentagemPresencaBO.ListaTO> retorno = porcentagemPresencaController.buscaTotais('Maio', '2022', turma.Id);
        Test.stopTest();

        System.assertEquals(3, retorno.size());
        System.assertEquals('Total de presenças/dia', retorno[0].titulo);
        System.assertEquals('Total de faltas/dia', retorno[1].titulo);
        System.assertEquals('% de presença', retorno[2].titulo);
    }
}
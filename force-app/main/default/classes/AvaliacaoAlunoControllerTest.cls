@IsTest
public class AvaliacaoAlunoControllerTest {
    @IsTest
    static void avaliarAlunoVerde(){
        Account objEscola = TestDataFactory.criarEscola('Escola teste');
        Contact objTreinador = TestDataFactory.criarTreinador('Fitzz');
        Turma__c objTurma = TestDataFactory.criarTurma('turma teste', objTreinador.Id, objEscola.Id);
        Contact objAluno = TestDataFactory.criarAluno('Aluno', objTurma.Id);

        AvaliacaoEsportivaSocioemocional__c objAvaliacaoEsportiva = new AvaliacaoEsportivaSocioemocional__c(
            Turma__c=objTurma.Id, 
            Aluno__c=objAluno.Id, 
            Tipo_de_Avaliacao__c='Diagnóstica',
            RecordTypeId = Util.getRecordTypeId('AvaliacaoEsportivaSocioEmocional__c', 'Esportivo'),
            DefensorNaBolaA3__c  = 1,
            DefensorForaDaBolaA3__c   = 1,
            ConceitosOfensivoseDefensivosA3__c  = 1,
            AtacanteComBolaA3__c   = 1,
            AtacanteSemBolaA3__c   = 1,
            TecnicaIndividualA3__c  = 1,
            AnoBaseEsportivo__c = '2022',
            Periodo_de_Avaliacao__c = '1ª Avaliação'
        );
        insert objAvaliacaoEsportiva;

        AvaliacaoEsportivaSocioemocional__c objAvaliacaoSocioEmocional = new AvaliacaoEsportivaSocioemocional__c(
            Turma__c=objTurma.Id, 
            Aluno__c=objAluno.Id, 
            Tipo_de_Avaliacao__c='Diagnóstica',
            RecordTypeId = Util.getRecordTypeId('AvaliacaoEsportivaSocioEmocional__c', 'Socioemocional'),
            Autoconfianca__c = 1,
            Empatia__c = 1,
            Honestidade__c = 1,
            Respeito__c = 1,
            Autonomia__c = 1,
            Responsabilidade__c = 1,
            Autocontrole__c  = 1,
            Tomada_de_decisao__c = 1,
            Comunicacao__c  = 1,
            Cooperacao__c = 1,
            Persistencia__c  = 1,
            Resiliencia__c = 1,
            AnoBaseEsportivo__c = '2022',
            Periodo_de_Avaliacao__c = '1ª Avaliação'
        );

        insert objAvaliacaoSocioEmocional;

        Test.startTest();
        AvaliacaoAlunoBO.AvaliacaoAnualTO retorno = AvaliacaoAlunoController.avaliarAluno(objAluno.Id, '2022');
        Test.stopTest();

        System.assertEquals('verde', retorno.ResultadoEsportiva);
        System.assertEquals('azul', retorno.ResultadoSocioemocional);
    }

    @IsTest
    static void avaliarAlunoLaranja(){
        Account objEscola = TestDataFactory.criarEscola('Escola teste');
        Contact objTreinador = TestDataFactory.criarTreinador('Fitzz');
        Turma__c objTurma = TestDataFactory.criarTurma('turma teste', objTreinador.Id, objEscola.Id);
        Contact objAluno = TestDataFactory.criarAluno('Aluno', objTurma.Id);

        AvaliacaoEsportivaSocioemocional__c objAvaliacaoEsportiva = new AvaliacaoEsportivaSocioemocional__c(
            Turma__c=objTurma.Id, 
            Aluno__c=objAluno.Id, 
            Tipo_de_Avaliacao__c='Diagnóstica',
            RecordTypeId = Util.getRecordTypeId('AvaliacaoEsportivaSocioEmocional__c', 'Esportivo'),
            DefensorNaBolaA3__c  = 50,
            DefensorForaDaBolaA3__c  = 50,
            ConceitosOfensivoseDefensivosA3__c  = 50,
            AtacanteComBolaA3__c   = 50,
            AtacanteSemBolaA3__c   = 50,
            TecnicaIndividualA3__c  = 50,
            AnoBaseEsportivo__c = '2022',
            Periodo_de_Avaliacao__c = '1ª Avaliação'
        );
        insert objAvaliacaoEsportiva;

        AvaliacaoEsportivaSocioemocional__c objAvaliacaoSocioEmocional = new AvaliacaoEsportivaSocioemocional__c(
            Turma__c=objTurma.Id, 
            Aluno__c=objAluno.Id, 
            Tipo_de_Avaliacao__c='Diagnóstica',
            RecordTypeId = Util.getRecordTypeId('AvaliacaoEsportivaSocioEmocional__c', 'Socioemocional'),
            Autoconfianca__c = 5,
            Empatia__c = 3,
            Honestidade__c = 8,
            Respeito__c = 8,
            Autonomia__c = 4,
            Responsabilidade__c = 6,
            Autocontrole__c  = 7,
            Tomada_de_decisao__c = 6,
            Comunicacao__c  = 4,
            Cooperacao__c = 5,
            Persistencia__c  = 5,
            Resiliencia__c = 7,
            AnoBaseEsportivo__c = '2022',
            Periodo_de_Avaliacao__c = '1ª Avaliação'
        );

        insert objAvaliacaoSocioEmocional;

        Test.startTest();
        AvaliacaoAlunoBO.AvaliacaoAnualTO retorno = AvaliacaoAlunoController.avaliarAluno(objAluno.Id, '2022');
        Test.stopTest();

        System.assertEquals('azul', retorno.ResultadoEsportiva);
    }
}
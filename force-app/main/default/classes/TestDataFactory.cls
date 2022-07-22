@isTest
public class TestDataFactory{
    public static Account criarEscola(String nome){
        Account escola = new Account(
            Name=nome, 
            RecordTypeId='0124W000000AKveQAG', 
            Estado__C='SP');
        insert escola;
        return escola;
    }
    public static Contact criarTreinador(String lastName){
        Contact treinador = new Contact(
            FirstName='tutor',
            LastName=lastName, 
            RecordTypeId = '0124W000001h1GTQAY', 
            Email='teste@tutor.com',
            MailingStreet = 'teste');
        insert treinador;
        return treinador;
    }
    public static Turma__c criarTurma(String nome, String treinadorId, String escolaId){
        Turma__C turma = new Turma__C(
            Name=nome,
            Treinador__c=treinadorId, 
            NomeEscola__c=escolaId);
        insert turma;
        return turma;
    }
    public static Contact criarAluno(String lastName, String turmaId){
        Contact aluno = new Contact(
            FirstName='aluno',
            LastName=lastName, 
            Cpf__c='00000000000',
            Rg__c='000000000',
            Sexo__c='Outros',
            RacaCor__c='Pardo',
            Birthdate=System.today(),
            MobilePhone='11000000000',
            NaturalDe__c='Brasil',
            EmCasoEmergenciaAvisar__c='Mãe',
            Phone='11000000000',
            Ano__c='1° Ensino médio',
            Periodo__c='Tarde',
            DataEntrada__c=System.today()-700,
            Turma__c=turmaId,
            PossuiAlgumaAlergia__c='Não',
            PlanoSaude__c='Amil',
            AlgumaDoencaDeficienciaQual__c='Não',
            TomaRemedioRegularmente__c='Não',
            // QUANDO FOR FAZER DEPLOY PARA UAT TROCAR A RendaFamiliarTotal PARA 'até R$ 1.200 por mês'
            RendaFamiliarTotal__c='até R$ 1.200 por mês',
            QuantasPessoas__c=5,
            RecebeAlgumAuxilioGoverno__c='Não',
            NomeReponsavel__c='Teste',
            OcupacaoResponsavel__c='Teste',
            GrauParentesco__c='Pai',
            GrauInstrucaoResponsavel__c='Ensino médio completo',
            RgResponsavel__c='000000000',
            CelularResponsavel__c='1100000000',
            CpfResponsavel__c='000000000000',
            RecordTypeId = '0124W000001h11kQAA', 
            Email='teste@aluno.com',
            Bairro__c='Limoeiro',
            Numero__c='20',
            MailingStreet='Rua do teste');
        insert aluno;
        return aluno;
    }
    public static AvaliacaoEsportivaSocioemocional__c criarAvaliacao(String turmaId, String alunoId, String recordType){
        AvaliacaoEsportivaSocioemocional__c avaliacao = new AvaliacaoEsportivaSocioemocional__c(
            Turma__c=turmaId, 
            Aluno__c=alunoId, 
            Tipo_de_Avaliacao__c='Diagnóstica',
            RecordTypeId = RecordType);
        return avaliacao;
    }
}
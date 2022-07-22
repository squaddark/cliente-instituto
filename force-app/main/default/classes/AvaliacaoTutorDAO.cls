public without sharing class AvaliacaoTutorDAO {

    private static final AvaliacaoTutorDAO instance = new AvaliacaoTutorDAO();

    public static AvaliacaoTutorDAO getInstance(){
        return instance;
    }

    public List<AvaliacaoTutor__c> getByTreinadorAndReferencia(Id idTreinador, Date referencia){
        return [
            SELECT  
                Id,
                CodigoTreinador__c, 
                DataPrimeiraVisita__c, 
                DataSegundaVisita__c, 
                MesReferencia__c,
                Name,
                IndiceAproveitamento__c,
                Observacoes__c
            FROM 
                AvaliacaoTutor__c
            WHERE 
                CodigoTreinador__c = :idTreinador AND 
                MesReferencia__c =: referencia
        ];
    }

    public List<RespostasAvaliacaoTutor__c> getRespostasAvaliacaoByIdAvaliacao(Id idAvaliacao){
        return [
            SELECT 
                Id, 
                AvaliacaoTutor__c,
                Categoria__c, 
                Dimensao__c, 
                Indicador__c, 
                Parametros__c, 
                Sequencia__c,
                ValorResposta__c
            FROM
                RespostasAvaliacaoTutor__c
            WHERE 
                AvaliacaoTutor__c = :idAvaliacao
        ];
    }
    
    public List<Turma__c> getQuantidadeAlunosTurmas(String codTreinador){
        return [
            SELECT 
                Id, 
                (SELECT Id, Name FROM Contatos__r WHERE RecordType.DeveloperName = 'Aluno') 
            FROM 
                Turma__c 
            WHERE 
                Treinador__c =: codTreinador
        ];
    }
    
    public List<Turma__c> getCadastroAlunos(String codTreinador){
        return [SELECT 
                    (SELECT
                        Name,
                        Cpf__c,
                        Rg__c,
                        UsoImagemAutorizado__c,
                        DeclaracaoSaudeEntregue__c,
                        CodigoContato__c,
                        Email,
                        AccountId,
                        DataSaida__c,
                        MotivoSaida__c,
                        Altura__c,
                        Peso__c,
                        UsoMaos__c,
                        TamanhoCamiseta__c,
                        TamanhoTenis__c,
                        TipoSanguineo__c,
                        OndeFazAcompanhamento__c,
                        VoceTrabalhaOnde__c,
                        Renda__c,
                        TemFilhosQuantos__c,
                        TemParenteParticipanteSuperacao__c,
                        EmQualEscola__c,
                        FazAtividadeOutraInstituicao__c,
                        QualAtividade__c,
                        QualPeriodo__c,
                        CumpriuMedidaSocioEducativa__c,
                        EFederado__c,
                        QualAuxilio__c,
                        EmailRresponsavel__c,
                        NomeResponsavel2__c,
                        GrauParentesco2__c,
                        RGResponsavel2__c,
                        CPFResponsavel2__c,
                        OcupacaoResponsavel2__c,
                        GrauInstrucaoResponsavel2__c,
                        CelularResponsavel2__c,
                        EmailResponsavel2__c,
                        MailingAddress,
                        MailingStreet,
                        MailingCity,
                        MailingState,
                        MailingPostalCode,
                        Complemento__c
                     FROM 
                        Contatos__r
                    WHERE 
                        RecordType.DeveloperName = 'Aluno') 
                FROM 
                    Turma__c 
                WHERE 
                    Treinador__c =: codTreinador];
    }

    public List<AvaliacaoEsportivaSocioemocional__c> getAlunosBYIdAndAvaliacao(Set<Id> setContactId, String tipoRegistro){
        return [
            SELECT 
                Id, 
                Aluno__c,
                Periodo_de_Avaliacao__c,
                NotaEsportivaA1__c,
                NotaEsportiva_A2__c,
                NotaEsportivaA3__c,
                NotaSocioemocionalA1__c,
                NotaSocioemocionalA2__c,
                NotaSocioemocionalA3__c
            FROM 
                AvaliacaoEsportivaSocioemocional__c 
            WHERE 
                Aluno__c in: setContactId AND RecordType.DeveloperName =: tipoRegistro
        ];
    }

    public List<GradeHoraria__c> getGradeHoraria (Set<Id> setIdTurma){
        return [
            SELECT
                Id, 
                DiaTreino__c
            FROM
                GradeHoraria__c
            WHERE
                NomeTurma__c IN: setIdTurma
        ];
    }

    public List<Chamada__c> getChamadaListaPresenca (Set<Id> idTurma, Date dataIni, Date dateFim){
        return [
            SELECT
                Id, 
                Data__c
            FROM
                Chamada__c
            WHERE
                Turma__c IN: idTurma AND
                Data__c >=: dataIni AND
                Data__c <: dateFim
        ];
    }
    public List<Chamada__c> getChamadaListaPresenca (String turma, Date dataIni, Date dateFim){
        return [SELECT Aluno__c FROM Chamada__c WHERE turma__c  =: turma];
    }
 /*    
    public List<NotaAcademica__c> getAlunosBYIdAndNotaAcademica(Set<Id> setContactId){
        return [
            SELECT 
                Id, 
                Aluno__c,
                Disciplina__c,
                MediaAnual4NotasAno__c,
                Aprovado__c
            FROM 
                NotaAcademica__c
            WHERE 
                Aluno__c in: setContactId and Disciplina__c != null and MediaAnual4NotasAno__c !=null
        ];
    }
 */
    public Integer getAlunosAprovados(Set<Id> setContactId){
        System.debug('AvaliacaoTutorDAO.getAlunosAprovados()');
        List<NotaAcademica__c> test = [
            SELECT 
                Aluno__c, Aprovado__c, Disciplina__c
            FROM 
                NotaAcademica__c
            WHERE 
                Aluno__c in :setContactId AND Aprovado__c != null
            ORDER BY 
                Aluno__c];

        if (test.size() == 0) {
            return 0;
        }

        Id verificaAluno = test[0].Aluno__c;
        String verificaAprovado = test[0].Aprovado__c;
        String verificaMateria = test[0].Disciplina__c;

        Integer cont = 1;

        for(Integer i = 1; i < test.size(); i++){
            System.debug(test[i]);
            if (test[i].Aluno__c == verificaAluno  && test[i].Aprovado__c.equals('Sim') && verificaAprovado.equals('Sim') && test[i].Disciplina__c != verificaMateria) {
                System.debug(test[i].Aluno__c + ' APROVADO');
                cont++;
            }

            verificaAluno = test[i].Aluno__c;
            verificaAprovado = test[i].Aprovado__c;
            verificaMateria = test[i].Disciplina__c;
        }

        return cont;
    }
    public List<Contact> getNotas(Set<Id> setContactId, String mesReferencia){
        return [
            select 
                id,
                (select id,disciplina__c,Nota1__c,Nota2__c,Nota3__c,Nota4__c from NotasAcademicas__r) 
            from 
                contact 
            where id in:setContactId
        ];
    }
}
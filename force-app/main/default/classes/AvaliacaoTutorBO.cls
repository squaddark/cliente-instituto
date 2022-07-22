public without sharing class AvaliacaoTutorBO {
    private static final AvaliacaoTutorBO instance = new AvaliacaoTutorBO();

    private AvaliacaoTutorBO() { }

    public static AvaliacaoTutorBO getInstance() {
        return instance;
    }

    public Boolean createAvaliacao(AvaliacaoTutor__c avaliacaoTutor, List<AvaliacaoController.AvaliacaoTutorTO> indicadores){
        Boolean retorno = false;
        List<RespostasAvaliacaoTutor__c> lstRespostasAvaliacaoTutor = new List<RespostasAvaliacaoTutor__c>();

        try {
            upsert avaliacaoTutor;

            for (AvaliacaoController.AvaliacaoTutorTO item : indicadores) {
                RespostasAvaliacaoTutor__c objResposta = new RespostasAvaliacaoTutor__c();
                if(item.Sequencia == '1'){
                    objResposta.Dimensao__c = 'Gestão';
                    objResposta.Categoria__c = 'Turmas';                    
                    objResposta.Indicador__c = 'Turmas';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '2'){
                    objResposta.Dimensao__c = 'Gestão';
                    objResposta.Categoria__c = 'Turmas';                    
                    objResposta.Indicador__c = 'alunos/turmas';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '3'){
                    objResposta.Dimensao__c = 'Gestão';
                    objResposta.Categoria__c = 'Turmas';                    
                    objResposta.Indicador__c = 'Cadastro alunos';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '4'){
                    objResposta.Dimensao__c = 'Gestão';
                    objResposta.Categoria__c = 'Turmas';                    
                    objResposta.Indicador__c = 'Controle de frequência';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '5'){
                    objResposta.Dimensao__c = 'Gestão';
                    objResposta.Categoria__c = 'Avaliações';                    
                    objResposta.Indicador__c = 'Aval esportiva';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '6'){
                    objResposta.Dimensao__c = 'Gestão';
                    objResposta.Categoria__c = 'Avaliações';                    
                    objResposta.Indicador__c = 'Aval socioemocional';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '7'){
                    objResposta.Dimensao__c = 'Gestão';
                    objResposta.Categoria__c = 'Avaliações';                    
                    objResposta.Indicador__c = 'Notas';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '8'){
                    objResposta.Dimensao__c = 'Gestão';
                    objResposta.Categoria__c = 'Avaliações';                    
                    objResposta.Indicador__c = 'Aprovação';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '9'){
                    objResposta.Dimensao__c = 'Gestão';
                    objResposta.Categoria__c = 'Reunião com famílias';                    
                    objResposta.Indicador__c = 'Reunião famílias';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '10'){
                    objResposta.Dimensao__c = 'Gestão';
                    objResposta.Categoria__c = 'Formação';                    
                    objResposta.Indicador__c = 'Tarefas curso';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '11'){
                    objResposta.Dimensao__c = 'Gestão';
                    objResposta.Categoria__c = 'Formação';                    
                    objResposta.Indicador__c = 'Presença encontro';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '12'){
                    objResposta.Dimensao__c = 'Pedagógica';
                    objResposta.Categoria__c = 'Planejamento do semestre';                    
                    objResposta.Indicador__c = 'Planejamento sem';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '13'){
                    objResposta.Dimensao__c = 'Pedagógica';
                    objResposta.Categoria__c = 'Planejamento do semestre';                    
                    objResposta.Indicador__c = 'Passaporte';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '14'){
                    objResposta.Dimensao__c = 'Pedagógica';
                    objResposta.Categoria__c = 'Eventos';                    
                    objResposta.Indicador__c = 'Super Festival';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '15'){
                    objResposta.Dimensao__c = 'Pedagógica';
                    objResposta.Categoria__c = 'Eventos';                    
                    objResposta.Indicador__c = 'Festival Superação';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '16'){
                    objResposta.Dimensao__c = 'Pedagógica';
                    objResposta.Categoria__c = 'Preparação para o treino';                    
                    objResposta.Indicador__c = 'Preparação espaço';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '17'){
                    objResposta.Dimensao__c = 'Pedagógica';
                    objResposta.Categoria__c = 'Preparação para o treino';                    
                    objResposta.Indicador__c = 'Planejamento prévio';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '18'){
                    objResposta.Dimensao__c = 'Pedagógica';
                    objResposta.Categoria__c = 'Preparação para o treino';                    
                    objResposta.Indicador__c = 'Aprendizagem socioemocional';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '19'){
                    objResposta.Dimensao__c = 'Pedagógica';
                    objResposta.Categoria__c = 'Condução do treino';                    
                    objResposta.Indicador__c = 'Estratégias do DNA';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '20'){
                    objResposta.Dimensao__c = 'Pedagógica';
                    objResposta.Categoria__c = 'Condução do treino';                    
                    objResposta.Indicador__c = 'Ambiente positivo';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '21'){
                    objResposta.Dimensao__c = 'Atitudinal';
                    objResposta.Categoria__c = 'Amor';                    
                    objResposta.Indicador__c = 'Autoconfiança';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '22'){
                    objResposta.Dimensao__c = 'Atitudinal';
                    objResposta.Categoria__c = 'Amor';                    
                    objResposta.Indicador__c = 'Empatia';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '23'){
                    objResposta.Dimensao__c = 'Atitudinal';
                    objResposta.Categoria__c = 'Humildade';                    
                    objResposta.Indicador__c = 'Honestidade';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '24'){
                    objResposta.Dimensao__c = 'Atitudinal';
                    objResposta.Categoria__c = 'Humildade';                    
                    objResposta.Indicador__c = 'Respeito';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '25'){
                    objResposta.Dimensao__c = 'Atitudinal';
                    objResposta.Categoria__c = 'Disciplina';                    
                    objResposta.Indicador__c = 'Autonomia';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '26'){
                    objResposta.Dimensao__c = 'Atitudinal';
                    objResposta.Categoria__c = 'Disciplina';                    
                    objResposta.Indicador__c = 'Responsabilidade';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '27'){
                    objResposta.Dimensao__c = 'Atitudinal';
                    objResposta.Categoria__c = 'Coragem';                    
                    objResposta.Indicador__c = 'Autocontrole';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '28'){
                    objResposta.Dimensao__c = 'Atitudinal';
                    objResposta.Categoria__c = 'Coragem';                    
                    objResposta.Indicador__c = 'Tomada de Decisão';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '29'){
                    objResposta.Dimensao__c = 'Atitudinal';
                    objResposta.Categoria__c = 'Espírito de equipe';                    
                    objResposta.Indicador__c = 'Cooperação';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '30'){
                    objResposta.Dimensao__c = 'Atitudinal';
                    objResposta.Categoria__c = 'Espírito de equipe';                    
                    objResposta.Indicador__c = 'Comunicação';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '31'){
                    objResposta.Dimensao__c = 'Atitudinal';
                    objResposta.Categoria__c = 'Superação';                    
                    objResposta.Indicador__c = 'Persistência';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                } else if(item.Sequencia == '32'){
                    objResposta.Dimensao__c = 'Atitudinal';
                    objResposta.Categoria__c = 'Superação';                    
                    objResposta.Indicador__c = 'Resiliência';
                    objResposta.Parametros__c = String.isBlank(item.ValorResposta) ? null : item.ValorResposta;
                    objResposta.ValorResposta__c = String.isNotBlank(item.Resposta) ? Integer.valueOf(item.Resposta) : null;
                    objResposta.Sequencia__c = Decimal.valueOf(item.Sequencia);
                }

                objResposta.AvaliacaoTutor__c = avaliacaoTutor.Id;
                objResposta.Id = String.isNotBlank(item.Codigo) ? item.Codigo : null;

                lstRespostasAvaliacaoTutor.add(objResposta);
            }


            upsert lstRespostasAvaliacaoTutor;
            retorno = true;

        } catch (Exception ex) {
            System.debug('ERROR: ===============>' + ex.getMessage());
        }

        return retorno;
    }

    public List<Integer> contarAlunos(String codTreinador) {
        List<Integer> lReturn = new List<Integer>();
        //Turmas
        Integer lQuantTurmas = 0;
        //Alunos
        Integer lQuantAlunos = 0;

        List<Turma__c> lAlunosTreinador = AvaliacaoTutorDAO.getInstance().getQuantidadeAlunosTurmas(codTreinador);
        System.debug('AvaliacaoTutorDAO.getQuantidadeAlunosTurmas: '+lAlunosTreinador);
        if(lAlunosTreinador != null){
            for(Turma__c lTurma : lAlunosTreinador){
                lQuantTurmas ++;
                lQuantAlunos = lQuantAlunos + lTurma.Contatos__r.size();
            }
        }

        //Retorno
        System.debug('lQuantTurmas: '+lQuantTurmas);
        System.debug('lQuantAlunos: '+lQuantAlunos);

        lReturn.add(lQuantTurmas);
        lReturn.add(lQuantAlunos);
        System.debug('lReturn: '+lReturn);

        return lReturn;
    }

    public Decimal verificarCadastroCompleto(String codTreinador) {
        List<Turma__c> listTurma = AvaliacaoTutorDAO.getInstance().getCadastroAlunos(codTreinador);
        System.debug('AvaliacaoTutorDAO.getCadastroAlunos: '+listTurma);
        if(listTurma.size() == 0){
            return 200;
        }
        Decimal cadastroIncompleto = 0;
        Decimal totalAlunos = 0;

        for (Turma__c item: listTurma) {
            System.debug(item.Contatos__r);
            for(Contact aluno: item.Contatos__r){
                if(aluno.Name == null || aluno.Cpf__c == null || aluno.UsoImagemAutorizado__c == null || aluno.DeclaracaoSaudeEntregue__c == null || aluno.CodigoContato__c == null || aluno.Email == null || aluno.AccountId == null || aluno.DataSaida__c == null || aluno.MotivoSaida__c == null || aluno.Altura__c == null || aluno.Peso__c == null || aluno.UsoMaos__c == null || aluno.TamanhoCamiseta__c == null || aluno.TamanhoTenis__c == null || aluno.TipoSanguineo__c == null || aluno.OndeFazAcompanhamento__c == null || aluno.VoceTrabalhaOnde__c == null || aluno.Renda__c == null || aluno.TemFilhosQuantos__c == null || aluno.TemParenteParticipanteSuperacao__c == null || aluno.EmQualEscola__c == null || aluno.FazAtividadeOutraInstituicao__c == null || aluno.QualAtividade__c == null || aluno.QualPeriodo__c == null || aluno.CumpriuMedidaSocioEducativa__c == null || aluno.EFederado__c == null || aluno.QualAuxilio__c == null || aluno.EmailRresponsavel__c == null || aluno.NomeResponsavel2__c == null || aluno.GrauParentesco2__c == null || aluno.RGResponsavel2__c == null || aluno.CPFResponsavel2__c == null || aluno.OcupacaoResponsavel2__c == null || aluno.GrauInstrucaoResponsavel2__c == null || aluno.CelularResponsavel2__c == null || aluno.EmailResponsavel2__c == null || aluno.MailingAddress == null || aluno.MailingStreet == null || aluno.MailingCity == null || aluno.MailingState == null || aluno.MailingPostalCode == null || aluno.Complemento__c == null){
                    cadastroIncompleto++;
                }
                totalAlunos++;
            }
        }
        if(totalAlunos == 0){
            return 200;
        }

        Decimal desatualizados = (cadastroIncompleto*100)/totalAlunos;
        Decimal porcentagem = 100 - desatualizados;
        
        System.debug('========================='+porcentagem);
        return porcentagem;
    }

    public AvaliacaoController.AvaliacaoTO buscarAvaliacao(Id idTutor, Date dataReferencia){
        AvaliacaoController.AvaliacaoTO objAvaliacaoTO = new AvaliacaoController.AvaliacaoTO();
        System.debug(idTutor + '-' + dataReferencia);
        List<AvaliacaoTutor__c> objAvaliacaoTutor = AvaliacaoTutorDAO.getInstance().getByTreinadorAndReferencia(idTutor, dataReferencia);
        System.debug('AvaliacaoTutorDAO.getByTreinadorAndReferencia: '+objAvaliacaoTutor);
        if(objAvaliacaoTutor.size() > 0 && objAvaliacaoTutor != null){
            objAvaliacaoTO.idAvaliacao = objAvaliacaoTutor[0].Id;
            objAvaliacaoTO.codigoTreinador = objAvaliacaoTutor[0].Id;
            objAvaliacaoTO.dataPrimeiraVisita = String.valueOf(objAvaliacaoTutor[0].DataPrimeiraVisita__c);
            objAvaliacaoTO.dataSegundaVisita = String.valueOf(objAvaliacaoTutor[0].DataSegundaVisita__c);
            objAvaliacaoTO.mesReferencia = String.valueOf(objAvaliacaoTutor[0].MesReferencia__c.month());
            objAvaliacaoTO.anoReferencia = String.valueOf(objAvaliacaoTutor[0].MesReferencia__c.year());
            objAvaliacaoTO.observacoes = objAvaliacaoTutor[0].Observacoes__c;
            
            List<RespostasAvaliacaoTutor__c> lstRespostasAvaliacaoTutor = AvaliacaoTutorDAO.getInstance().getRespostasAvaliacaoByIdAvaliacao(objAvaliacaoTutor[0].Id);
            System.debug('AvaliacaoTutorDAO.getRespostasAvaliacaoByIdAvaliacao: '+lstRespostasAvaliacaoTutor);

            for (RespostasAvaliacaoTutor__c item : lstRespostasAvaliacaoTutor) {
                AvaliacaoController.AvaliacaoTutorTO objAvaliacaoTutorTO = new AvaliacaoController.AvaliacaoTutorTO();
                objAvaliacaoTutorTO.Codigo = item.Id;
                objAvaliacaoTutorTO.Indicador = item.Indicador__c;
                objAvaliacaoTutorTO.Resposta = item.Parametros__c;
                objAvaliacaoTutorTO.ValorResposta = String.valueOf(item.ValorResposta__c);
                objAvaliacaoTutorTO.Sequencia = String.valueOf(item.Sequencia__c);

                objAvaliacaoTO.avaliacaoTutorTO.add(objAvaliacaoTutorTO);
            }
        }       

        return objAvaliacaoTO;
    }
    
    public Decimal contarAvaliacaoEsportiva(String codTreinador, String mesReferencia){
        List<Turma__c> lstAlunosTreinador = AvaliacaoTutorDAO.getInstance().getQuantidadeAlunosTurmas(codTreinador);
        System.debug('AvaliacaoTutorDAO.getQuantidadeAlunosTurmas: '+lstAlunosTreinador);

        if(lstAlunosTreinador.size() == 0){
            return 200;
        }
        Set<Id> setContactId = new Set<Id>();
        Integer quantAlunos = 0;
        for (Turma__c turma : lstAlunosTreinador) {
            for (Contact contato : turma.Contatos__r) {  
                quantAlunos += 1;
                setContactId.add(contato.Id);
            }
        }
        
        if(quantAlunos == 0){
            return 200;
        }

        List<AvaliacaoEsportivaSocioemocional__c> listAlunosComAvaliacao = AvaliacaoTutorDAO.getInstance().getAlunosBYIdAndAvaliacao(setContactId, 'Esportivo');
        integer alunosComAvaliacao = 0;

        for(AvaliacaoEsportivaSocioemocional__c item: listAlunosComAvaliacao){
            switch on mesReferencia {
                when '04'{
                    if (item.Periodo_de_Avaliacao__c.equals('1ª Avaliação')) {
                        alunosComAvaliacao++;
                    }
                }
                when '08'{
                    if (item.Periodo_de_Avaliacao__c.equals('2ª Avaliação')) {
                        alunosComAvaliacao++;
                    }
                }
                when '11'{
                    if (item.Periodo_de_Avaliacao__c.equals('3ª Avaliação')) {
                        alunosComAvaliacao++;
                    }
                }
            } 
        }

        Decimal porcentagem = alunosComAvaliacao*(100/quantAlunos);
    
        return porcentagem;
    }

    public Decimal contarAvaliacaoSocioemocional(String codTreinador, String mesReferencia){
        List<Turma__c> lstAlunosTreinador = AvaliacaoTutorDAO.getInstance().getQuantidadeAlunosTurmas(codTreinador);
        System.debug('AvaliacaoTutorDAO.getQuantidadeAlunosTurmas: '+lstAlunosTreinador);

        if(lstAlunosTreinador.size() == 0){
            return 200;
        }
        Set<Id> setContactId = new Set<Id>();
        Integer quantAlunos = 0;
        for (Turma__c turma : lstAlunosTreinador) {
            for (Contact contato : turma.Contatos__r) {  
                quantAlunos += 1;
                setContactId.add(contato.Id);
            }
        }
        if(quantAlunos == 0){
            return 200;
        }
        
        List<AvaliacaoEsportivaSocioemocional__c> listAlunosComAvaliacao = AvaliacaoTutorDAO.getInstance().getAlunosBYIdAndAvaliacao(setContactId, 'Socioemocional');
        integer alunosComAvaliacao = 0;

        for(AvaliacaoEsportivaSocioemocional__c item: listAlunosComAvaliacao){
            switch on mesReferencia {
                when '04'{
                    if (item.Periodo_de_Avaliacao__c.equals('1ª Avaliação')) {
                        alunosComAvaliacao++;
                    }
                }
                when '08'{
                    if (item.Periodo_de_Avaliacao__c.equals('2ª Avaliação')) {
                        alunosComAvaliacao++;
                    }
                }
                when '11'{
                    if (item.Periodo_de_Avaliacao__c.equals('3ª Avaliação')) {
                        alunosComAvaliacao++;
                    }
                }
            } 
        }

        // System.debug('AvaliacaoTutorDAO.getAlunosBYIdAndAvaliacao: '+batata);

        Decimal porcentagem = alunosComAvaliacao*(100/quantAlunos);
    
        return porcentagem;
    }

    public Decimal percentControleFrequencia(String codTreinador, Integer mesReferencia, Integer anoReferencia){
        String lData = (anoReferencia+'-'+mesReferencia+'-01');
        Date lDataIni = Date.valueOf(lData);
        Date lDataFim = lDataIni.addMonths(1);
        Set<Id> idTurmas = new Set<Id>();
        List<String> lstDIas = new List<String>();

        List<Turma__c> lTurmas = AvaliacaoTutorDAO.getInstance().getQuantidadeAlunosTurmas(codTreinador);
        System.debug('AvaliacaoTutorDAO.getQuantidadeAlunosTurmas: '+lTurmas);

        if(lturmas.size() == 0){
            return 200;
        }
        for(Turma__c ltu : lTurmas){
            idTurmas.add(ltu.Id);
        }
        List<GradeHoraria__c> lGradeHoraria = AvaliacaoTutorDAO.getInstance().getGradeHoraria(idTurmas);
        System.debug('AvaliacaoTutorDAO.getGradeHoraria: '+lGradeHoraria);

        if(lGradeHoraria.size() == 0){
            return 0;
        }
        for(GradeHoraria__c grade : lGradeHoraria){
            lstDIas.add(grade.DiaTreino__c);
        }
        List<String> lstDatasAulas = AvaliacaoTutorDiasDaSemana.verificaDiasNoMes(mesReferencia, anoReferencia, lstDIas, idTurmas);
        List<Chamada__c> lChamada =  AvaliacaoTutorDAO.getInstance().getChamadaListaPresenca (idTurmas, lDataIni, lDataFim);
        System.debug('AvaliacaoTutorDAO.getChamadaListaPresenca: '+lChamada);

        Integer chamadasRealizadas = 0;
        for(String dataAula : lstDatasAulas){
            for (Chamada__C chamada : lChamada) {
                if(dataAula == String.valueOf(chamada.Data__c.day())){
                    chamadasRealizadas+=1;
                    break;
                }
            }
            
        }
        Decimal retorno = chamadasRealizadas*(100/lstDatasAulas.size());
        return retorno;
    }

    public Decimal contarAlunosAprovados(String codTreinador){
        List<Turma__c> lstAlunosTreinador = AvaliacaoTutorDAO.getInstance().getQuantidadeAlunosTurmas(codTreinador);
        System.debug('AvaliacaoTutorDAO.getQuantidadeAlunosTurmas: '+lstAlunosTreinador);

        if(lstAlunosTreinador.size() == 0){
            return 200;
        }
        System.debug('lstAlunoa: '+lstAlunosTreinador);
        Set<Id> setContactId = new Set<Id>();
        Integer quantAlunos = 0;
        for (Turma__c turma : lstAlunosTreinador) {
            for (Contact contato : turma.Contatos__r) {  
                quantAlunos += 1;
                setContactId.add(contato.Id);
            }
        }
        if(quantAlunos == 0){
            return 200;
        }

        Integer alunosComAvaliacaoAprovada =  AvaliacaoTutorDAO.getInstance().getAlunosAprovados(setContactId);
        System.debug('AvaliacaoTutorDAO.getAlunosAprovados: '+alunosComAvaliacaoAprovada);

        if(alunosComAvaliacaoAprovada == 0){
            return 0;
        }
        
        Decimal porcentagem = alunosComAvaliacaoAprovada*(100/quantAlunos);
        System.debug('set: '+setContactId);
        System.debug('QUANTIDADE DE ALUNOS: '+quantAlunos);
        System.debug('QUANTIDADE DE ALUNOS COM AVALIAÇÃO APROVADA: '+alunosComAvaliacaoAprovada);
        System.debug('PORCENTAGEM: '+porcentagem);
    
        return porcentagem;
    }
    
    public Decimal contarAlunosComNota(String codTreinador, String mesReferencia){
        List<Turma__c> lstAlunosTreinador = AvaliacaoTutorDAO.getInstance().getQuantidadeAlunosTurmas(codTreinador);
        System.debug('AvaliacaoTutorDAO.getQuantidadeAlunosTurmas: '+lstAlunosTreinador);

        if(lstAlunosTreinador.size() == 0){
            return 200;
        }
        Set<Id> setContactId = new Set<Id>();
        Integer quantAlunos = 0;
        for (Turma__c turma : lstAlunosTreinador) {
            for (Contact contato : turma.Contatos__r) {  
                quantAlunos += 1;
                setContactId.add(contato.Id);
            }
        }

        if(quantAlunos == 0){
            return 200;
        }
        
       list <contact> numeroDeAvaliacoes = AvaliacaoTutorDAO.getInstance().getNotas(setContactId, mesReferencia);
       System.debug('AvaliacaoTutorDAO.getNotas: '+numeroDeAvaliacoes);
        
        integer alunosComAmbas = 0;
	
      for (Contact avaliacoes: numeroDeAvaliacoes){
        integer port =0;
        integer mat =0;
        integer mesDaNota = 0;
          for (NotaAcademica__c notas : avaliacoes.NotasAcademicas__r){
              if (notas.Disciplina__c == 'Matemática'){
                  mat++;
              }
			 else if (notas.Disciplina__c == 'Língua Portuguesa'){
                  port++;
              }
          }
          if (mat == port){
            switch on mesReferencia {
                when '04'{
                    alunosComAmbas++;
                }
                when '06'{
                    alunosComAmbas++;
                }
                when '09'{
                    alunosComAmbas++;
            }
                when '11'{
                    alunosComAmbas++;
                }
            } 
          }
        }
        Decimal porcentagem = alunosComAmbas*(100/quantAlunos);
        Integer alunosComNota =  numeroDeAvaliacoes.size();

        if(alunosComNota == 0){
            return 0;
        }
        
       
        System.debug('set: '+setContactId);
        System.debug('QUANTIDADE DE ALUNOS: '+quantAlunos);
        System.debug('QUANTIDADE DE NOTAS: '+alunosComNota);
        System.debug('PORCENTAGEM: '+porcentagem);
        System.debug('alunos'+alunosComAmbas);
      
        return porcentagem;
    }
}
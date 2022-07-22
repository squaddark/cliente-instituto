public with sharing class PlanoTreinoPDFController {
    public PlanoTreinoPDFController(ApexPages.StandardController sc) {
        Id idPlanoTreino = sc.getId();

        PlanoTreino__c objPlanoTreino = PlanoTreinoDAO.getInstance().getById(idPlanoTreino);

        objetivo = objPlanoTreino.Objetivo__c;
        tipoTreino = objPlanoTreino.TipoTreino__c;
        idPlanoTreino = objPlanoTreino.Id;
        nomePlano = objPlanoTreino.Name;
        dataPlano = objPlanoTreino.Data__c.day() + '/' + objPlanoTreino.Data__c.month() + '/' + objPlanoTreino.Data__c.year();

        Turma__c objTurma = turmaDAO.buscarTurma(objPlanoTreino.Turma__c);
        escola = AccountDAO.getInstance().getById(objTurma.NomeEscola__c).Name;
        treinador = contactDAO.getById(objTurma.Treinador__c).Name;

        planoTreino = new PlanoTreinoController.PlanoTreinoTO();
        for (ConteudoAplicado__c objConteudoAplicado : ConteudoAplicadoDAO.getInstance().getByPlanoTreino(idPlanoTreino)) {
            PlanoTreinoController.ClassificacaoTO objClassificacao = new PlanoTreinoController.ClassificacaoTO();
            objClassificacao.Estrutura = objConteudoAplicado.Estrutura__c;
            objClassificacao.Dimensao = objConteudoAplicado.Dimensao__c;
            objClassificacao.Tipo = objConteudoAplicado.Tipo__c;
            objClassificacao.Conteudo = objConteudoAplicado.Conteudo__c;
            objClassificacao.Complemento = objConteudoAplicado.ComplementoConteudo__c == null ? 'N/A' : objConteudoAplicado.ComplementoConteudo__c;

            planoTreino.classificacao.add(objClassificacao);
        }

        for (PlanoAtividade__C objPlanoAtividade : PlanoAtividadeDAO.getInstance().getByPlanoTreino(idPlanoTreino)) {
            PlanoTreinoController.PlanoAtividadeTO objPlanoAtividadeTO = new PlanoTreinoController.PlanoAtividadeTO();
            objPlanoAtividadeTO.Atividade = objPlanoAtividade.Atividade__c;
            objPlanoAtividadeTO.TempoPlanejado = String.valueOf(objPlanoAtividade.TempoPlanejado__c);
            objPlanoAtividadeTO.TempoRealizado = String.valueOf(objPlanoAtividade.TempoRealizado__c);
            objPlanoAtividadeTO.Tipo = objPlanoAtividade.Tipo__c;

            planoTreino.atividade.add(objPlanoAtividadeTO);
        }


    }

    public PlanoTreinoPDFController() {
        // Id idTurma = Id.valueOf(ApexPages.currentPage().getParameters().get('id'));
        // Id idPlanoTreino;

        // String day = ApexPages.currentPage().getParameters().get('data').subString(0,2);
        // String month = ApexPages.currentPage().getParameters().get('data').subString(2,4);
        // String year = ApexPages.currentPage().getParameters().get('data').subString(4,8);

        // dataPlano = day + '/' + month + '/' + year;
        // Date data = Date.parse(dataPlano);

        // List<PlanoTreino__c> lstPlanoTreino = PlanoTreinoDAO.getInstance().getByDataAndTurma(data, idTurma);

        // for (PlanoTreino__c objPlanoTreino : lstPlanoTreino) {
        //     objetivo = objPlanoTreino.Objetivo__c;
        //     tipoTreino = objPlanoTreino.TipoTreino__c;
        //     idPlanoTreino = objPlanoTreino.Id;
        //     nomePlano = objPlanoTreino.Name;
        // }

        // Turma__c objTurma = turmaDAO.buscarTurma(idTurma);
        // escola = AccountDAO.getInstance().getById(objTurma.NomeEscola__c).Name;
        // treinador = contactDAO.getById(objTurma.Treinador__c).Name;

        // planoTreino = new PlanoTreinoController.PlanoTreinoTO();
        // for (ConteudoAplicado__c objConteudoAplicado : ConteudoAplicadoDAO.getInstance().getByPlanoTreino(idPlanoTreino)) {
        //     PlanoTreinoController.ClassificacaoTO objClassificacao = new PlanoTreinoController.ClassificacaoTO();
        //     objClassificacao.Estrutura = objConteudoAplicado.Estrutura__c;
        //     objClassificacao.Dimensao = objConteudoAplicado.Dimensao__c;
        //     objClassificacao.Tipo = objConteudoAplicado.Tipo__c;
        //     objClassificacao.Conteudo = objConteudoAplicado.Conteudo__c;
        //     objClassificacao.Complemento = objConteudoAplicado.ComplementoConteudo__c == null ? 'N/A' : objConteudoAplicado.ComplementoConteudo__c;

        //     planoTreino.classificacao.add(objClassificacao);
        // }

        // for (PlanoAtividade__C objPlanoAtividade : PlanoAtividadeDAO.getInstance().getByPlanoTreino(idPlanoTreino)) {
        //     PlanoTreinoController.PlanoAtividadeTO objPlanoAtividadeTO = new PlanoTreinoController.PlanoAtividadeTO();
        //     objPlanoAtividadeTO.Atividade = objPlanoAtividade.Atividade__c;
        //     objPlanoAtividadeTO.TempoPlanejado = String.valueOf(objPlanoAtividade.TempoPlanejado__c);
        //     objPlanoAtividadeTO.TempoRealizado = String.valueOf(objPlanoAtividade.TempoRealizado__c);
        //     objPlanoAtividadeTO.Tipo = objPlanoAtividade.Tipo__c;

        //     planoTreino.atividade.add(objPlanoAtividadeTO);
        // }
    }

    public String dataPlano{get; set;}
    public String objetivo{get; set;}
    public String tipoTreino{get; set;}
    public String escola{get; set;}
    public String treinador{get; set;}
    public String nomePlano{get; set;}
    public PlanoTreinoController.PlanoTreinoTO planoTreino{get; set;}
}
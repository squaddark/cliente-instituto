public class PlanoTreinoBO {
    private static final PlanoTreinoBO instance = new PlanoTreinoBO();

    private PlanoTreinoBO() { }

    public static PlanoTreinoBO getInstance() {
        return instance;
    }

    public PlanoTreinoController.PlanoTreinoTO buscarPlanoTreino(String data, String idTurma){
        PlanoTreinoController.PlanoTreinoTO objPlanoTreinoTO = new PlanoTreinoController.PlanoTreinoTO();
        
        Date dataPlano = Date.valueOf(data);

        List<PlanoTreino__c> lstPlanoTreino = PlanoTreinoDAO.getInstance().getByDataAndTurma(dataPlano, Id.Valueof(idTurma));

        if(lstPlanoTreino.size() > 0){
            objPlanoTreinoTO.plano = new PlanoTreinoController.PlanoTO();
            objPlanoTreinoTO.plano.Id = lstPlanoTreino[0].Id;
            objPlanoTreinoTO.plano.Nome = lstPlanoTreino[0].Name;
            objPlanoTreinoTO.plano.DataPlano = data;
            objPlanoTreinoTO.plano.Objetivo = lstPlanoTreino[0].Objetivo__C;
            objPlanoTreinoTO.plano.Tipo = lstPlanoTreino[0].TipoTreino__c;
            objPlanoTreinoTO.plano.Turma = lstPlanoTreino[0].Turma__c;

            for (ConteudoAplicado__c item : ConteudoAplicadoDAO.getInstance().getByPlanoTreino(lstPlanoTreino[0].Id)) {
                PlanoTreinoController.ClassificacaoTO objClassificacao = new PlanoTreinoController.ClassificacaoTO();
                objClassificacao.Id = item.Id;
                objClassificacao.Dimensao = item.Dimensao__c;
                objClassificacao.Estrutura = item.Estrutura__c;
                objClassificacao.Tipo = item.Tipo__c;
                objClassificacao.Conteudo = item.Conteudo__c;
                objClassificacao.Complemento = item.ComplementoConteudo__c;

                objPlanoTreinoTO.classificacao.add(objClassificacao);
            }

            for (PlanoAtividade__c item : PlanoAtividadeDAO.getInstance().getByPlanoTreino(lstPlanoTreino[0].Id)) {
                PlanoTreinoController.PlanoAtividadeTO objPlanoAtividade = new PlanoTreinoController.PlanoAtividadeTO();
                objPlanoAtividade.Id = item.Id;
                objPlanoAtividade.Tipo = item.Tipo__c;
                objPlanoAtividade.TempoPlanejado = String.valueOf(item.TempoPlanejado__c);
                objPlanoAtividade.TempoRealizado = String.valueOf(item.TempoRealizado__c);
                objPlanoAtividade.Atividade = item.Atividade__c;

                objPlanoTreinoTO.atividade.add(objPlanoAtividade);
            }
        }
        return objPlanoTreinoTO;
    }
    
    public Boolean inserirPlanoTreino(PlanoTreinoController.PlanoTreinoTO planoTreino){
        Boolean retorno = false;
        
        try {
            PlanoTreino__c objPlanoTreino = new PlanoTreino__c(
                Id = planoTreino.Plano.Id == '' ? null : planoTreino.Plano.Id,
                TipoTreino__c = planoTreino.Plano.Tipo,
                Objetivo__c = planoTreino.Plano.Objetivo,
                Data__c = Date.valueof(planoTreino.Plano.DataPlano),
                Turma__c = planoTreino.Plano.Turma != null ? planoTreino.Plano.Turma : '',
                Name = planoTreino.Plano.Nome
            );

            upsert objPlanoTreino;

            List<ConteudoAplicado__c> lstConteudoAplicado = new List<ConteudoAplicado__c>();

            for (PlanoTreinoController.ClassificacaoTO item : planoTreino.classificacao) {
                if(!String.isBlank(item.Dimensao)){
                    ConteudoAplicado__c objConteudoAplicado = new ConteudoAplicado__c();
                    objConteudoAplicado.Id = item.Id;
                    objConteudoAplicado.PlanoTreino__c = objPlanoTreino.Id;
                    objConteudoAplicado.Dimensao__c = item.Dimensao;
                    objConteudoAplicado.Estrutura__c = item.Estrutura;
                    objConteudoAplicado.Tipo__c = item.Tipo;
                    objConteudoAplicado.Conteudo__c = item.Conteudo;
                    objConteudoAplicado.ComplementoConteudo__c = String.isBlank(item.Complemento) ? null : item.Complemento;

                    lstConteudoAplicado.add(objConteudoAplicado);
                }
            }

            upsert lstConteudoAplicado;

            List<PlanoAtividade__c> lstPlanoAtividade = new List<PlanoAtividade__c>();

            for (PlanoTreinoController.PlanoAtividadeTO item : planoTreino.atividade) {
                PlanoAtividade__c objPlanoAtividade = new PlanoAtividade__c();
                objPlanoAtividade.Id = item.Id;
                objPlanoAtividade.PlanoTreino__c = objPlanoTreino.Id;
                objPlanoAtividade.Tipo__c = item.Tipo;
                objPlanoAtividade.TempoPlanejado__c = String.isBlank(item.TempoPlanejado) ? null : Decimal.valueOf(item.TempoPlanejado);
                objPlanoAtividade.TempoRealizado__c = String.isBlank(item.TempoRealizado) ? null : Decimal.valueOf(item.TempoRealizado);
                objPlanoAtividade.Atividade__c = item.Atividade;

                lstPlanoAtividade.add(objPlanoAtividade);
            }

            upsert lstPlanoAtividade;

            retorno = true;
        } catch (Exception ex) {
            System.debug(ex.getMessage());
            retorno = false;
        }

        return retorno;
    }

    public List<String> buscarClassficicacao(String dimensao, String estrutura, String tipo){
        List<String> retorno = new List<String>();

        for (ConteudoAplicado_Setting__mdt item : ConteudoAplicadoDAO.getInstance().getClassificacao(dimensao, estrutura, tipo)) {
            if(!retorno.contains(item.Conteudo__c)){
                retorno.add(item.Conteudo__c);
            }
        }

        return retorno;
    }
}
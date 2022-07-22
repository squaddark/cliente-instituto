public  class porcentagemPresencaController {


    @AuraEnabled
    public static List<porcentagemPresencaBO.AlunoTO> presencaAlunosByTurma(String mes, String ano, String turma){
        List<porcentagemPresencaBO.AlunoTO> retorno = porcentagemPresencaBO.presencaAlunosByTurma(mes, ano, turma);
        return retorno;
    }

    @AuraEnabled
    public static porcentagemPresencaBO.ListaTO buscaDiasAulas(String mes, String ano, String turma){
        porcentagemPresencaBO.ListaTO lstDiasAulas = new porcentagemPresencaBO.ListaTO();

        lstDiasAulas.lista = porcentagemPresencaBO.listarDias(turma, mes, ano);
        
        return lstDiasAulas;
    }

    @AuraEnabled
    public static List<porcentagemPresencaBO.ListaTO> buscaTotais(String mes, String ano, String turma){
        List<porcentagemPresencaBO.ListaTO> lstTotaisTO = new List<porcentagemPresencaBO.ListaTO>();

        lstTotaisTO = porcentagemPresencaBO.listarTotais(turma, mes, ano);
        
        return lstTotaisTO;
    }
    
}
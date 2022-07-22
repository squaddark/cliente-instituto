public class ReportTreinadorBO {
    public static ReportTreinadorBO.ReportTreinadorTO RetornaDadosReport(String userId){
        User usuario = UserDAO.getInstance().getById(userId);
        ReportTreinadorBO.ReportTreinadorTO retorno = new ReportTreinadorBO.ReportTreinadorTO();
        Set<Id> setIdTurma = new Set<Id>();

        if(usuario.ContactId != null){
            List<Turma__c> turmas = turmaDAO.buscarTurmasTreinador(usuario.ContactId);

            for (Turma__c objTurma : turmas) {
                setIdTurma.add(objTurma.Id);
            }

            for (AggregateResult itemTurma : contactDAO.buscarAlunosTurmaBySetId(setIdTurma)) {
                ReportTreinadorBO.TurmaAlunoTO item = new ReportTreinadorBO.TurmaAlunoTO();
                item.turma = String.valueOf(itemTurma.get('Name'));
                item.quantidade = Integer.valueOf(itemTurma.get('expr0'));
                retorno.quantidadeAlunoTurma.add(item);
            }

            for (AggregateResult itemTurma : contactDAO.buscarDesistenciaTurmaBySetId(setIdTurma)) {
                ReportTreinadorBO.TurmaAlunoTO item = new ReportTreinadorBO.TurmaAlunoTO();
                item.turma = String.valueOf(itemTurma.get('Name'));
                item.quantidade = Integer.valueOf(itemTurma.get('expr0'));
                retorno.quantidadeAlunoDesistenciaTurma.add(item);
            }
        }

        return retorno;
    }

    public class ReportTreinadorTO{
        @AuraEnabled
        public List<TurmaAlunoTO> quantidadeAlunoTurma {get; set;}
        public List<TurmaAlunoTO> quantidadeAlunoDesistenciaTurma {get; set;}

        public ReportTreinadorTO(){
            quantidadeAlunoTurma = new List<TurmaAlunoTO>();
            quantidadeAlunoDesistenciaTurma = new List<TurmaAlunoTO>();
        }
    }

    public class TurmaAlunoTO{
        @AuraEnabled
        public String turma{get;set;}
        @AuraEnabled
        public Integer quantidade{get;set;}
    }
}
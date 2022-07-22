public with sharing class AvaliacaoAlunoController {
    @AuraEnabled
    public static AvaliacaoAlunoBO.AvaliacaoAnualTO avaliarAluno(String alunoId, String ano){
        return AvaliacaoAlunoBO.avaliarAluno(alunoId, ano);
    }
}
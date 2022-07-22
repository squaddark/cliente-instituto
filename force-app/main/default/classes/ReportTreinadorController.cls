public class ReportTreinadorController {
    @AuraEnabled
    public static ReportTreinadorBO.ReportTreinadorTO buscarDadosTurmas(String userId){
        System.debug(userId);
        return ReportTreinadorBO.RetornaDadosReport(userId);
    }
}
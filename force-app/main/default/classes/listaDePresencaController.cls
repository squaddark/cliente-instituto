public with sharing class listaDePresencaController {
    
    @AuraEnabled
    public static void saveListaDePresenca(String statusPresenca, String alunoId, String data, String dia, String mes, String ano, String turma){
        Map<String, Chamada__c> mapInicial = buscarChamadaMap(turma, dia, mes, ano);
		String treinador = returnTreinador(turma);
		System.debug(alunoId);
        try {
            data = dia + '/' + mes + '/' + ano;
            Date dataFormatada = Date.parse(data);
            Map<String, String> statusPresencaMap = (Map<String, String>) JSON.deserialize(statusPresenca, Map<String, String>.class);
            Map<String, String> alunoMap = (Map<String, String>) JSON.deserialize(alunoId, Map<String, String>.class);

            if(mapInicial.isEmpty()){
                for(String statusId : statusPresencaMap.keySet()){
                    criarChamada(statusPresencaMap.get(statusId), alunoMap.get(statusId), dataFormatada, ano, turma, treinador);
                }
            } else{ 
                for(String statusId : statusPresencaMap.keySet()){
                    if(mapInicial.get(statusId) != null){
                        mapInicial.get(statusId).Status__c = statusPresencaMap.get(statusId);
                        mapInicial.get(statusId).Data__c = dataFormatada;
                        mapInicial.get(statusId).Ano__c = ano;
                    } else{
                        criarChamada(statusPresencaMap.get(statusId), alunoMap.get(statusId), dataFormatada, ano, turma, treinador);
                    }
                }    
                update mapInicial.values();
            }
            
        }
        catch (DmlException e) {
            System.debug(e.getMessage());
        }
    }

    @AuraEnabled
    public static Map<String, Chamada__c> buscarChamadaMap(String turma, String dia, String mes, String ano){
        Map<String, Chamada__c> mapChamada = new Map<String, Chamada__c>();

        String data = dia + '/' + mes + '/' + ano;
        Date dataFormat = Date.parse(data);

        for(Chamada__c chamada : [SELECT Id, Data__c, Status__c, Turma__c, Aluno__c, Treinador__c FROM Chamada__c WHERE Data__c = :dataFormat AND Turma__c = :turma]){
            mapChamada.put(chamada.Aluno__c, chamada);
        }
        
        return mapChamada;
    }

    @AuraEnabled
    public static List<Chamada__c> buscarChamadaList(String turma, String dia, String mes, String ano){

        String data = dia + '/' + mes + '/' + ano;
        Date dataFormat = Date.parse(data);

        return[
            SELECT 
            Id, 
            Data__c,
            Status__c,
            Turma__c,
            Aluno__c,
            Treinador__c
                FROM Chamada__c
                WHERE Data__c = :dataFormat AND Turma__c = :turma
        ];
    }

    @AuraEnabled
    public static void criarChamada(String status, String aluno, Date data, String ano, String turma, String treinador){
        Chamada__c listChamada = new Chamada__c();

        listChamada.Status__c = status;
        listChamada.Aluno__c = aluno;
        listChamada.Data__c = data;
        listChamada.Ano__c = ano;
        listChamada.Turma__c = turma;
        listChamada.Treinador__c = treinador;
        
        insert listChamada;
    }
	
	@AuraEnabled
	public static Id returnTreinador(String turma){
		Id idTreinador = [SELECT Id, Treinador__c FROM Turma__c WHERE Id = :turma].Treinador__c;
		return idTreinador;
	}
}
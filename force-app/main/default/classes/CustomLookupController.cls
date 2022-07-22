public without sharing class CustomLookupController {
    public CustomLookupController() {

    }
    @AuraEnabled(cacheable = true)
    public static List<SObject> findRecords(String searchKey, String objectName, String searchField, String recordId){
        String key = '%' + searchKey + '%';
        String QUERY = '';
        if(recordId.startsWith('a02')){
            QUERY = 'Select Id, '+searchField+' From '+objectName +' Where '+searchField +' LIKE :key AND TipoCadastro__c = \'Local de treino\'';
        }else {
            QUERY = 'Select Id, '+searchField+' From '+objectName +' Where '+searchField +' LIKE :key AND TipoCadastro__c = \'Cadastro da escola do aluno\'' ;
        }
        
        System.debug(System.LoggingLevel.DEBUG, QUERY);
        System.debug(System.LoggingLevel.DEBUG, QUERY);
        List<SObject> sObjectList = Database.query(QUERY);
        return sObjectList;
    }

    @AuraEnabled(cacheable = false)
    public static Boolean salvar(String recordId, String recordAccount){
        System.debug(recordId);
        System.debug(recordAccount);
        GradeHoraria__c objGradeHoraria = [SELECT Id, Local__c FROM GradeHoraria__c WHERE Id = :recordId];
        Account objAccount = AccountDAO.getInstance().getById(recordAccount);
        System.debug(objGradeHoraria);
        objGradeHoraria.Local__c = objAccount.Id;
        System.debug(objGradeHoraria);

        update objGradeHoraria;

        return true;
    }
}
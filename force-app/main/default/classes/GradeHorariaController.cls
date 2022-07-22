public without sharing class GradeHorariaController {
    @AuraEnabled
    public static Boolean salvar(String recordId, String recordAccount){
        try {
            Account objAccount = AccountDAO.getInstance().getById(recordAccount);

            if(recordId.startsWith('a02')){
                GradeHoraria__c objGradeHoraria = GradeHorariaDAO.getInstance().getById(recordId);
                objGradeHoraria.Local__c = objAccount.Id;
                update objGradeHoraria;
            }else{
                Contact objContact = contactDAO.getById(recordId);
                objContact.AccountId = recordAccount;
                update objContact;
            }
            
            return true;
        } catch (Exception ex) {
            return false;
        }
    }
}
public without sharing class ContactShareBO {

    private static final ContactShareBO instance = new ContactShareBO();

    private ContactShareBO() { }

	public static ContactShareBO getInstance() {
		return instance;
    }

    public void createRelation(List<AccountContactRelation> lstNew, Map<Id, AccountContactRelation> setOld){
        Map<Id, Account> mapAccount = new Map<Id,Account>();
        Map<Id, Contact> mapContact = new Map<Id,Contact>();
        Map<Id, User> mapUser = new Map<Id,User>();
        Map<Id, Contact> mapAlunosEscola = new Map<Id, Contact>();
        List<ContactShare> lstContactShare = new List<ContactShare>();
        
        Map<Id, Id> mapIdsContactAccount = new Map<Id,Id>();

        Set<Id> lstIdAccount = new Set<Id>();
        Set<Id> lstIdContact = new Set<Id>();
        
        for (AccountContactRelation item : lstNew) {
            mapIdsContactAccount.put(item.ContactId, item.AccountId);
            lstIdAccount.add(item.AccountId);
            lstIdContact.add(item.ContactId);
        }
        
		CollectionUtil.carregarMap(mapAlunosEscola, 'AccountId', contactDAO.buscarAlunosByEscola(lstIdAccount));
		CollectionUtil.carregarMap(mapUser, 'ContactId', UserDAO.getInstance().getBySetContactId(lstIdContact));
        
        for (AccountContactRelation item : lstNew) {
            if(String.isNotBlank(item.Roles) && item.Roles.contains('Tutor')){
                for (Contact itemAluno : mapAlunosEscola.values()) {
                    lstContactShare.add(new ContactShare(
                        ContactId = itemAluno.Id, 
                        UserOrGroupId = mapUser.get(item.ContactId).Id,
                        ContactAccessLevel = 'Read',
                        RowCause = 'Manual' 
                    ));
                }
            }
        }

        if(lstContactShare.size() > 0)
        {
            System.debug(lstContactShare);
            // upsert lstContactShare;
        }
    }

    public void removeRelation(List<AccountContactRelation> lstNew, Map<Id, AccountContactRelation> setOld){
        Map<Id, Account> mapAccount = new Map<Id,Account>();
        Map<Id, Contact> mapContact = new Map<Id,Contact>();
        Map<Id, User> mapUser = new Map<Id,User>();
        Map<Id, ContactShare> mapContactShare = new Map<Id,ContactShare>();
        Map<Id, Contact> mapAlunosEscola = new Map<Id, Contact>();
        List<ContactShare> lstContactShareRemove = new List<ContactShare>();
        
        Map<Id, Id> mapIdsContactAccount = new Map<Id,Id>();

        Set<Id> lstIdAccount = new Set<Id>();
        Set<Id> lstIdContact = new Set<Id>();
        Set<Id> lstIdUser = new Set<Id>();
        
        for (AccountContactRelation item : setOld.values()) {
            mapIdsContactAccount.put(item.ContactId, item.AccountId);
            lstIdAccount.add(item.AccountId);
            lstIdContact.add(item.ContactId);
        }
        
		CollectionUtil.carregarMap(mapAlunosEscola, 'AccountId', contactDAO.buscarAlunosByEscola(lstIdAccount));
		CollectionUtil.carregarMap(mapUser, 'ContactId', UserDAO.getInstance().getBySetContactId(lstIdContact));

        for (User itemUser : mapUser.values()) {
            lstIdUser.add(itemUser.Id);
        }

		CollectionUtil.carregarMap(mapContactShare, 'ContactId', ContactShareDAO.getInstance().getBySetContactId(lstIdUser));

        System.debug(mapContactShare);
        
        for (AccountContactRelation item : setOld.values()) {
            if(String.isNotBlank(item.Roles) && item.Roles.contains('Tutor')){
                for (ContactShare itemContactShare : mapContactShare.values()) {
                    System.debug(mapUser);
                    System.debug(item.ContactId);
                    System.debug(itemContactShare);
                    if(itemContactShare.UserOrGroupId.equals(mapUser.get(item.ContactId).Id)){
                        lstContactShareRemove.add(itemContactShare);
                    }
                }
            }
        }

        System.debug(lstContactShareRemove);

        if(lstContactShareRemove.size() > 0)
        {
            // delete lstContactShareRemove;
        }
    }
}
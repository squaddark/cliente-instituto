public without sharing class ContactBO {

    private static final ContactBO instance = new ContactBO();

    private ContactBO() { }

	public static ContactBO getInstance() {
		return instance;
    }

    public void createRelation(List<Contact> lstNew, Map<Id, Contact> setOld){
        Map<Id, Contact> mapContact = new Map<Id,Contact>();
        Set<Id> setIdContact = new Set<Id>();
        Set<Id> setIdEscolas = new Set<Id>();
        Set<Id> setIdTutores = new Set<Id>();
        Map<Id, AccountContactRelation> mapTutores = new Map<Id, AccountContactRelation>();
        Map<Id, User> mapUser = new Map<Id,User>();
        List<ContactShare> lstContactShare = new List<ContactShare>();

        for (Contact item : lstNew) {
            setIdContact.add(item.Id);
        }
        
		CollectionUtil.carregarMap(mapContact, 'Id', contactDAO.getBySetId(setIdContact));
        
        for (Contact item : lstNew) {
            Contact objContact = mapContact.get(item.Id);

            if(objContact.RecordType.Name == 'Aluno'){
                setIdEscolas.add(objContact.Account.Id);
            }
        }

        CollectionUtil.carregarMap(mapTutores, 'AccountId', AccountContactRelationDAO.getInstance().getTutoresFromEscola(setIdEscolas));
        
        for (AccountContactRelation objTutor  : mapTutores.values()) {
            setIdTutores.add(objTutor.ContactId);
        }

		CollectionUtil.carregarMap(mapUser, 'ContactId', UserDAO.getInstance().getBySetContactId(setIdTutores));

        for (Contact item : lstNew) {
            Contact objAluno = mapContact.get(item.Id);

            if(objAluno.RecordType.Name == 'Aluno'){
                AccountContactRelation objTutorEscola = mapTutores.get(objAluno.Account.Id);

                if(objTutorEscola != null){
                    User objUser = mapUser.get(objTutorEscola.ContactId);

                    if(objTutorEscola != null){
                        lstContactShare.add(new ContactShare(
                            ContactId = objAluno.Id, 
                            UserOrGroupId = objUser.Id,
                            ContactAccessLevel = 'Read',
                            RowCause = 'Manual' 
                        ));
                    }
                }
            }
        }

        System.debug(lstContactShare);
        // insert lstContactShare;
    }
}
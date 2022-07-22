public class UserBO {
    private static final UserBO instance = new UserBO();

    private UserBO() { }

	public static UserBO getInstance() {
		return instance;
    }

    public void VincularContas(List<User> lstUser){
        List<User> lstUsersContact = lstUser;
        List<Contact> lstTreinador = contactDAO.getContactCompetitivo();
        List<Account> lstEscolas = AccountDAO.getInstance().getLocaisTreino();
        Map<Id, User> mapUsers = new Map<Id, User>();
        Set<Id> setIdsUsers = new Set<Id>();
        List<AccountContactRelation> lstRelacionamentos = new List<AccountContactRelation>();

        for (User objUser : lstUsersContact) {
            setIdsUsers.add(objUser.Id);
        }

        CollectionUtil.carregarMap(mapUsers, 'Id', UserDAO.getInstance().getBySetId(setIdsUsers));

        for (User objUser : lstUsersContact) {
            Map<Id, AccountContactRelation> mapRelacionamentosExistentes = new Map<Id, AccountContactRelation>();
            User usuario = mapUsers.get(objUser.Id);
            System.debug(usuario.AccountId + ' - ' + usuario.ContactId);
            CollectionUtil.carregarMap(mapRelacionamentosExistentes, 'AccountId',  AccountContactRelationDAO.getInstance().getRelationsFromContact(usuario.ContactId));

            if(usuario.ContactId != null){
                For(Account itemConta : lstEscolas){
                    if(mapRelacionamentosExistentes.get(itemConta.Id) == null){
                        AccountContactRelation rlt = new AccountContactRelation(
                            AccountId = itemConta.Id,
                            ContactId = usuario.ContactId
                        );
                        
                        lstRelacionamentos.Add(rlt);
                    }
                }
            }
        }

        insert lstRelacionamentos;
    }
}
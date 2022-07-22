public class AccountContactRelationDAO {
    private static final AccountContactRelationDAO instance = new AccountContactRelationDAO();

    public static AccountContactRelationDAO getInstance(){
        return instance;
    }

    public List<AccountContactRelation> getRelationsFromContact(Id pContactId){
        return [
            SELECT  
                Id,
                AccountId,
                ContactId
            FROM 
                AccountContactRelation
            WHERE
                ContactID = :pContactId
        ];
    }

    public List<AccountContactRelation> getTutoresFromEscola(Set<Id> pSetIdEscolas){
        return [
            SELECT  
                Id,
                AccountId,
                ContactId
            FROM 
                AccountContactRelation
            WHERE
                AccountId = :pSetIdEscolas AND 
                Roles includes ('Tutor')
        ];
    }
}
public without sharing  class UserDAO {
    private static final UserDAO instance = new UserDAO();

    public static UserDAO getInstance(){
        return instance;
    }

    public User getById(Id pId) {
        List<User> lst = getBySetId(new Set<Id>{ pId });
        return lst.isEmpty() ? null : lst[0];
    }

    public List<User> getBySetId(Set<Id> setIds) {
        return [
            SELECT  
                Id,
                Name,
                AccountId,
                ContactId
            FROM 
                User
            WHERE
                Id IN :setIds
        ];
    }

    public List<User> getBySetContactId(Set<Id> setContactIds) {
        return [
            SELECT  
                Id,
                Name,
                AccountId,
                ContactId
            FROM 
                User
            WHERE
                ContactId IN :setContactIds
        ];
    }
}
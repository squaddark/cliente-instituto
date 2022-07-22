public without sharing  class ContactShareDAO {
    private static final ContactShareDAO instance = new ContactShareDAO();

    public static ContactShareDAO getInstance(){
        return instance;
    }

    public List<ContactShare> getBySetContactId(Set<Id> setIds) {
        return [
            SELECT  
                Id,
                ContactId,
                UserOrGroupId
            FROM 
                ContactShare
            WHERE
                UserOrGroupId IN :setIds AND
                RowCause = 'Manual'
        ];
    }
}
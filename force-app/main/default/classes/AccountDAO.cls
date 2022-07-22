public class AccountDAO {
    private static final AccountDAO instance = new AccountDAO();

    public static AccountDAO getInstance(){
        return instance;
    }

    public Account getById(Id pAccountId) 
    {
        List<Account> listAccount = getBySetId(new Set<Id>{ pAccountId });
        return listAccount.isEmpty() ? null : listAccount[0];
    }

    public List<Account> getBySetId(Set<Id> pSetId) 
    {
        return [
            SELECT  
                Id,
                Name
            FROM 
                Account
            WHERE Id IN :pSetId
            WITH SECURITY_ENFORCED];
    }

    public List<Account> getLocaisTreino(){
        return [
                SELECT 
                    Id, 
                    TipoCadastro__c  
                FROM 
                    Account 
                WHERE 
                    TipoCadastro__c = 'Local de treino' OR TipoCadastro__c = 'Cadastro da escola do aluno'];
    }

    public List<Account> getEscolas(){
        return [
                SELECT 
                    Id, 
                    TipoCadastro__c,
                    Name 
                FROM 
                    Account 
                WHERE 
                    TipoCadastro__c = 'Local de treino' LIMIT 100];
    }
}
@IsTest
public class AccountDAOTest {
    @IsTest
    static void testandoGetById(){
        Account escola = new Account(
            Name = 'Supera', 
            Numero__c = '123', 
            NomeResponsavelEntidade__c = 'José', 
            Site = 'Teste', 
            NumberOfEmployees = 23, 
            Type = 'Estadual'
        );

        insert escola;
        
        Test.startTest();
        Account objAccount = AccountDAO.getInstance().getById(escola.Id);
        Test.stopTest();

        System.assertNotEquals(null, objAccount);
    }
}
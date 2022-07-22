@IsTest
public class UserDAOTest {
    @IsTest
    static void testandoGetById(){
        List<Profile> lstobjProfile = [SELECT Id FROM Profile Limit 1];
        Profile objProfile;

        for (Profile item : lstobjProfile) {
            objProfile = item;
            break;
        }

        User u = new User(
            ProfileId = objProfile.Id,
            LastName = 'last',
            Email = 'puser000@amamama.com',
            Username = 'puser000@amamama.com' + System.currentTimeMillis(),
            CompanyName = 'TEST',
            Title = 'title',
            Alias = 'alias',
            TimeZoneSidKey = 'America/Los_Angeles',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US'
        );

        insert u;

        Test.startTest();
        User objRetorno = UserDAO.getInstance().getById(u.Id);
        Test.stopTest();

        System.assertNotEquals(null, objRetorno);

    }
}
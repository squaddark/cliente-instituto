@IsTest
public class CreateRelationUserTest {
    @IsTest
	static void testandoExecucaoAtualizarUsuarios() {
        String CRON_EXP = '0 0 0 19 5 ? ***'; 

        Test.startTest();
        
        String jobId = System.schedule('testandoExecucaoAtualizarUsuarios', CRON_EXP, new CreateRelationUserSchedule());
        
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId]; 
                
        //Sem Agendamento
        CreateRelationUserSchedule.start();
                       
		Test.stopTest();
       
      	//Verifica se o trabalho não foi executado 
      	System.assertEquals(0, ct.TimesTriggered);         
    }

    @IsTest
	static void testandoAtualizarUsuariosAgendado() {
        //Define data de execução
        String CRON_EXP = '0 0 0 19 5 ? ***';       
        
		Test.startTest();
        
        String jobId = System.schedule('testandoAtualizarUsuariosAgendado', CRON_EXP, new CreateRelationUserSchedule());
        
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId]; 
                
        //Com Agendamento
        CreateRelationUserSchedule.start(CRON_EXP);
                       
		Test.stopTest();
        
      	//Verifica se o trabalho não foi executado 
      	System.assertEquals(0, ct.TimesTriggered);         
    }
}
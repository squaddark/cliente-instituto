global class CreateRelationUserSchedule implements Schedulable 
{
	global static void start() 
    {
		System.schedule(CreateRelationUserSchedule.class.getName() + '-' + System.currentTimeMillis(), '0 53 14 1/1 * ? *', new CreateRelationUserSchedule());
	}

	global static void start(String pCronExp) 
    {
		System.schedule(CreateRelationUserSchedule.class.getName() + '-' + System.currentTimeMillis(), pCronExp, new CreateRelationUserSchedule());
	}
	
    global void execute(SchedulableContext pContext) 
    {
        CreateRelationUserBatch.start();
    }
}
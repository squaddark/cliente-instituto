global without sharing class CreateRelationUserBatch implements Database.Batchable<sObject>, Database.Stateful {

	/**
	 * @Description: Método para iniciar o batch sem especificar o tamanho de cada lote
	 */
	global static void start() {
		Database.executeBatch(new CreateRelationUserBatch());
	}

	global static void start(Integer batchSize) {
		Database.executeBatch(new CreateRelationUserBatch(), batchSize);
	}

    global Database.QueryLocator start(Database.BatchableContext BC) {
		return Database.getQueryLocator('SELECT Id, Name, AccountId, ContactId FROM User WHERE ContactId != \'\'');
    }

	global void execute(Database.BatchableContext BC, List<User> lstSObjUser) { 
       UserBO.getInstance().VincularContas(lstSObjUser);
    }

	global void finish(Database.BatchableContext BC) {}
}
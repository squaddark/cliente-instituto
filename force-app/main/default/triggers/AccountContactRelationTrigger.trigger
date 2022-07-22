trigger AccountContactRelationTrigger on AccountContactRelation (after insert, after delete) {
    new AccountContactRelationTriggerHandler().run();
}
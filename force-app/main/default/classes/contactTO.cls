public with sharing class contactTO {

    @AuraEnabled
    public Id Id { get; set; }

    @AuraEnabled
    public String Ano { get; set; }

    @AuraEnabled
    public String Name { get; set; }

    @AuraEnabled
    public Id Turma { get; set; }

    @AuraEnabled
    public String Presenca { get; set; }

    @AuraEnabled
    public String Porcentagem { get; set; }

    @AuraEnabled
    public Boolean StatusDisabled { get; set;}

}
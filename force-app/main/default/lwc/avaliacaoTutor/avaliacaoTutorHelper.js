({
    CreateAvaliacao : function(component, event, helper) {
        var lJson = '{'+
            '"codigoTreinador" : "' + component.get("v.tipoCaso") + '", '+
            '"primeiraVisita" : "' + component.get("v.motivoCaso") + '", '+
            '"segundaVisita" : "' + component.get("v.descMotivoCaso") + '", '+
            '}';
    },
    UpdateAvaliacao : function(component, event, helper) {
        var lJson = '{'+
        '"id" : "' + component.get("v.tipoCaso") + '", '+
        '"codigoTreinador" : "' + component.get("v.tipoCaso") + '", '+
        '"primeiraVisita" : "' + component.get("v.motivoCaso") + '", '+
        '"segundaVisita" : "' + component.get("v.descMotivoCaso") + '", '+
        '}';
    }   
})
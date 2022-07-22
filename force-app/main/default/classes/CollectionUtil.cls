public class CollectionUtil {

	public static void carregarMap(Map<Id, SObject> mapSObj, String campoChave, List<SObject> lstSObj) {
        Map<Object, SObject> mapAux = carregarMapObject(campoChave, lstSObj);
        
        for(Object chave : mapAux.keySet()){
            mapSObj.put((Id)chave, mapAux.get(chave));
        }
    }

    private static Map<Object, SObject> carregarMapObject(String campoChave, List<SObject> lstSObj){
        Map<Object, SObject> mapSObj = new Map<Object, SObject>();
        String campoPai = null;
        String sObjectPai = null;
        Object chave = null;
        
        for(SObject obj : lstSobj)
        {
            if(campoChave.indexOf('.') > 0){
                List<String> arrObjetoCampo = campoChave.split('\\.');
                sObjectPai = arrObjetoCampo.get(0);
                campoPai = arrObjetoCampo.get(1);
            }

            chave = (sObjectPai == null ? obj.get(campoChave) : obj.getSObject(sObjectPai).get(campoPai));
            mapSObj.put(chave, obj);   
        }

        return mapSObj;
    }
}
public with sharing class Util {
    public static RecordTypeInfo getRecordType(String strSObject, String strRecordTypeName) {
        Map<String, RecordTypeInfo> mapRecordTypeInfo = ((SObject)Type.forName(strSObject).newInstance()).getSObjectType().getDescribe().getRecordTypeInfosByName();        

        for (String strKey : mapRecordTypeInfo.keySet()) {
            RecordTypeInfo objRecordTypeInfo = mapRecordTypeInfo.get(strKey);

            if (objRecordTypeInfo.getDeveloperName() == strRecordTypeName){
                return objRecordTypeInfo;
            }

        }

        return null;
    }

    public static Id getRecordTypeId(String strSObject, String strRecordTypeName){
        RecordTypeInfo objRecordTypeInfo = getRecordType(strSObject, strRecordTypeName);

        if (objRecordTypeInfo != null){
            return objRecordTypeInfo.getRecordTypeId();
        } else {
            return null;
        }
    }
}
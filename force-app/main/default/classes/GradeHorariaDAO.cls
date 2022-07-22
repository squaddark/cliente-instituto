public without sharing class GradeHorariaDAO {
    private static final GradeHorariaDAO instance = new GradeHorariaDAO();

    public static GradeHorariaDAO getInstance(){
        return instance;
    }

    public GradeHoraria__c getById(Id pId){
        return [
                SELECT 
                    Id, 
                    Local__c 
                FROM 
                    GradeHoraria__c 
                WHERE 
                    Id = :pId];
    }
}
public with sharing class ProjectoHelper {
    
    public void updateRequisitosCount(set<string> ReqIDs){
        
        if(ReqIDs == null){
            return;
        }
        
        if(ReqIDs.size() == 0){
            return ;
        }
        
        list<Requisitos_Funcionais__c> ReqList = new list<Requisitos_Funcionais__c>();
        ReqList =[Select ID from Requisitos_Funcionais__c where Projecto__c = :ReqIDs];
    }
    

}
trigger UpdateParentCount on Requisitos_Funcionais__c (after insert, after update, after delete, after undelete) {
    
    List<Projecto__c> ProjectoList = new List<Projecto__c>();
    Set<ID> ReqIds = new Set<ID>();
    
    if(Trigger.isDelete) {
        for(Requisitos_Funcionais__c test:Trigger.Old){
            ReqIds.add(test.Projecto__c);
        }
    }else if(Trigger.isUpdate){
        for(Requisitos_Funcionais__c test:Trigger.New){
            if(test.Projecto__C != null){
              ReqIds.add(test.Projecto__c);  
            } 
        }
        for(Requisitos_Funcionais__c test:Trigger.Old){
             ReqIds.add(test.Projecto__c);
        }
        
    }else{
        for(Requisitos_Funcionais__c test:Trigger.New){
            ReqIds.add(test.Projecto__c);
        }
    }
    
     AggregateResult[] groupedResults =[Select Count(Id), Projecto__c from Requisitos_Funcionais__c where Projecto__c IN :ReqIds Group by Projecto__c ];
    
    for(AggregateResult a:groupedResults) {
        Id PId = (ID)a.get('Projecto__c');
        Integer count = (Integer)a.get('expr0');
        Projecto__c Proj = new Projecto__c();
        Proj.id=PId;
        Proj.N_Requisitos__c = count;
        ProjectoList.add(Proj);
    }
    update ProjectoList;

}
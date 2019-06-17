trigger UpdateNTesteOK on Teste__c (after insert, after update, after delete, after undelete) {
      List<Projecto__c> ProjectoList4 = new List<Projecto__c>();
    Set<ID> TesteIds = new Set<ID>();
    
    if(Trigger.isDelete) {
        for(Teste__c test:Trigger.Old){
            TesteIds.add(test.Projecto__c);
        }
    }else if(Trigger.isUpdate){
        for(Teste__c test:Trigger.New){
            if(test.Projecto__C != null){
             TesteIds.add(test.Projecto__c);  
            } 
        }
        for(Teste__c test:Trigger.Old){
             TesteIds.add(test.Projecto__c);
        }
        
    }else{
        for(Teste__c test:Trigger.New){
           TesteIds.add(test.Projecto__c);
        }
    }
    
     AggregateResult[] groupedResults =[Select Count(Id), Projecto__c from Teste__c where Estado__c='OK' and Projecto__c IN : TesteIds Group by Projecto__c ];
    
    for(AggregateResult a:groupedResults) {
        Id PId = (ID)a.get('Projecto__c');
        Integer count = (Integer)a.get('expr0');
        Projecto__c Proj = new Projecto__c();
        Proj.id=PId;
        Proj.Teste_Ok__c = count;
        ProjectoList4.add(Proj);
    }
    update ProjectoList4;


}
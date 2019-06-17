trigger UpdateNCasoTeste on Casos_de_teste__c (after insert, after update, after delete, after undelete) {
    
  List<Projecto__c> ProjectoList2 = new List<Projecto__c>();
    Set<ID> CasoTesteIds = new Set<ID>();
    
    if(Trigger.isDelete) {
        for(Casos_de_teste__c test:Trigger.Old){
            CasoTesteIds.add(test.Projecto__c);
        }
    }else if(Trigger.isUpdate){
        for(Casos_de_teste__c test:Trigger.New){
            if(test.Projecto__C != null){
              CasoTesteIds.add(test.Projecto__c);  
            } 
        }
        for(Casos_de_teste__c test:Trigger.Old){
             CasoTesteIds.add(test.Projecto__c);
        }
        
    }else{
        for(Casos_de_teste__c test:Trigger.New){
            CasoTesteIds.add(test.Projecto__c);
        }
    }
    
     AggregateResult[] groupedResults =[Select Count(Id), Projecto__c from Casos_de_teste__c where Projecto__c IN : CasoTesteIds Group by Projecto__c ];
    
    for(AggregateResult a:groupedResults) {
        Id PId = (ID)a.get('Projecto__c');
        Integer count = (Integer)a.get('expr0');
        Projecto__c Proj = new Projecto__c();
        Proj.id=PId;
        Proj.N_Casos_de_Teste__c = count;
        ProjectoList2.add(Proj);
    }
    update ProjectoList2;
  

}
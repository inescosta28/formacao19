public class testController {
    
    public String myVar {get; set;}
     public Integer myVarInteger {get; set;}
     
     public Integer myVarInteger2{
     get{return 999;}
     set{myVarInteger=0;}
     }
     
     public String myVar2='myVar2NULL';
     
    public testController(){
       
        myVarInteger=0;
       System.debug('Mensagem do System debug');
        
        myVar='Variavel';
        
        String sid = ApexPages.currentPage().getParameters().get('id');
        if(sid!=null)
        myVar+= 'and ID is' +sid;
        setMyVar2('setMyVar2');
               
        
        // myvar='Variavel';
       // String aid = ApexPages.currentPage().getParameters().get('id');
       // if(aid!=null)
        //    myvar+= 'and ID is '+aid;
    }
    
    
    public void setMyVar2(String myVar){
    
this.myVar2 = myVar;
}

    public string getMyVar2(){
    
    
return myVar2;
}


public PageReference save(){
    myVarInteger+=1;
     setMyVar2('setMyVar2'+myVarInteger);
return null;

}
}
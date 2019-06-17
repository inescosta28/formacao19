public class TestController19 {
    
    public string myVar{get;set;}
    public integer myVarInteger{get;set;}
    
    public integer myVarInteger2 {
        get{return 999;}
        set{ myVarInteger2 = 0;}
    }
    
    public string myVar2 ='myVar2NUL';  
    
    public TestController19(){
        myVarInteger=0; 
        System.debug('Mensagem do SD');
        myVar = 'Variavel';
        
        String sid = ApexPages.currentPage().getParameters().get('id');
        if(sid!=null)
            myVar+='and ID is'+sid;
        
        setmyVar2('setMyVar2');
        
    }
    
    
    
    public void setmyVar2(string myVar){
        this.myVar2= myVar;
      }
    
       
    public string getmyVar2(){
        return myVar2;
    }
        
    public PageReference save(){
        myVarInteger+=1;
        setmyVar2('setmyVar2'+myVarInteger);
        return null;
    }

}
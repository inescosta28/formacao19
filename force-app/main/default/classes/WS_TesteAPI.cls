@RestResource(urlMapping='/opportunities')
global with sharing class WS_TesteAPI {
    @HTTPGet
    global static ResponseMessage getOp(){
        RestRequest req = RestContext.request;
       	RestResponse response = RestContext.response; 
        
        response.addHeader('Content-Type', 'text/plain');
        String aid = req.params.get('id');
        
        // construir o que vamos enviar
        ResponseMessage responseMSG = new ResponseMessage();
        
        //validação
        String xclient = req.headers.get('x-api-client');
        String xKey = req.headers.get('x-api-key');
        String csclient = null;
        String cskey = null;
        
        try{
            API__c cs = API__c.getInstance();
            csclient = cs.Client__C;
            cskey = cs.Key__C;
        }catch (Exception e){
            response.statusCode = 500;
            responseMsg.setCode(-11);
 			responseMsg.setMessage(e.getMessage());
            return responseMsg;
        }
        
        if(xclient == null || xkey == null || csclient != xclient || cskey != xkey){
           response.statusCode = 401;
            responseMsg.setCode(-11);
 			responseMsg.setMessage('Bad credentials');
            return responseMsg; 
        }

        if(aid == null || aid == ''){
             response.statusCode = 401;
            responseMsg.setCode(-3);
 			responseMsg.setMessage('Missing mandatory fields');
            return responseMsg; 
        }        
        
        try{
            List<Opportunity> op_list = [Select id, Amount, ExpectedRevenue from Opportunity where AccountId = :aid];
          
            if(op_list.isEmpty()){
           		 response.statusCode = 404;
           		 responseMsg.setCode(-5);
 				 responseMsg.setMessage('no results found');
         		 responseMsg.setBody(null);     
            	
            }else{
           		 response.statusCode = 200;
           		 responseMsg.setCode(0);
 				 responseMsg.setMessage('sucess');
           		 responseMsg.setBody(op_list);     
            
            }
            
        }catch (Exception e){
             response.statusCode = 500;
            responseMsg.setCode(-3);
 			responseMsg.setMessage('Error' + e.getMessage());
            return responseMsg; 
        }
        
        return responseMsg; 
    }
    
    global class OP{
        public String name {get;set;}
        public Integer orderNumber {get;set;}
        public Decimal amount {get;set;}
        
    }
    
        global class ResponseMessage{
        Integer code = 0;
        String Message;
        List<ErrorMessage> ErrorList = new List<ErrorMessage>();
        List<Opportunity> op;
         
            
            public  ResponseMessage(){}
            public void setCode(Integer code){
                this.code = code;
            }
            
              public void setMessage(String message){
                this.message = message;
            }
            
             public void setBody(List<Opportunity> O){
                this.op = o;
            }
            
             public void addError (String message){
                ErrorList.add(new ErrorMessage(message));
            }
        
    }
    
    global class ErrorMessage {
        String Message;
        public ErrorMessage(String message){
            this.Message = message;
        }
    }
    
    

}
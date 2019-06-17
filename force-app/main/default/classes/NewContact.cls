public without sharing class NewContact {

 
 public String FirstName {get;set;}
 public String inputLName{get;set;}
 public String inputPhone {get;set;}
 public String inputEmail {get;set;}

 public void save(){
 
    Contact c = new Contact();
    c.FirstName = FirstName;
    c.LastName = inputLName;
    c.Phone = inputPhone; 
    c.Email = inputEmail;
    insert c; 
    
    
 }
 
}
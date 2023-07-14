public with sharing class LoginRegistrationExt{
    
    Registration__c reg;
    public LoginRegistrationExt(ApexPages.StandardController con){
            reg=(Registration__c)con.getRecord();
    
    
    }
    public String confirmPwd{get;set;}
    
    public PageReference save()
    {
    
        PageReference pr;
        
        if(String.isBlank(reg.Password__c)|| String.isBlank(confirmPwd))
        {
        
            ApexPages.Message message=new ApexPages.Message(ApexPages.Severity.Error,'Please enter both password and Confirm password'); 
            ApexPages.addMessage(message);
        }
        else if(reg.Password__c != confirmPwd)
        {
        
            ApexPages.Message message=new ApexPages.Message(ApexPages.Severity.Error,'Please enter both password and Confirm password as same '); 
            ApexPages.addMessage(message);
        }
        else
        {
        
                try
                {
                    insert reg;
                    pr=new Pagereference('/apex/LoginRegistrationSuccess');
                
                }
                catch(Exception e){
            
                    ApexPages.Message message =new ApexPages.Message(ApexPages.Severity.Error,e.getMessage());
                    ApexPages.addMessage(message);
                    
                    }
               
            
               
            }
        return pr; 
        
    }


}
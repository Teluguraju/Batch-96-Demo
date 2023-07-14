public with sharing class LoginHomeCtrl {

    public String username {get;set;}
    public String password {get;set;}
    
    
    public PageReference validateLogin()
    {
        PageReference pr;
        if(String.isBlank(username) || String.isBlank(password))
        {
        
            ApexPages.Message message = new ApexPages.Message(ApexPages.Severity.Error,'Please enter both username and password');
            ApexPages.addMessage(message);
        }
        else
        {
        
           List<Registration__c> regLst = [select Email__c, Password__c from Registration__c 
            where Email__c =: username];
            
            if(regLst == null || regLst.size() == 0)
            {
                ApexPages.Message message = new ApexPages.Message(ApexPages.Severity.Error,'Username doesn\'t exists');
                ApexPages.addMessage(message);
            
            }
            else if(regLst[0].Password__c != password)
            {
                ApexPages.Message message = new ApexPages.Message(ApexPages.Severity.Error,'Invalid Password');
                ApexPages.addMessage(message);
                
            }
            else
            {
                pr=Page.Welcome;
            }
            
        
        }
        
        return pr;
    }
}
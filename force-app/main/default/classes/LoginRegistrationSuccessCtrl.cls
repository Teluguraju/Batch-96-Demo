public with sharing class LoginRegistrationSuccessCtrl{

    public PageReference navigateToLoginHome(){
        //new PageReference('/apex/login_Home');
        return Page.login_Home;
    
    }

}
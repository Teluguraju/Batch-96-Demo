trigger NewAcc on Account (before insert,before update) {
	
    /*if(Trigger.isAfter && Trigger.isInsert){
        List<Contact> acc = new List<Contact>();
        for(Account a: trigger.new){
            Contact c = new Contact();
            c.AccountId = a.Id;
            c.LastName = 'R@ju ABD Contact';
            //c.Email='rajuabd824@gmail.com';
            acc.add(c);
        }
        insert acc;
    }*/
 
    for(Account a : trigger.new){
            List<Account> accLst= [Select Name from Account where Name=:a.Name];
            if(accLst.size()>0){
                a.addError('Duplicate Account Name Exists');
            }
        }
    
        

}
public class ContactTriggerHandler {
	
    public static void rollup_v1(){
        //trigger.new -->List<Sobject>
        
 		List<Contact> triggerNew=(List<Contact>)trigger.new;
        List<Contact> triggerOld=(List<Contact>)trigger.old;
        Map<Id,Contact> triggerOldMap =(Map<Id,Contact>)trigger.oldMap;
        
        
       	Set<Id> accIds=new Set<Id>();
        for(Contact con :trigger.isDelete ? triggerOld:triggerNew){
            accIds.add(con.AccountId);
            
            if(trigger.isUpdate && con.AccountId !=triggeroldMap.get(con.Id).AccountId){
                accIds.add(triggeroldMap.get(con.Id).AccountId);
            }
        }
        
        List<Contact> conLst=[Select Id,AccountId from Contact where AccountId in:accIds and MailingCountry='USA'];
        
        Map<Id,Integer> accIdConCountMap =new Map<Id,Integer>();
        
        for(Contact con:conLst){
            if(accIdConCountMap.containsKey(con.AccountId)){
               Integer count =accIdConCountMap.get(con.AccountId);
                count++;
                accIdConCountMap.put(con.AccountId, count);
            }
            else
            {
                accIdConCountMap.put(con.AccountId, 1);
            }
            
        }
        List<Account> acc4UpdLst=new List<Account>();
        
        for(Id accId:accIds){
            Account acc=new Account(
            Id=accId,
            Number_of_USA_Contacts__c=accIdConCountMap.get(accId)
            );
            acc4UpdLst.add(acc);
        }
       
        //Main Logic 
        if(acc4UpdLst.size()>0){
            update acc4UpdLst;
            
        }
     
	}
}
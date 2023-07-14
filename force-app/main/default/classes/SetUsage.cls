public with sharing class SetUsage{

    public static void setUse()
    {
        String nameVal='chandra';
    	Set<String> namesLst = new Set<String>{
            'Sumanth','Priyanka'
        };
        namesLst.add('Chandra');
        namesLst.add('Giri');
        namesLst.add('Shruthi');
        namesLst.add('Vinod');
        //namesLst.add('chandra');
        namesLst.add('Giri');
        
        if(!Utility.isDupeExstInSet(namesLst,nameVal))
            namesLst.add(nameVal);
        
        System.debug(namesLst.remove('Giri'));
        
        System.debug('Set contains a value ?'+namesLst.contains('Sumanth'));
         System.debug('Set contains a value ?'+namesLst.contains('Raju'));
        
        
        System.debug('Names list :'+namesLst+' with size'+namesLst.size());
        
        
        //Set<Contact> conSet=[select Id, Name from Contact];
        Set<Contact> conSet= new Set<Contact>([select Id, Name from Contact]);
        Set<Contact> conSet1=new Set<Contact>();
        conSet1.addAll([select Id, Name from Contact]);
        
    } 
    
    /* List<List<SObject>> lstOfLst=[Find 'test' in All Fields returning Account(Id,Name,Rating),Contact,Course__c,Applicant__c];
        
        system.debug('List of List'+lstOfLst);
        List<Contact> conLst=(List<Contact>)lstOfLst[1];
        system.debug('Contact list :'+conLst); 

	List<SObject>
		SELECT Id, FirstName, LastName, Email, MobilePhone, Name, Salutation FROM Contact
		SELECT Id, FirstName, LastName, Email, MobilePhone, Name, Salutation FROM Contact where (Email !=null and 
		MobilePhone !=null) or (FirstName like 'S%' and (not LastName like 'N%'))

		SELECT Id, FirstName, LastName, Email, MobilePhone, Name, Salutation FROM Contact
 		ORDER BY FirstName NULLS LAST

		SELECT Id, FirstName, LastName, Email, MobilePhone, Name, Salutation FROM Contact WHERE 
 		CreatedDate = TODAY

		SELECT Id, FirstName, LastName, Email, MobilePhone, Name, Salutation FROM Contact WHERE 
 		CreatedDate = LAST_N_WEEKS:2

		SELECT Id, FirstName, LastName, Email, MobilePhone, Name, Salutation ,BirthDate FROM Contact  WHERE
 		BirthDate = 1955-12-16

		SELECT Id, FirstName, LastName, Email, MobilePhone, Name, Salutation ,BirthDate FROM Contact WHERE 
		CALENDAR_YEAR(BirthDate) = 1955

	Integer -
		SELECT count() FROM Contact

	List<AggregateResult> -:
	
		SELECT count(Id), Salutation FROM Contact GROUP BY Salutation
		SELECT count(Id), Salutation FROM Contact GROUP BY Salutation 
		HAVING count(Id) > 5

		SELECT Id, FirstName, LastName, Email, MobilePhone, Salutation FROM Contact
 		ORDER BY FirstName, LastName  NULLS LAST LIMIT 5

		SELECT Id, FirstName, LastName, Email, MobilePhone, Salutation FROM Contact
 		ORDER BY FirstName, LastName  NULLS LAST LIMIT 5 OFFSET 5
	
		SELECT Id, StageName, Amount FROM Opportunity

		SELECT StageName, Count(Amount), Sum(Amount), Max(Amount), Min(Amount), Avg(Amount) from Opportunity
		where  StageName in ('Closed Won','Negotiation/Review','Proposal/Price Quote') Group BY Stagename


		Standard Object :
		-----------------
		* Child to Parent *
				* SELECT Id, Name , AccountId, Account.Name , Account.Rating FROM Opportunity
	
		
		* Parent to Child *
			* SELECT Id, Name , (Select Id, Name from Contacts) FROM Account
			* SELECT Id, Name , (Select Id, Name from Contacts) , (Select Id, Name from Opportunities) FROM Account

		* Custom Field:
		-----------------
		*Child to Parent*:
			Select Id, Name, Course__c, Applicant__c From Course_Application__c
		 * Select Id, Name, Course__c, Course__r.Name, Course__r.Name__c, Applicant__c, Applicant__r.Last_Name__c From Course_Application__c
		 * 
		 *
		 * Parent to Child * :
		 * 	SELECT Id,Name,(Select Id, Name From Course_Applications__r)FROM Course__c 
			
		**SOSL**
			* FIND {test} IN ALL FIELDS RETURNING Account(Id,Name),Course_Application__c(Id,Name,Course__c,Applicant__c)

		
	*/

}
public class ListUasage 
{
    
    public static Integer count=0;
    public static void listUse()
    {
       count++;

      /* List<String> namesLst = new List<String>{
            'Sumanth','Priyanka'
        };
        namesLst.add('Chandra');
        namesLst.add('Giri');
        namesLst.add('Shruthi');
        namesLst.add('Vinod');
        namesLst.add('Giri');

        namesLst.remove(2);
        namesLst.set(0, 'Satya');

        namesLst[1]='Ramani';

        System.debug('Names list 5th index value :'+namesLst.get(5));
        System.debug('Nmaes list 4th index value :'+namesLst[4]);
        
        namesLst.sort();
        
        System.debug('Names list :'+namesLst+' with size'+namesLst.size());
        
        List<String> descLst=new List<String>();
        for(Integer i=namesLst.size()-1;i>=0;i--)
        {
            descLst.add(namesLst[i]);
        }
        
		System.debug('Names Desc list :'+namesLst+' with size'+namesLst.size());
        
        List<String> namesLst2=namesLst.clone();
        System.debug('Names list2 :'+namesLst2+' with size'+namesLst2.size());
        namesLst2.clear();
        system.debug('namesLst2 is Empty ?'+namesLst2.isEmpty());
        
        List<String> namesLst3=new List<String>();
        namesLst3.addAll(namesLst);
        
        System.debug('Names list3 :'+namesLst3+' with size'+namesLst3.size());  */
        
        


       /**** Non Primitive Datatypes  ******/
        /* Schema.Account acc=new Schema.Account();
        acc.Name='Test Abc-1';
        insert acc; */

        List<Course_Application__c> caLst=new List<Course_Application__c>();
        List<Applicant__c> applicantLst=[Select Id,Name from Applicant__c where Name='Applicant-2022-0003'];
            if(applicantLst !=null && applicantLst.size()>0){
                //create Course

                Course__c course=new Course__c(
                    Name__c='Test Course'+System.now(), Faculty__c='Business',Faculty_Course_Area__c='IT'
                );
                    insert course;
                    //create Course Appication
                Course_Application__c ca1=new Course_Application__c();
                //ca1.Applicant__c='Applicant-2022-0003'; //never hard code
                ca1.Applicant__c=applicantLst[0].Id;
                ca1.Course__c=course.Id;
                caLst.add(ca1);
                

                //create Course Appication
                Course_Application__c ca2=new Course_Application__c();
                ca2.Applicant__c=applicantLst[0].Id;
                ca2.Course__c=course.Id;
                ca2.Status__c='Under Conditional Approval';
                caLst.add(ca2);

                //create Course Appication
                Course_Application__c ca3=new Course_Application__c();
                ca3.put('Applicant__c',applicantLst[0].Id);
                ca3.put('Course__c',course.Id);
                caLst.add(ca3);

                

               /* try {
                    insert caLst;
                    
                } catch (Exception e) {

                    System.debug('caLst Exeception :'+e.getMessage());
                    
                } */
                


            } 

/*

    ListUasage lu1= new ListUasage();
lu1.listUse();
lu1.listUse();
lu1.listUse();
system.debug('lu1 count'+ListUasage.count);
ListUasage lu2= new ListUasage();
lu2.listUse();
lu2.listUse();
lu2.listUse();
system.debug('lu2 count'+ListUasage.count);

*/
        
        Database.SaveResult[] srList = Database.insert(caLst, false);

        // Iterate through each returned result
        for (Database.SaveResult sr : srList) {
                if (sr.isSuccess()) {
                    // Operation was successful, so get the ID of the record that was processed
                    System.debug('Application Id'+ sr.getId());
                }
                   else {
                // Operation failed, so get all errors                
                            for(Database.Error error : sr.getErrors()) {
                                System.debug('The following error has occurred.');                    
                                System.debug('Exeception :'+ error.getMessage());
                                System.debug('Exeception :' + error.getFields());
                            }
                   }
        }
        
        //Update Records
       	List<Course_Application__c> caUpdLst= [Select Id, Decision_Conditions__c from Course_Application__c where Decision_Conditions__c = null];
        for(Course_Application__c ca:caUpdLst){
            ca.Decision_Conditions__c='Raju';
        }
        
        if(caUpdLst !=null && caUpdLst.size()>0)
        {
            update caUpdLst;
        }
        //Delete Records
        List<Course_Application__c> caDelLst=[Select Id from Course_Application__c where CreatedDate =TODAY];
        if(caDelLst !=null && caDelLst.size()>0){
            delete caDelLst;
        }
        
        //Undelete Records
        
         List<Course_Application__c> caUnDelLst=[Select Id from Course_Application__c 
                                                 where CreatedDate =TODAY and isDeleted= true All Rows];
        if(caUnDelLst !=null && caUnDelLst.size()>0){
            undelete caUnDelLst;
        }
           
        /* 
                List<List<SObject>> lstOfLst=[Find 'test' in All Fields returning Account(Id,Name,Rating),Contact,Course__c,Applicant__c];
            
            system.debug('List of List'+lstOfLst);
            List<Contact> conLst=(List<Contact>)lstOfLst[1];
            system.debug('Contact list :'+conLst);
    

		*/
        
        
    }
}
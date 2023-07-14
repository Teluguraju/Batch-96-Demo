public class Practice {
    public static void crudOp(){
        System.debug('Raju');
        List<Course_Application__c> caLst = new List<Course_Application__c>();
        List<Applicant__c> ApplicantsLst=[Select Id,Name from Applicant__c where Name='Applicant-2022-0001'];
        if(ApplicantsLst!=null && ApplicantsLst.size()>0)
        {
            //Create Course
            Course__c course= new Course__c(
            Name__c='Insertion types'+System.now(),Faculty__c='Business',Faculty_Course_Area__c='Marketing');
            insert course;
     
             //Creating Course Application
            Course_Application__c ca1= new Course_Application__c();
            ca1.Applicant__c=ApplicantsLst[0].Id;
            ca1.Course__c=course.Id;
           // insert ca1;
           caLst.add(ca1);
            
            //Creating Course Application
            Course_Application__c ca2= new Course_Application__c(
            Applicant__c=ApplicantsLst[0].Id,Course__c=course.Id,
            Status__c='Under Conditional Approval');
            //insert ca2;
            caLst.add(ca2);
            
            //Creating Course Application
            Course_Application__c ca3= new Course_Application__c();
            ca3.put('Applicant__c',ApplicantsLst[0].Id);
            ca3.put('Course__c',course.Id);
            //insert ca3;
            caLst.add(ca3);
           
            /*
             * try{
                insert caLst;
            }
            catch(Exception e)
            {
                system.debug('caLst Exception :'+e.getMessage());
            }
				*/
        	Database.SaveResult[] srLst=Database.insert(caLst,false);
            for(Database.SaveResult sr:srLst){
                if(sr.isSuccess()){
                    system.debug('Application Id'+sr.getId());
                    
                }else
                {
                    for(Database.Error error:sr.getErrors()){
                        System.debug('Exception'+error.getMessage());
                        system.debug('Exception'+error.getFields());
                    }
                       
                }
                
            }
            
        }
        //Update
       List<Course_Application__c> caUpdLst= [select Id,Decision_Conditions__c from Course_Application__c 
                                              where Decision_Conditions__c = null];
        for(Course_Application__c ca:caUpdLst){
            ca.Decision_Conditions__c='Suresh-Brother';
        }
        if(caUpdLst!=null && caUpdLst.size()>0)
        {
            update caUpdLst;
        }
        
        //delete Records
       List<Course_Application__c> caDelLst= [select Id from Course_Application__c where CreatedDate=TODAY];
        if(caDelLst!=null && caDelLst.size()>0){
            delete caDelLst;
        }
       /* else
        {
            System.debug('there is no records from db please contact system Administartor');
		}*/
        
          //undelete Records
       List<Course_Application__c> caUnDelLst= [select Id from Course_Application__c
                                                where CreatedDate=YESTERDAY and isDeleted=true All Rows];
        if(caUnDelLst!=null && caUnDelLst.size()>0){
            undelete caUnDelLst;
        }
       
    }

}
trigger TestTrigger on Course_Application__c (before delete) {
   /*List<Course_Application__c> caDelLst= [select Id from Course_Application__c where CreatedDate=TODAY];
    for(Course_Application__c ca:trigger.old){
        if(caDelLst!=null && caDelLst.size()>0){
            delete caDelLst;
        }
        else{
            ca.addError('You cannot delete the closed applicant.PLease contact Sysem Administartor!');
        }
       /* if(ca.Status__c =='Closed-Applicant Denied'){
            ca.addError('You cannot delete the closed applicant.PLease contact Sysem Administartor!');
            //ISNEW() &&  NOT( ISPICKVAL( Status__c , 'New') )
            //Status Should be new as it is new record.
        }
        
    }*/

}
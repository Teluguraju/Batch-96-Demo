trigger UserTrigger on User (before insert,before update) {
    
    // TO Do: Only fire it when the role is changed for update -->assignments
   
   
	//RoleDivisionMapping__c.getAll();//Map<String,RoleDivisionMapping__c>
	//RoleDivisionMapping__c.getAll().get('CEO);//RoleDivisionMapping__c.getAll();
	//System.debug(RoleDivisionMapping__c.getAll().get('CEO').Division__c);
    
    Set<Id> roleIds=new Set<Id>();
    for(User usr:trigger.new){
        if(trigger.isInsert || (trigger.isUpdate && usr.UserRoleId !=trigger.oldMap.get(usr.Id).UserRoleId)){
            roleIds.add(usr.UserRoleId);
        }
        
    }
    if(roleIds.size()>0){
        
    	system.debug('Inside the Trigger logic');
        //List<UserRole> roleLst =[select Id,Name from UserRole where Id in: roleIds];
        Map<Id,UserRole> rolesMap=new Map<Id,UserRole>([select Id,Name from UserRole where Id in: roleIds]);
        system.debug('RoleMap data '+rolesMap);
        /*for(UserRole uRole:[select Id,Name from UserRole where Id in: roleIds]){
            roleMap.put(uRole.Id, uRole);
        }*/
        
        for(User usr:trigger.new){
            //never use SOQL,DML inside the for loop
            //String roleName=[select Id,Name from UserRole where Id =: usr.UserRoleId].Name;
            
            String roleName;
            if(rolesMap.containsKey(usr.UserRoleId)){
                roleName= rolesMap.get(usr.UserRoleId).Name;
            }
            
            /*	for(UserRole uRole : roleLst){
                    if(uRole.Id==usr.UserRoleId){
                        roleName=uRole.Name;
                    }
                }
            
    
                */
           //Select Id, Name from UserRole where Name like 'SVP%' 
            //System.debug(RoleDivisionMapping__c.getAll().get('SVP, Human Resources'));// null
            ////System.debug(RoleDivisionMapping__c.getAll().get('SVP, Human Resources').Division__c);//Nullpointer Exception
                    if(RoleDivisionMapping__c.getAll().containsKey(roleName))
                    {
                      usr.Division=RoleDivisionMapping__c.getAll().get(roleName).Division__c;
                    }
                else{
                       usr.Division = null; 
                    }	
        }
    }
        
}
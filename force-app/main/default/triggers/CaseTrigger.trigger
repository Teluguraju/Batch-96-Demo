trigger CaseTrigger on Case (before delete) {

    for(Case cs:trigger.old)
    {
        if(cs.isClosed) // 1.cs.Status=='Closed' || cs.Status=='Rejected Closed' 
        {
            cs.addError(label.Case_Closed_ErrorMsg);
        }
    }
    
}
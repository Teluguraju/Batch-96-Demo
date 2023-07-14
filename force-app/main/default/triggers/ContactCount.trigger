trigger ContactCount on Contact (after insert, after update, after delete, after undelete) {
    //call handler for best practice
    if(Trigger.isinsert || Trigger.isupdate || trigger.isdelete || Trigger.isundelete){
        CountContactHandler.CountContactHelper(trigger.new, trigger.old);
    }
}
trigger AvaliableProductFinal on ProductFinal__c (before insert, before update) {
	  
    
    for(ProductFinal__c a : Trigger.New) {
        
        if(a.Amount__c > 0) {
            a.Avaliable__c = true ;
        } else {
            a.Avaliable__c = false ;
        }
        
        
    }
}
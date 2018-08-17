public class PaunchShopsViewController {
    
    //public String myText {get;set;}
    public List<Paunshop__c> paunchList {get;set;}
    public List<SelectOption> paunchSelectOptionList {get;set;}
    public List<thing__c> thingList {get;set;}
    public String paunchId {get;set;}
    
    public PaunchShopsViewController () {
        paunchList = [SELECT id, Name 
                      FROM Paunshop__c 
                      ORDER BY Name ASC];
        
        paunchId = !paunchList.isEmpty() ? paunchList[0].Id : Null;
        System.debug('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
            
        paunchSelectOptionList = new List<SelectOption>();
        for (Paunshop__c item : paunchList) {
            paunchSelectOptionList.add(new SelectOption(item.Id,item.Name));
        }
        getThings ();
    }
    
    public void getThings () {
        thingList = [SELECT Id, Name, Price__c, Describe__c, Paunshop__c, Status__c
                    FROM thing__c
                   
                     WHERE Status__c ='possible to redeem'
                     AND Paunshop__r.Id = :paunchId
                    ];
    }
	
}
@IsTest
private class WarehouseForTriggerTest {

    @isTest static void WarehouseForTriggerTest7() {
        
        
        upsert new Org_Configuration__c(
  
    Period_Term__c = 25
);

        List<Product_table__c> ProductList = new List<Product_table__c>();

        for (Integer i = 0; i < 150; i++) {
            Product_table__c prd = new Product_table__c(
                    Name = 'Test' + i,
                    Added_Date__c = Date.today().addDays(200 +i)

            );
            ProductList.add(prd);

        }

        Test.startTest();
        	Database.SaveResult[] srList = Database.insert(ProductList, false);

    for (Database.SaveResult sr : srList) {

   
        
        for(Database.Error err : sr.getErrors()) {
            System.debug('--------------------------');                   
            System.debug(err.getStatusCode() + ': ' + err.getMessage());
            System.debug('---------------------------' + err.getFields());
        }
        
    }

        Test.stopTest();

    }

}
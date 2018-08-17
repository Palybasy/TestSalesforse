@IsTest
private class WarehouseForClassTest {
    
    @isTest static void WarehouseForClassTest7 () {
        
        List<Product_table__c> ProductList = new List<Product_table__c>();
        
        
            Product_table__c prd = new Product_table__c(
            	Name = 'Test',
                Added_Date__c = Date.today()
            
            );
          Product_table__c prd2 = new Product_table__c(
            	Name = 'Test2',
                Added_Date__c = Date.today().addDays(30)
            
            );
          Product_table__c prd3 = new Product_table__c(
            	Name = 'Test3',
                Added_Date__c = Date.today()
            
            );
            ProductList.add(prd);
      ProductList.add(prd);
          ProductList.add(prd2);
         ProductList.add(prd3);
            
      Map<Product_Table__c, Warehouse__c> ProductWarehouseMap = ReturnWarehouseForTrigger2.returnWarehouseMap(ProductList);
        
       
        
    }

}
trigger AddWarehouseToProduct on Product_Table__c (before insert) {
    
   	Map<Product_Table__c, Warehouse__c> ProductWarehouseMap = ReturnWarehouseForTrigger2.returnWarehouseMap(Trigger.New);
    
    
    for(Product_Table__c a : Trigger.New) {
        
        Id IdWarehouse = ProductWarehouseMap.get(a).Id;
        a.Warehouse__c = IdWarehouse;
        
        
    }
}
public class ReturnWarehouseForTrigger2 {
    public static Map<Product_Table__c, Warehouse__c> returnWarehouseMap (List<Product_Table__c> productsList) {
        
        Map<Product_Table__c, Warehouse__c> ProductWarehouseMap = new Map<Product_Table__c, Warehouse__c> ();
        List<Warehouse__c> WarehouseList = [SELECT Id,Period_End__c,Period_Start__c FROM Warehouse__c ];
        List<Warehouse__c> WarehouseListInsert = new List<Warehouse__c>();
        
        
        Org_Configuration__c mhc = Org_Configuration__c.getInstance();
        System.debug(mhc);
        Decimal periodTerm = mhc.Period_Term__c; 
        String periodTermString = periodTerm + '' ;
        
        Integer periodTermInt =  integer.valueOf(periodTerm);
        System.debug(periodTermInt);
        
      	
        

        
         for ( Product_Table__c product : productsList ) {
          	Product_Table__c productCurrent = product;
           	Date dt = productCurrent.Added_Date__c;
        
             
             for(Warehouse__c warehouse : WarehouseList) {
                  if (warehouse.Period_Start__c <= dt && warehouse.Period_End__c >= dt) {

                		ProductWarehouseMap.put(productCurrent, warehouse);
                      	break;
                  } 
                   
                 
             }
             for (Warehouse__c warehouse2 : WarehouseListInsert) {
                          if (warehouse2.Period_Start__c <= dt && warehouse2.Period_End__c >= dt) {

                				ProductWarehouseMap.put(productCurrent, warehouse2);
                      			break;
                      		}
                      	
             }
             if(ProductWarehouseMap.get(productCurrent) == null ) {
                 	
                      Date SummPeridAndAddDate = dt.addDays(periodTermInt);
                      String warehouseName =  'Warehouse' + dt.format() + ' ' +SummPeridAndAddDate.format();
                     
                      Warehouse__c wr = new Warehouse__c(Name = warehouseName,
                                             Period_Start__c = dt,
                                             Period_End__c = SummPeridAndAddDate
                                                                                          );
                      ProductWarehouseMap.put(productCurrent, wr);
                     
                      WarehouseListInsert.add(wr);
                      
                  
              }
             
             
         
        }
      insert WarehouseListInsert;
     System.debug(ProductWarehouseMap);
      return ProductWarehouseMap;
        
  
        
        
    }

    
    
}
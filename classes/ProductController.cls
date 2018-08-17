public class ProductController {
	@AuraEnabled
    public static List<Product_Table__c> getProducts () {  
 
        List<Product_Table__c> products = [SELECT Name, Unit_Price__c, Units_Avaliable__c	, Product_Description__c, Image_Url__c	
                                           FROM Product_Table__c];
 		System.debug(products);
        for (Product_Table__c item : products) {
            if(item.Product_Description__c.length() > 100) {
                String descr = item.Product_Description__c;
                String descrSub = descr.subString(0,100);
                 
                 item.Product_Description__c = descrSub;
                 System.debug(item.Product_Description__c);
             }
        } 
        
        return products;
        
    }
}
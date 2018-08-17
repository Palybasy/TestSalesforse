public class DetailController {
    public Product_Table__c product {get;set;}
    private String idUrl = ApexPages.currentPage().getParameters().get('id');
   
    
    public DetailController() {
        product = [SELECT Name, Unit_Price__c, Units_Avaliable__c	, Product_Description__c, Image_Url__c	
                   FROM Product_Table__c
                   WHERE Id = :idUrl
                  ];
                  .
    }
}
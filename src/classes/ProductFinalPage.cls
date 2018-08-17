public with sharing class ProductFinalPage {
		@AuraEnabled
    public List<ProductFinal__c> products =  [SELECT Name, Amount__c, Avaliable__c	, DateAdd__c, DateRelease__c, Price__c, Type__c	
                                           FROM ProductFinal__c];

    
    public  List<ProductFinal__c> getProducts () {  
 		
     
      
        return products;
     
    }
    
    public void SortBy () {
        String order = ApexPages.currentPage().getParameters().get('sortString');
        
		if (order == 'NameTtl')

     	products = [SELECT Name, Amount__c, Avaliable__c	, DateAdd__c, DateRelease__c, Price__c, Type__c	
                                           FROM ProductFinal__c ORDER BY Name ASC];

 

		if (order == 'AmountTtl')

     	products = [SELECT Name, Amount__c, Avaliable__c	, DateAdd__c, DateRelease__c, Price__c, Type__c	
                                           FROM ProductFinal__c ORDER BY Amount__c ASC];
        
        if (order == 'AddDateTtl')

     	products = [SELECT Name, Amount__c, Avaliable__c	, DateAdd__c, DateRelease__c, Price__c, Type__c	
                                           FROM ProductFinal__c ORDER BY Price__c ASC];
        if (order == 'TypeTtl')

     	products = [SELECT Name, Amount__c, Avaliable__c	, DateAdd__c, DateRelease__c, Price__c, Type__c	
                                           FROM ProductFinal__c ORDER BY DateAdd__c ASC];
        
       if (order == 'PriceTtl')

     	products = [SELECT Name, Amount__c, Avaliable__c	, DateAdd__c, DateRelease__c, Price__c, Type__c	
                                           FROM ProductFinal__c ORDER BY Price__c ASC];
    }
    
    public void DeleteProduct () {
        String order = ApexPages.currentPage().getParameters().get('id');
        
        ProductFinal__c prd  = [SELECT Name, Amount__c, Avaliable__c	, DateAdd__c, DateRelease__c, Price__c, Type__c	
                                           FROM ProductFinal__c WHERE Id = :order LIMIT 1] ;
        
        delete prd;
        products =  [SELECT Name, Amount__c, Avaliable__c	, DateAdd__c, DateRelease__c, Price__c, Type__c	
                                           FROM ProductFinal__c];
        
    }
    
    public void CreateProduct () {
        String name = ApexPages.currentPage().getParameters().get('name');
        Integer price = integer.valueOf(ApexPages.currentPage().getParameters().get('price'));
        Integer amount = integer.valueOf(ApexPages.currentPage().getParameters().get('amount'));
        String typePr = ApexPages.currentPage().getParameters().get('type');
        Date addDate = Date.parse(ApexPages.currentPage().getParameters().get('addDate'));
        Date relDate = Date.parse(ApexPages.currentPage().getParameters().get('relDate'));
        
        ProductFinal__c prd = new ProductFinal__c (
        	Name = name,
            Price__c = price,
            Amount__c = amount,
            Type__c = typePr,
        	DateAdd__c = addDate,
            DateRelease__c = relDate 
        );
        
        insert prd;
        products.add(prd);
        
    }
    
    public void FindProduct  () {
        String name = ApexPages.currentPage().getParameters().get('name');
        String addDate = ApexPages.currentPage().getParameters().get('date');
        
        System.debug(name);
        System.debug(addDate);
        if(name == '' &&  addDate != '') {
           Date dateF = Date.parse(addDate);
            products = [SELECT Name, Amount__c, Avaliable__c	, DateAdd__c, DateRelease__c, Price__c, Type__c	
                        FROM ProductFinal__c
                        WHERE DateAdd__c = :dateF
                       	
                       ];
        } else if (name != '' &&  addDate == '') {
            String nameF = '%'+ name + '%' ;
             products = [SELECT Name, Amount__c, Avaliable__c	, DateAdd__c, DateRelease__c, Price__c, Type__c	
                        FROM ProductFinal__c
                        WHERE Name LIKE :nameF
                       	
                       ];
        } else if (name != '' &&  addDate != '') {
            String nameF = '%'+ name + '%' ;
            Date dateF = Date.parse(addDate);
                  products = [SELECT Name, Amount__c, Avaliable__c	, DateAdd__c, DateRelease__c, Price__c, Type__c	
                        FROM ProductFinal__c
                        WHERE Name LIKE :nameF
                        AND DateAdd__c = :dateF
                       	
                       ];
        }
    }
    
}
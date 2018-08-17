@IsTest
private class ProductFinalPageTest {

    @isTest static void ProductFinalPageTest7() {
        ProductFinalPage classProduct    = new ProductFinalPage();   
        classProduct.getProducts();
        
        ApexPages.currentPage().getParameters().put('sortString', 'NameTtl');
        classProduct.sortBy();
         ApexPages.currentPage().getParameters().put('sortString', 'AmountTtl');
        classProduct.sortBy();
         ApexPages.currentPage().getParameters().put('sortString', 'TypeTtl');
        classProduct.sortBy();
         ApexPages.currentPage().getParameters().put('sortString', 'PriceTtl');
        classProduct.sortBy();
         ApexPages.currentPage().getParameters().put('sortString', 'AddDateTtl');
        classProduct.sortBy();
        
        
        List<ProductFinal__c> prds = new List<ProductFinal__c>();
        
       ProductFinal__c prd1 = new ProductFinal__c (
        	Name = 'name',
            Price__c = 200,
            Amount__c = 400,
            Type__c = 'typePr',
        	DateAdd__c = Date.today().addDays(-12),
            DateRelease__c = Date.today().addDays(-15) 
        );
          ProductFinal__c prd2 = new ProductFinal__c (
        	Name = 'gtx',
            Price__c = 200,
            Amount__c = 400,
            Type__c = 'typePr',
        	DateAdd__c = Date.today().addDays(-1),
            DateRelease__c = Date.today().addDays(-1) 
        );
          ProductFinal__c prd3 = new ProductFinal__c (
        	Name = 'uix',
            Price__c = 200,
            Amount__c = 400,
            Type__c = 'dfggd',
        	DateAdd__c = Date.today().addDays(-8),
            DateRelease__c = Date.today().addDays(-9) 
        );
        prds.add(prd1);
        prds.add(prd2);
        prds.add(prd3);
        
        insert prds;
        
        
        ApexPages.currentPage().getParameters().put('id', prd1.Id);
        classProduct.DeleteProduct();
        
        ApexPages.currentPage().getParameters().put('name', 'new');
        ApexPages.currentPage().getParameters().put('price', '3000');
        ApexPages.currentPage().getParameters().put('amount', '12');
        ApexPages.currentPage().getParameters().put('type', 'notebook');
        ApexPages.currentPage().getParameters().put('addDate', '08/01/2018');
        ApexPages.currentPage().getParameters().put('relDate', '08/01/2018');
        classProduct.CreateProduct();
        
        ApexPages.currentPage().getParameters().put('name', 'uix');
        ApexPages.currentPage().getParameters().put('date', Date.today().addDays(-1).format());
        classProduct.FindProduct();
        
         ApexPages.currentPage().getParameters().put('name', '');
        ApexPages.currentPage().getParameters().put('date', Date.today().addDays(-1).format());
        classProduct.FindProduct();
        
         ApexPages.currentPage().getParameters().put('name', 'uix');
        ApexPages.currentPage().getParameters().put('date', '');
        classProduct.FindProduct();
        
    }
    
}
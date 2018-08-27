public with sharing class ProductFinalPage {
		
    

    private Integer totalRecords = 0;
    private Integer count = 0;
    private Integer LimitSize = 5;

    public String way { get; set; }


    public List<ProductFinal__c> products ;
                                           
    private List<ProductFinal__c> productsSort = new List<ProductFinal__c>();                                        

    public ProductFinalPage () {
        products = [SELECT Id,Name, Amount__c, Avaliable__c	, DateAdd__c, DateRelease__c, Price__c, Type__c	
                                           FROM ProductFinal__c LIMIT:LimitSize OFFSET:count] ; 
        totalRecords = [SELECT count() from ProductFinal__c];
        way = 'ASC';
   

    }
    public void updateF () {
            products = [SELECT Id,Name, Amount__c, Avaliable__c	, DateAdd__c, DateRelease__c, Price__c, Type__c	
                                           FROM ProductFinal__c LIMIT:LimitSize OFFSET:count] ;
            totalRecords = [SELECT count() from ProductFinal__c];
    }

    public  List<ProductFinal__c> getProducts () {  
        
        return products;
     
    }
    
    public void SortBy () {
        String order = ApexPages.currentPage().getParameters().get('sortString');
        way = ApexPages.currentPage().getParameters().get('way');
        String soql;

        

        
		if (order == 'NameTtl') {
        
            soql = 'select Id,Name, Amount__c, Avaliable__c	, DateAdd__c, DateRelease__c, Price__c, Type__c	from ProductFinal__c  where Id IN :products order by Name '+ way ;
        
        }

		if (order == 'AmountTtl') {

             soql = 'select Id,Name, Amount__c, Avaliable__c	, DateAdd__c, DateRelease__c, Price__c, Type__c	from ProductFinal__c  where Id IN :products order by Amount__c '+ way ;
        
        }

        if (order == 'AddDateTtl') {

            soql = 'select Id,Name, Amount__c, Avaliable__c	, DateAdd__c, DateRelease__c, Price__c, Type__c	from ProductFinal__c  where Id IN :products order by DateAdd__c '+ way ;
        
        }
        if (order == 'TypeTtl')  {

     	    soql = 'select Id,Name, Amount__c, Avaliable__c	, DateAdd__c, DateRelease__c, Price__c, Type__c	from ProductFinal__c  where Id IN :products order by Type__c '+ way ;

        }

        if (order == 'PriceTtl') {

            soql = 'select Id,Name, Amount__c, Avaliable__c	, DateAdd__c, DateRelease__c, Price__c, Type__c	from ProductFinal__c  where Id IN :products order by Price__c '+ way ;
  
        }
        System.debug(soql);
     	productsSort = database.query(soql);

        products = productsSort; 

        if(way == 'ASC')  {
           way = 'DESC' ;
        }  else {
            way = 'ASC';
        }                                                                   
    }
    
    public void DeleteProduct () {
        String id = ApexPages.currentPage().getParameters().get('id');
        
        ProductFinal__c prd  = [SELECT Name, Amount__c, Avaliable__c	, DateAdd__c, DateRelease__c, Price__c, Type__c	
                                           FROM ProductFinal__c WHERE Id = :id LIMIT 1] ;
        
        delete prd;
       
        updateF();
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
        
        updateF();
    }

     public void EditProduct () {
        String IdPrd = ApexPages.currentPage().getParameters().get('id');
        String name = ApexPages.currentPage().getParameters().get('name');
        Integer price = integer.valueOf(ApexPages.currentPage().getParameters().get('price'));
        Integer amount = integer.valueOf(ApexPages.currentPage().getParameters().get('amount'));
        String typePr = ApexPages.currentPage().getParameters().get('type');
        Date addDate = Date.parse(ApexPages.currentPage().getParameters().get('addDate'));
        Date relDate = Date.parse(ApexPages.currentPage().getParameters().get('relDate'));
        
        ProductFinal__c prd = new ProductFinal__c (
            Id = IdPrd,
        	Name = name,
            Price__c = price,
            Amount__c = amount,
            Type__c = typePr,
        	DateAdd__c = addDate,
            DateRelease__c = relDate 
        );
        
        update prd;
        
        updateF();
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

  


    public void prevBtn () {
        count -= LimitSize ;
        updateF();
    }

    public void nextBtn () {
        count += LimitSize;
        updateF();
    }

    public String getPrv () {
        if(count == 0)
            return 'disabled';
        else
            return null;
    }

     public String getNxt () {
        if((count + LimitSize) >= totalRecords)
            return 'disabled';
        else
            return null;
    }

     public Integer getPageNumber() {

        return count/LimitSize + 1;

    }

    public Integer getTotalPages() {

        if (math.mod(totalRecords, LimitSize) > 0) {
         return totalRecords/LimitSize + 1;
        }
        else {
         return (totalRecords/LimitSize);
        }

    }

  
    
}
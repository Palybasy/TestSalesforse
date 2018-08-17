@isTest private class DetailControllerTest {
    @isTest static void DetailControllerTest7 () {
       
        DetailController detail = new DetailController();
        detail.product = new Product_Table__c(
        	Name = 'Acer 5000',
            Product_Description__c = '15.6" 1920 x 1080 матовый, Intel Core i5 7200U 2500 МГц, 8 ГБ, 1000 ГБ (HDD), NVIDIA GeForce 940MX, Linux, цвет крышки черный, цвет корпуса черный'
        );
        System.assertEquals(detail.product,  new Product_Table__c(
        	Name = 'Acer 5000',
            Product_Description__c = '15.6" 1920 x 1080 матовый, Intel Core i5 7200U 2500 МГц, 8 ГБ, 1000 ГБ (HDD), NVIDIA GeForce 940MX, Linux, цвет крышки черный, цвет корпуса черный'
        )    );
  
        
    }
}
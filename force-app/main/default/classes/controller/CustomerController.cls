public with sharing class CustomerController {
 
    @AuraEnabled
    public static List<Customer__c> getAllCustomers(){

        return CustomerService.getAllCustomers();   
        
    }

    @AuraEnabled
    public static Customer__c getSelectedCustomer(Id customerId){
        
        return CustomerService.getCustomerById(customerId);

    }
    
}

public with sharing class CustomerService {

    public static List<Customer__c> getAllCustomers(){

        return [SELECT Id, Name
                FROM Customer__c];

    }

    public static Customer__c getCustomerById(Id customerId){

        return [SELECT Id, Name 
                FROM Customer__C
                WHERE Id =: customerId];

    }
    

}

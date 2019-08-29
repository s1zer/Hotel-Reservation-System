public with sharing class CustomerController {
 
    @AuraEnabled
    public static List<Customer__c> getAllCustomers(){

        return [SELECT Id, Name, Email__c, Phone__c
                FROM Customer__c ];
        
    }

    @AuraEnabled
    public static Customer__c getSelectedCustomer(Id customerId){
        
        Customer__c customer =  [SELECT Id, Name, Email__c, Phone__c 
                FROM Customer__c
                WHERE Id =: customerId ];

        return customer;

    }


}

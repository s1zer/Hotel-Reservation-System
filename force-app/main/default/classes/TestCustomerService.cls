@isTest
public with sharing class TestCustomerService {

    @isTest static void shouldReturnAllCustomers(){

        //given 
        List<Customer__c> customers = PrepareDataTest.createCustomers();

        //when
        Test.startTest();
            List<Customer__c> foundCustomers = CustomerService.getAllCustomers();
        Test.stopTest();

        //then
        System.equals(foundCustomers.size(), 5);
        System.equals(foundCustomers.size(), customers.size());

    }

    @isTest static void shouldResturnCustomerById(){

        //given
        Customer__c saveCustomer = PrepareDataTest.createCustomer();
        Customer__c getCustomer = [SELECT Id FROM Customer__C];
        Id customerId = getCustomer.Id;

        //when
        Test.startTest();
            Customer__c foundCustomer = CustomerService.getCustomerById(customerId);
        Test.stopTest();

        //then
        System.equals(foundCustomer != null, true);
        System.equals(foundCustomer.Id, customerId);

    }
    

}

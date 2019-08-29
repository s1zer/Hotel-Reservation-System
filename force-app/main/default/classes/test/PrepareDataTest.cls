@isTest
public with sharing class PrepareDataTest {

    public static Customer__c createCustomer(){

    Customer__c customer = new Customer__c( Name = 'Test customer', Phone__c = '111-111-111',
                                            Email__c = 'testmail@test.com');

    insert customer;

    return customer;

    }

    public static List<Customer__c> createCustomers(){

        List<Customer__c> customers = new List<Customer__c>();

        for(Integer i = 0 ; i < 5 ; i++){

            Customer__c customer = new Customer__c( Name = 'Test customer ' + i, Phone__c = '111-111-111',
                                                    Email__c = 'testmail@test.com');
            
            customers.add(customer);

        }

        insert customers;
        return customers;

    }

    public static Hotel__c createHotel(){

        Hotel__c hotel = new Hotel__c(Name = 'Test hotel', 
                                    City__c= 'Test city');

        insert hotel;
        return hotel;

    }

    public static Room__c createRoom(){

        Room__c room = new Room__c(Name = 'Test room', 
                                    Price__c = 200, 
                                    Accessibility__c = true, 
                                    Room_Type__c = 'Apartment', 
                                    Hotel__c = createHotel().Id);

        insert room;

        return room;

    }

    public static List<Room__c> createRoomsList(){

        List<Room__c> rooms = new List<Room__c>();

        for(Integer i = 0; i < 10; i++){

            Room__c room = createRoom();
            rooms.add(room);

        }

        insert rooms;

        return rooms;

    }
    


}

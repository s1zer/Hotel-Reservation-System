@isTest
public with sharing class PrepareDataTest {

    public static Customer__c createCustomer(){

        Customer__c customer = new Customer__c( Name = 'Test customer', 
                                                Phone__c = '111-111-111',
                                                Email__c = 'testmail@test.com');

    insert customer;
    return customer;

    }

    public static List<Customer__c> createCustomers(){

        List<Customer__c> customers = new List<Customer__c>();

        for(Integer i = 0 ; i < 5 ; i++){

            Customer__c customer = new Customer__c( Name = 'Test customer ' + i, 
                                                    Phone__c = '111-111-111',
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

    public static List<Hotel__c> createHotels(){

        List<Hotel__c> hotels = new List<Hotel__c>();

        for(Integer i = 0 ; i < 5 ; i++){

            Hotel__c hotel = new Hotel__c(Name = 'Test hotel ' + i, 
                                            City__c= 'Test city');

            hotels.add(hotel);

        }

        insert hotels;
        return hotels;

    }

    public static Room__c createRoom(){

        Hotel__c saveHotel = createHotel();
        Id hotelId = saveHotel.Id;

        Room__c room = new Room__c(Name = 'Test room', 
                                    Price__c = 200, 
                                    Accessibility__c = true, 
                                    Room_Type__c = 'Apartment', 
                                    Hotel__c = hotelId);

        insert room;
        return room;

    }

    public static Reservation__c createReservation(){

        Room__c saveRoom = createRoom();
        Id roomId = saveRoom.Id;

        Hotel__c saveHotel = createHotel();
        Id hotelId = saveHotel.Id;

        Customer__c saveCustomer = createCustomer();
        Id customerId = saveCustomer.Id;

        Reservation__c saveReservation = new Reservation__c(Name = 'Test reservation',
                                                            Check_In__c  = Date.valueOf('2019-10-10'),
                                                            Check_Out__c = Date.valueOf('2019-10-12'),
                                                            Customer__c = customerId,
                                                            Hotel__c = hotelId,
                                                            Room__c = roomId);
        insert saveReservation;
        return saveReservation;
        
    }

}

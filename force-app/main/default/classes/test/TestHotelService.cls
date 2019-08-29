@isTest
public with sharing class TestHotelService {

    @isTest static void shouldReturnAllHotels(){

        //given
        List<Hotel__c> hotels = PrepareDataTest.createHotels();

        //when
        Test.startTest();
            List<Hotel__c> foundHotels = HotelService.getAllHotels();
        Test.stopTest();

        //then
        System.equals(foundHotels.size(), 5);
        System.equals(foundHotels.size(), hotels.size());

    }

    @isTest static void shouldReturnHotelById(){

        //given
        Hotel__c saveHotel = PrepareDataTest.createHotel();
        Hotel__c getHotel = [SELECT Id FROM Hotel__c];
        Id hotelId = getHotel.Id;

        //when
        Test.startTest();
            Hotel__c foundHotel = HotelService.getHotelById(hotelId);
        Test.stopTest();

        //then
        System.equals(foundHotel !=null, true);
        System.equals(foundHotel.Id, hotelId);

    }

}

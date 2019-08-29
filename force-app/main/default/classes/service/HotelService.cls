public with sharing class HotelService {

    public static Hotel__c getHotelById(Id hotelId){

            return [SELECT Id, Name, (SELECT Id, Name FROM Rooms__r)
                FROM Hotel__c
                WHERE Id =: hotelId];

    }

    public static List<Hotel__c> getAllHotels(){

        return [SELECT Id, Name, City__c
                FROM Hotel__c];

    }

}

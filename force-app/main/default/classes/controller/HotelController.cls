public with sharing class HotelController {

    @AuraEnabled
    public static List<Hotel__c> getAllHotels(){

        return HotelService.getAllHotels();
        
    }

    @AuraEnabled
    public static List<Room__c> getRoomsFromHotel(Id hotelId){

        return RoomService.getRoomsFromHotel(hotelId);
    
    }

    @AuraEnabled
    public static List<Room__c> getAvailableRoomsFromHotel(Date checkIn, Date checkOut, Id hotelId){

        return RoomService.getAvailableRoomsFromHotelByDate(checkIn, checkOut, hotelId);
        
    }

    @AuraEnabled
    public static Hotel__c getSelectedHotel(Id hotelId){

        Hotel__c hotel = [SELECT Id, Name, City__c
                        FROM Hotel__c
                        WHERE Id =: hotelId];
    
        return hotel;

    }

    @AuraEnabled
    public static Room__c getSelectedRoom(Id roomId){
        
        return RoomService.getRoomById(roomId);
        
    }
    
}

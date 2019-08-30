public with sharing class RoomService {

    public static List<Room__c> getAllRooms() {

        return [SELECT Id, Name, Hotel__c, Price__c, 
                            Room_Type__c, 
                            Accessibility__c	 
                            FROM Room__c];
    }

    public static Room__c getRoomById(Id roomId){
        
        Room__c foundRoom = [SELECT Id, Name
                FROM Room__c 
                WHERE Id =: roomId];

        return foundRoom;

    }

    public static List<Room__c> getRoomsFromHotel(Id hotelId){

        List<Room__c> foundRooms = new List<Room__c>();
        Hotel__c foundHotel = HotelService.getHotelById(hotelId);

        for(Room__c r : foundHotel.Rooms__r){
            foundRooms.add(r);
        }
        
        return foundRooms;

    }

    public static List<Room__c> getAvailableRoomsFromHotelByDate(Date checkIn, Date checkOut, Id hotelId){

        List<Reservation__c> reservs = ReservationService.getReservationsByDate(checkIn, checkOut);
        List<Room__c> hotelRooms = getRoomsFromHotel(hotelId);

        return getNoBookedRooms(hotelRooms, reservs);

    } 

    @TestVisible 
    private static List<Room__c> getNoBookedRooms(List<Room__c> roomsList, List<Reservation__c> reservationsList){

        Set<Room__c> hotelRoomsSet = roomsListToSet(roomsList);

        if(reservationsList.isEmpty()){

            return roomsList;

        }else{
            
            for(Room__c rm : hotelRoomsSet){
                for(Reservation__c rsv : reservationsList){
                    if(rm.ID == rsv.Room__c){
                        hotelRoomsSet.remove(rm);
                    }
                }
            }

            return roomsSetToList(hotelRoomsSet);

        }

    }

    @TestVisible
    private static Set<Room__c> roomsListToSet(List<Room__c> roomsList){

        Set<Room__c> hotelRoomsSet = new Set<Room__c>();
        hotelRoomsSet.addAll(roomsList);

        return hotelRoomsSet;

    }

    @TestVisible
    private static List<Room__c> roomsSetToList(Set<Room__c> roomsSet){

        List<Room__c> hotelRoomsList = new List<Room__C>();
        hotelRoomsList.addAll(roomsSet);

        return hotelRoomsList;

    }
}


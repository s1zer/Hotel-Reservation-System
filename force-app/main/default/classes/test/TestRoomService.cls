@isTest
public with sharing class TestRoomService {

    @isTest static void shouldReturnAllRooms(){

        //given
        for(Integer i = 0 ; i < 10 ; i++){

            PrepareDataTest.createRoom();

        }
        List<Room__c> getAllRooms = [SELECT Id, Name FROM Room__c];

        //when
        Test.startTest();
            List<Room__c> foundRooms = RoomService.getAllRooms();
        Test.stopTest();

        //then
        System.equals(foundRooms.size(), getAllRooms.size());
        System.equals(foundRooms.size(), 10);

    }

    @isTest static void shouldReturnRoomById(){

        //given
        Room__c saveRoom = PrepareDataTest.createRoom();
        Room__c getRoom = [SELECT Id, Name FROM Room__c];
        Id roomId = getRoom.Id;

        //when
        Test.startTest();
            Room__c foundRoom = RoomService.getRoomById(roomId);
        Test.stopTest();

        //then
        System.equals(foundRoom != null, true);
        System.equals(foundRoom.Id, roomId );
        System.equals(foundRoom.Name, 'Test Room');

    }

    @isTest static void shouldReturnAllRoomsWhenNoReservatios(){

        //given
        List<Reservation__c> emptyReservationsList = new List<Reservation__c>();
        List<Room__c> roomsList = new List<Room__c>();

        for(Integer i = 0 ; i < 10 ; i++){

            roomsList.add(PrepareDataTest.createRoom());

        }

        //when
        Test.startTest();
            List<Room__c> foundRooms = RoomService.getNoBookedRooms(roomsList, emptyReservationsList);
        Test.stopTest();
            
        //then
        System.equals(foundRooms.size(), roomsList.size());

    }

    @isTest static void shouldReturnAllRoomsWhenAreNotReserved(){

        //given
        Reservation__c saveReservation = PrepareDataTest.createReservation();
        List<Reservation__c> reservationsList = new List<Reservation__c>();
        reservationsList.add(saveReservation);

         List<Room__c> roomsList = new List<Room__c>();

        for(Integer i = 0 ; i < 10 ; i++){

            roomsList.add(PrepareDataTest.createRoom());

        }

        //when
        Test.startTest();
            List<Room__c> rooms = RoomService.getNoBookedRooms(roomsList, reservationsList);
        Test.stopTest();

        //then
        System.equals(rooms.size(), 10);

    }

    @isTest static void shouldReturnOnlyNoReservedRooms(){

        //given
        Reservation__c saveReservation = PrepareDataTest.createReservation();
        List<Reservation__c> reservationsList = new List<Reservation__c>();
        reservationsList.add(saveReservation);

        Id reservedRoomId = saveReservation.Room__c;
        Room__c reservedRoom = [SELECT Id, Name
                                FROM Room__c
                                WHERE Id =: reservedRoomId];

        List<Room__c> roomsList = new List<Room__c>();
        roomsList.add(reservedRoom);

        //when
        Test.startTest();
            List<Room__c> rooms = RoomService.getNoBookedRooms(roomsList, reservationsList);
        Test.stopTest();

        //then
        System.equals(rooms.size(), 0);

    }

    @isTest static void shouldReturnRoomsFromHotel(){

        //given
        Room__c saveRoom = PrepareDataTest.createRoom();
        Id hotelId = saveRoom.Hotel__c;

        //when
        Test.startTest();
            List<Room__c> roomsFromHotel = RoomService.getRoomsFromHotel(hotelId);
        Test.stopTest();

        //then
        System.equals(roomsFromHotel.size(), 1);
    
    }

    @isTest static void shouldReturnAvailableRoomsFromHotelByDate(){

        //given
        Room__c saveRoom = PrepareDataTest.createRoom();
        Id hotelId = saveRoom.Hotel__c;

        Date checkIn = Date.valueOf('2019-10-10');
        Date checkOut = Date.valueOf('2019-10-12');

        //when
        Test.startTest();
            List<Room__c> rooms = RoomService.getAvailableRoomsFromHotelByDate(checkIn, checkOut, hotelId);
        Test.stopTest();

    }

    @isTest static void shouldConvertListToSet(){

        //given
        List<Room__c> roomsList = new List<Room__c>();
        Room__c room = new Room__c();

        roomsList.add(room);
        roomsList.add(room);

        //when
        Set<Room__c> roomsSet = RoomService.roomsListToSet(roomsList);

        //then
        System.equals(roomsSet.size(), 1);
        System.equals(roomsList.size(), 2);

    }

    @isTest static void shouldConvertSetToList(){

        //given
        Set<Room__c> roomsSet = new Set<Room__c>();
        Room__c room = new Room__c();

        //when
        List<Room__c> roomsList = RoomService.roomsSetToList(roomsSet);

        //then
        System.equals(roomsList instanceof List<Room__c> , true);

    }

}

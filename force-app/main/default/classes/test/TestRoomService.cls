@isTest
public with sharing class TestRoomService {

    @isTest static void shouldReturnAllRooms(){

        //given
        List<Room__c> allRooms = PrepareDataTest.createRoomsList();

        //when
        Test.startTest();
            List<Room__c> foundRooms = RoomService.getAllRooms();
        Test.stopTest();

        //then
        System.debug(allRooms.size());
        System.equals(allRooms.size(), foundRooms.size());
        
    }

    // @isTest static void shouldReturnRoomById(){

    //     //given
        
    //     //when

    //     Test.startTest();

    //     Test.stop();


    //     //then

    // }

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

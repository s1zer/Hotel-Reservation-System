@isTest
public with sharing class TestReservationService {

    @isTest static void shouldReturnAllReservations(){

        //given
        List<Reservation__c> reservations = new List<Reservation__c>();

        for(Integer i = 0 ; i <5 ; i++){

            reservations.add(PrepareDataTest.createReservation());

        }

        //when
        Test.startTest();
            List<Reservation__c> foundReservations = ReservationService.getAllReservations();
        Test.stopTest();

        //then
        System.equals(foundReservations.size(), 5);
        System.equals(foundReservations.size(), reservations.size());
            
    }

    @isTest static void shouldReturnReservationsByDate(){

        //given
        Reservation__c reserv1 = PrepareDataTest.createReservation();
        reserv1.Check_In__c = Date.valueOf('2019-11-12');
        reserv1.Check_Out__c = Date.valueOf('2019-11-15');
        update reserv1;

        Reservation__c reserv2 = PrepareDataTest.createReservation();
        reserv1.Check_In__c = Date.valueOf('2019-10-25');
        reserv1.Check_Out__c = Date.valueOf('2019-10-28');
        update reserv2;
        
        Date checkIn = Date.valueOf('2019-11-10');
        Date checkOut = Date.valueOf('2019-11-18');
        
        //when
        Test.startTest();
            List<Reservation__c> foundReservations = ReservationService.getReservationsByDate(checkIn, checkOut);
        Test.stopTest();

        //then
        System.equals(foundReservations.isEmpty(), false);
        System.equals(foundReservations.size(), 1);

    }

    @isTest static void shouldInsertNewReservation(){


    }


}

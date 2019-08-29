public with sharing class ReservationController {

    @AuraEnabled
    public static Reservation__c saveReservation(Reservation__c reservation){

        System.debug('controller here');
        System.debug('reserv' + reservation);

        insert reservation;
        return reservation;

    }

    @AuraEnabled
    public static List<Reservation__c> getAllReservations(){

        return [SELECT Id, Name, Total_price__c
                FROM Reservation__c];
        
    }

}

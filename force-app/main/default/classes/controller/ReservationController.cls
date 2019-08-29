public with sharing class ReservationController {

    @AuraEnabled
    public static Reservation__c saveReservation(Reservation__c reservation){

        return ReservationService.createReservation(reservation);

    }

    @AuraEnabled
    public static List<Reservation__c> getAllReservations(){

        return ReservationService.getAllReservations();
        
    }

}

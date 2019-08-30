public with sharing class ReservationService {

    public static List<Reservation__c> getReservationsByDate(Date checkIn, Date checkOut){
        
        List<Reservation__c> reservs = [SELECT Room__c, Check_In__c, Check_Out__c, Name
                                        FROM Reservation__c
                                        WHERE (Check_In__c >= :checkIn AND Check_In__c <= :checkOut) 
                                        OR (Check_Out__c >= :checkIn AND Check_Out__c <= :checkOut)];

        return reservs;
        
    }

    public static List<Reservation__c> getAllReservations(){

        return [SELECT Id, Name, Total_price__c
                FROM Reservation__c];

    }

    public static Reservation__c createReservation(Reservation__c reservation){

        insert reservation;
        return reservation;

    }

}

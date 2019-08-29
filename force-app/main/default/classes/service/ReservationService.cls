public with sharing class ReservationService {

    public static List<Reservation__c> getReservationsByDate(Date checkIn, Date checkOut){
        List<Reservation__c> reservs = [SELECT Room__c, Check_In__c, Check_Out__c, Name
                                        FROM Reservation__c
                                        WHERE (Check_In__c >= :checkIn AND Check_In__c <= :checkOut) 
                                        OR (Check_Out__c >= :checkIn AND Check_Out__c <= :checkOut)];

        return reservs;
        
    }

}

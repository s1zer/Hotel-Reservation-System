({
    createReservation : function(component, event) {
        
        var selectedRoom = component.get("v.selectedRoom");
        var selectedCustomer = component.get("v.selectedCustomer");
        var selectedHotel = component.get("v.selectedHotel");
        var newReserv = component.get("v.newReservation");

        newReserv.Room__c = selectedRoom;
        newReserv.Customer__c = selectedCustomer;
        newReserv.Hotel__c = selectedHotel;
        
        var action = component.get("c.saveReservation");
        action.setParams({ 
            "reservation": newReserv
        });

        $A.enqueueAction(action);
        
    },

    setCheckIn: function(component, event, helper){

        var checkIn = event.getSource().get("v.value");
        var newReserv = component.get("v.newReservation");
    
        newReserv.Check_In__c = checkIn;
        component.set("v.newReservation", newReserv );

    },

    setCheckOut: function(component, event, helper){

        var checkOut = event.getSource().get("v.value");
        var newReserv = component.get("v.newReservation");
    
        newReserv.Check_Out__c = checkOut;
        component.set("v.newReservation", newReserv );

    },

})
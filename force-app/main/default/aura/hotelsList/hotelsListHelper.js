({
    initHotelRooms : function(component, event) {
            
        var rooms = component.get("v.freeRooms");
        var hotel = component.get("v.selectedHotel");
        var reserv = component.get("v.newReservation");
        var checkIn = reserv.Check_In__c;
        var checkOut = reserv.Check_Out__c;

        var action = component.get("c.getAvailableRoomsFromHotel");

        action.setParams({

            "checkIn" : checkIn,
            "checkOut" : checkOut,
            "hotelId" : hotel

        });
    
        action.setCallback(this,function(a){
            component.set("v.freeRooms",a.getReturnValue());
        });      
    
        $A.enqueueAction(action);
            
    },

    changeSelectedRoom: function(component, event){

        var val = event.getSource().get("v.value");
        var action = component.get("c.getSelectedRoom");
        
        action.setParams({
            "roomId" : val
        });

        action.setCallback(this, function(result){
            
            var foundRoom = result.getReturnValue();
            component.set("v.selectedRoom", foundRoom.Id);
            
        });
        
        $A.enqueueAction(action);
            
    },

    changeSelectedHotel: function(component, event){
        
        var val = event.getSource().get("v.value");
        var action = component.get("c.getSelectedHotel");
        
        action.setParams({
            "hotelId" : val
        });

        action.setCallback(this, function(result){
            
            var foundHotel = result.getReturnValue();
            component.set("v.selectedHotel", foundHotel.Id);
    
        }); 

        $A.enqueueAction(action);
    }


})

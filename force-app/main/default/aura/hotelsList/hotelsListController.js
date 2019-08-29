({
    initHotels : function(component, event, helper) {
        
        var hotels = component.get("v.hotels");
        var action = component.get("c.getAllHotels");

        action.setCallback(this, function(a){
            component.set("v.hotels", a.getReturnValue());
        });
        
        $A.enqueueAction(action);
    },

    changeSelectedHotel: function(component, event, helper){
        
        helper.changeSelectedHotel(component, event);
        helper.initHotelRooms(component, event);

    },

    changeSelectedRoom: function(component, event, helper){

        helper.changeSelectedRoom(component, event);
            
    },

})

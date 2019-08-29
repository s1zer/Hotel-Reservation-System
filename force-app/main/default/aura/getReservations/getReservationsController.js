({
    doInit : function(component, event, helper) {

        var action = component.get("c.getAllReservations");
        var reservs = component.get("v.allReservations");

        action.setCallback(this,function(a){
            component.set("v.allReservations",a.getReturnValue());
        });       

        $A.enqueueAction(action);

    }
})

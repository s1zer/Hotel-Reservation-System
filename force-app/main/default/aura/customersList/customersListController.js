({
    doInit : function(component, event, helper) {
        
        var customer = component.get("v.customers");
        var action = component.get("c.getAllCustomers");

        action.setCallback(this, function(a){
            component.set("v.customers", a.getReturnValue());
        });

        $A.enqueueAction(action);
    },

    changeSelectedCustomer: function(component, event, helper){
        
        helper.changeSelectedCustomer(component, event);

    },

})

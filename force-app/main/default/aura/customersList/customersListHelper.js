({
    changeSelectedCustomer : function(component, event) {

        var val = event.getSource().get("v.value");
        var action = component.get("c.getSelectedCustomer");
        action.setParams({
            "customerId" : val
        });

        action.setCallback(this, function(result){
            
            var foundCustoer = result.getReturnValue();
            component.set("v.selectedCustomer", foundCustoer.Id);
        });

        $A.enqueueAction(action);

    }
})

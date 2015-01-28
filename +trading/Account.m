classdef Account
    properties
        Profit
    end
    
    methods
        function success = newMarketOrder(obj)
            success = true;
        end
        function success = newPendingOrder(obj)
            success = true;
        end
        function success = modifyOrder(obj)
            success = true;
        end
    end
    
end


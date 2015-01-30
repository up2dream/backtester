classdef Order
    properties
        Ticket = 0
        Type% = OrderType.DEPOSIT
        lots = 0
        Symbol
        OpenTime
        OpenPrice
        StopLoss
        TakeProfit
        CloseTime
        ClosePrice
    end
    methods
        function obj = Order()
            %import trading.*
            obj.Type = OrderType.DEPOSIT;
        end
    end
    methods
        function success = buy(obj)
            success = true;
        end
        function success = sell(obj)
            success = true;
        end
        function success = closePosition(obj)
            success = true;
        end
    end
    
end


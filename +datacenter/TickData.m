classdef TickData
    properties(SetAccess=private)
        symbol
        date
        prices % [open, high, low, close]
    end
    
    methods
        function obj = TickData(symbol, date, prices)
            obj.symbol = symbol;
            obj.date = date;
            obj.prices = prices;
        end
    end
    
end


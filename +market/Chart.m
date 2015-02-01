classdef Chart < handle
    properties
        market
        symbol
        tickPackageSize
        indicators
    end
    
    methods
        function obj = Chart(market, symbol, tickPackageSize)
            obj.market = market;
            obj.symbol = symbol;
            obj.tickPackageSize = tickPackageSize;
            
            addlistener(market.dataCenter, 'DataLoaded', @obj.onDataLoaded);
        end
    end
    
    methods
        function success = addIndicator(obj, indicator)
            success = true;
        end
        function success = removeIndicator(obj, indicator)
            success = true;
        end
    end
    
    methods
        function onDataLoaded(self, source, eventData)
            disp('data loaded in chart');
        end
    end
    
    methods
        function str = key(self)
            str = sprintf('chart_%s_%s', self.symbol.char, self.tickPackageSize.char);
        end
    end
    
    methods(Static)
        function str = calcKey(symbol, tickPackageSize)
            str = sprintf('chart_%s_%s', symbol.char, tickPackageSize.char);
        end
    end
end


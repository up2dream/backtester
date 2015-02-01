classdef Market < handle
    properties(Access=private)
        dataCenter
    end
    
    methods
        function obj = Market(dataCenter)
            obj.dataCenter = dataCenter;
            
            addlistener(obj.dataCenter, 'DataLoaded', @obj.onDataLoaded);
        end
    end
    
    methods
        function chart = getChart(symbol, tickPackageSize)
            chart = [];
        end
    end
    
    methods
        function onDataLoaded(self, source, eventData)
            disp('data loaded');
        end
    end
end


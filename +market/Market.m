classdef(ConstructOnLoad) Market < handle
    properties(Access=private)
        charts
    end
    
    properties(SetAccess=private)
        dataCenter
    end
    
    methods
        function obj = Market(dataCenter)
            obj.dataCenter = dataCenter;
            obj.charts = containers.Map()
            
            addlistener(obj.dataCenter, 'DataLoaded', @obj.onDataLoaded);
        end
    end
    
    methods
        function chart = addChart(self, symbol, tickPackageSize)
            key = market.Chart.calcKey(symbol, tickPackageSize);
            if self.charts.isKey(key) == 1
                chart = self.charts(key);
                return;
            else
                chart = market.Chart(self, symbol, tickPackageSize);
                self.charts(chart.key) = chart;
                return;
            end
        end
    end
    
    methods
        function onDataLoaded(self, source, eventData)
            disp('data loaded');
        end
    end
    
    methods
        function delete(self)
            delete(self.charts)
        end
    end
end


classdef DataCenter
    %DATACENTER 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
    end
    
    methods
        function obj = addSymbol(obj, symbol)
            obj = symbol;
        end
        
        function obj = removeSymbol(obj, symbol)
            obj = false;
        end
        
        function runWorld(obj, dateStart, dateEnd)
        end
        
        function stop(obj)
        end
        
        function pause(obj)
        end
    end
    
end


classdef DataCenter
    %DATACENTER �˴���ʾ�йش����ժҪ
    %   �˴���ʾ��ϸ˵��
    
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


classdef SymbolData
    %SYMBOLDATA �˴���ʾ�йش����ժҪ
    %   �˴���ʾ��ϸ˵��
    
    properties
        symbol
        spread
        lotSize
    end
    
    methods
        function obj = createCursor(obj)
            obj = SymbolCursor();
        end
    end
    
end


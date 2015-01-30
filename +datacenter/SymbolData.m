classdef SymbolData
    %SYMBOLDATA 此处显示有关此类的摘要
    %   此处显示详细说明
    
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


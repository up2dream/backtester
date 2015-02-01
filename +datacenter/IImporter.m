classdef(Abstract) IImporter < handle
    methods(Abstract)
        obj = importData(obj, symbol, startDate, endDate);
    end
end


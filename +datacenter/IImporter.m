classdef(Abstract) IImporter
    methods(Abstract)
        obj = importData(obj, symbol, startDate, endDate);
    end
end


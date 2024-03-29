classdef FTImporter < datacenter.IImporter
    properties
    end
    
    methods
        function data = importData(self, symbol, dateStart, dateEnd)
            dataRow = 1;
            yearStart = year(dateStart);
            yearEnd = year(dateEnd);
            for y = yearStart:yearEnd
                if y == yearStart
                    monthStart = month(dateStart);
                else
                    monthStart = 1;
                end
                if y == yearEnd
                    monthEnd = month(dateEnd);
                else
                    monthEnd = 12;
                end
                for m = monthStart:monthEnd
                    fileName = self.calcDataFileName(symbol, y, m);
                    tmpData = datacenter.impftfile(fileName);
                    [row, ~] = size(tmpData);
                    fprintf('Load data file: %s (%d rows)\n', fileName, row);
                    data(dataRow:dataRow+row-1,:) = tmpData;
                    dataRow = dataRow+row;
                end
            end
        end
    end
    
    methods(Access=private)
        function fileName = calcDataFileName(~, symbol, year, month)
            fileName = sprintf('data/forex-tester/%s-%04d-%02d-1M.txt', symbol, year, month);
        end
    end
end


classdef(ConstructOnLoad) TickEventData < event.EventData
    properties
        tickPackageSize
    end
    
    methods
        function eventData = TickEventData(tickPackageSize)
            eventData.tickPackageSize = tickPackageSize;
        end
    end
end


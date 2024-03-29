classdef DataCenter < handle
    properties(Constant)
        StateType_READY = 0
        StateType_RUNNING = 1
        StateType_PAUSED = 2
        StateType_STOPPED = 3
    end
    
    properties(Access=private)
        requestStop = false
    end
    
    properties(SetAccess=private)
        state = datacenter.DataCenter.StateType_READY
        dateStart
        dateEnd
        symbols = containers.Map()
    end
    
    events
        Tick
        DataLoaded
    end
    
    methods
        function obj = DataCenter()
        end
    end
    
    methods
        function obj = addSymbol(obj, symbol)
            obj.symbols(symbol.char) = [];
        end
        
        function obj = removeSymbol(obj, symbol)
            obj.symbols.remove(symbol.char);
        end
        
        function runWorld(self, dateStart, dateEnd)
            self.dateStart = dateStart;
            self.dateEnd = dateEnd;
            fprintf('Run world sart at %s and end with %s.\n', datestr(dateStart), datestr(dateEnd));
            self.loadAllTickData();
            self.doDataLoop();
            fprintf('DataCenter stopped.\n');
         end
        
        function stop(obj)
            obj.requestStop = true;
        end
        
        function pause(~)
            fprintf('DataCenter paused.');
        end
        
        function resume(~)
            fprintf('DataCenter resumed.\n');
        end
    end
    
    methods(Access=private)
        function doDataLoop(obj)
            while(obj.state == datacenter.DataCenter.StateType_RUNNING && ~obj.requestStop)
                eventData = TickEventData(TickPackageSize.MINUTE_5);
                notify(obj, 'Tick', eventData);
                obj.stop();
            end
        end
        
        function loadAllTickData(obj)
            keys = obj.symbols.keys;
            size = obj.symbols.size;
            for i=1:size
                obj.loadTickData(keys{i});
            end
            
            notify(obj, 'DataLoaded');
        end
        
        function loadTickData(self, symbol)
            imp = datacenter.FTImporter();
            data = imp.importData(symbol, self.dateStart, self.dateEnd);
            self.symbols(symbol) = data;
            delete(imp)
            clear imp
        end
    end
end


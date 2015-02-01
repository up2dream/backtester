clear
clear import
clc
import trading.*
import datacenter.*
import market.*

dataCenter = DataCenter();
dataCenter.addSymbol(Symbol.GBPUSD);
dataCenter.addSymbol(Symbol.EURUSD);

market = Market(dataCenter);

dataCenter.runWorld(datenum('01-jan-2014'), datenum('31-feb-2014'));
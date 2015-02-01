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
market.addChart(Symbol.GBPUSD, TickPackageSize.MINUTE_1);

dataCenter.runWorld(datenum('01-jan-2014'), datenum('28-feb-2014'));
%dataCenter.runWorld(datenum('01-jan-2014'), datenum('31-jan-2014'));

delete(market);
delete(dataCenter);
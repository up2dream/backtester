function GBPUSD2014015M = impftfile(filename, startRow, endRow)
%IMPORTFILE 将文本文件中的数值数据作为矩阵导入。
%   GBPUSD2014015M = IMPORTFILE(FILENAME) 读取文本文件 FILENAME 中默认选定范围的数据。
%
%   GBPUSD2014015M = IMPORTFILE(FILENAME, STARTROW, ENDROW) 读取文本文件 FILENAME
%   的 STARTROW 行到 ENDROW 行中的数据。
%
% Example:
%   GBPUSD2014015M = importfile('GBPUSD-2014-01-5M.txt', 2, 5966);
%
%    另请参阅 TEXTSCAN。

% 由 MATLAB 自动生成于 2015/01/24 22:44:02

%% 初始化变量。
delimiter = ',';
if nargin<=2
    startRow = 2;
    endRow = inf;
end

%% 每个文本行的格式字符串:
%   列2: 日期字符串 (%s)
%	列3: 日期字符串 (%s)
%   列4: 双精度值 (%f)
%	列5: 双精度值 (%f)
%   列6: 双精度值 (%f)
%	列7: 双精度值 (%f)
% 有关详细信息，请参阅 TEXTSCAN 文档。
formatSpec = '%*s%s%s%f%f%f%f%*s%[^\n\r]';

%% 打开文本文件。
fileID = fopen(filename,'r');

%% 根据格式字符串读取数据列。
% 该调用基于生成此代码所用的文件的结构。如果其他文件出现错误，请尝试通过导入工具重新生成代码。
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% 关闭文本文件。
fclose(fileID);

%% 对无法导入的数据进行的后处理。
% 在导入过程中未应用无法导入的数据的规则，因此不包括后处理代码。要生成适用于无法导入的数据的代码，请在文件中选择无法导入的元胞，然后重新生成脚本。

%% 使用日期格式字符串(datenum)将带有日期的列内容转换为日期序列值。
dataArray{1} = datenum(strcat(dataArray{1}, dataArray{2}), 'yyyymmddHHMMSS');
%dataArray(2) = [];
%% 创建输出变量
%GBPUSD2014015M = [dataArray{1:end-1}];
GBPUSD2014015M = [dataArray{1}, dataArray{3}, dataArray{4}, dataArray{5}, dataArray{6}];

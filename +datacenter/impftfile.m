function GBPUSD2014015M = impftfile(filename, startRow, endRow)
%IMPORTFILE ���ı��ļ��е���ֵ������Ϊ�����롣
%   GBPUSD2014015M = IMPORTFILE(FILENAME) ��ȡ�ı��ļ� FILENAME ��Ĭ��ѡ����Χ�����ݡ�
%
%   GBPUSD2014015M = IMPORTFILE(FILENAME, STARTROW, ENDROW) ��ȡ�ı��ļ� FILENAME
%   �� STARTROW �е� ENDROW ���е����ݡ�
%
% Example:
%   GBPUSD2014015M = importfile('GBPUSD-2014-01-5M.txt', 2, 5966);
%
%    ������� TEXTSCAN��

% �� MATLAB �Զ������� 2015/01/24 22:44:02

%% ��ʼ��������
delimiter = ',';
if nargin<=2
    startRow = 2;
    endRow = inf;
end

%% ÿ���ı��еĸ�ʽ�ַ���:
%   ��2: �����ַ��� (%s)
%	��3: �����ַ��� (%s)
%   ��4: ˫����ֵ (%f)
%	��5: ˫����ֵ (%f)
%   ��6: ˫����ֵ (%f)
%	��7: ˫����ֵ (%f)
% �й���ϸ��Ϣ������� TEXTSCAN �ĵ���
formatSpec = '%*s%s%s%f%f%f%f%*s%[^\n\r]';

%% ���ı��ļ���
fileID = fopen(filename,'r');

%% ���ݸ�ʽ�ַ�����ȡ�����С�
% �õ��û������ɴ˴������õ��ļ��Ľṹ����������ļ����ִ����볢��ͨ�����빤���������ɴ��롣
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% �ر��ı��ļ���
fclose(fileID);

%% ���޷���������ݽ��еĺ�����
% �ڵ��������δӦ���޷���������ݵĹ�����˲������������롣Ҫ�����������޷���������ݵĴ��룬�����ļ���ѡ���޷������Ԫ����Ȼ���������ɽű���

%% ʹ�����ڸ�ʽ�ַ���(datenum)���������ڵ�������ת��Ϊ��������ֵ��
dataArray{1} = datenum(strcat(dataArray{1}, dataArray{2}), 'yyyymmddHHMMSS');
%dataArray(2) = [];
%% �����������
%GBPUSD2014015M = [dataArray{1:end-1}];
GBPUSD2014015M = [dataArray{1}, dataArray{3}, dataArray{4}, dataArray{5}, dataArray{6}];
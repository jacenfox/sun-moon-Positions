function xx = LunarCalendar(y,m,d)
%  function xx = LunarCalendar(y,m,d)
%  
%
if nargin==0;
    cccc=clock;
    y=cccc(1);m=cccc(2);d=cccc(3);
else if ischar(y)
        y = str2num(y); m = str2num(m); d = str2num(d);
    end
end

% Animals={'鼠','牛','虎','兔','龙','蛇','马','羊','猴','鸡','狗','猪'};
% CnDayStr={'初一', '初二', '初三', '初四', '初五', ...
%         '初六', '初七', '初八', '初九', '初十', ...
%         '十一', '十二', '十三', '十四', '十五', ...
%         '十六', '十七', '十八', '十九', '二十', ...
%         '廿一', '廿二', '廿三', '廿四', '廿五', ...
%         '廿六', '廿七', '廿八', '廿九', '三十'};
CnDayStr={'LD01', 'LD02', 'LD03', 'LD04', 'LD05', ...
        'LD06', 'LD07', 'LD08', 'LD09', 'LD10', ...
        'LD11', 'LD12', 'LD13', 'LD14', 'LD15', ...
        'LD16', 'LD17', 'LD18', 'LD19', 'LD20', ...
        'LD21', 'LD22', 'LD23', 'LD24', 'LD25', ...
        'LD26', 'LD27', 'LD28', 'LD29', 'LD30'};
% CnMonthStr= { '正', '二', '三', '四', '五', '六', '七', '八', '九', '十', '冬', '腊'};
CnMonthStr= { 'LM01', 'LM02', 'LM03', 'LM04', 'LM05', 'LM06', ...
              'LM07', 'LM08', 'LM09', 'LM10', 'LM11', 'LM12'};

monthName = {'JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC'}; 
lunarInfo=[19416,19168,42352,21717,53856,55632,91476,22176,39632,21970, ...
        19168,42422,42192,53840,119381,46400,54944,44450,38320,84343, ...
        18800,42160,46261,27216,27968,109396,11104,38256,21234,18800, ...
        25958,54432,59984,28309,23248,11104,100067,37600,116951,51536, ...
        54432,120998,46416,22176,107956,9680,37584,53938,43344,46423, ...
        27808,46416,86869,19872,42448,83315,21200,43432,59728,27296, ...
        44710,43856,19296,43748,42352,21088,62051,55632,23383,22176, ...
        38608,19925,19152,42192,54484,53840,54616,46400,46496,103846, ...
        38320,18864,43380,42160,45690,27216,27968,44870,43872,38256, ...
        19189,18800,25776,29859,59984,27480,21952,43872,38613,37600, ...
        51552,55636,54432,55888,30034,22176,43959,9680,37584,51893, ...
        43344,46240,47780,44368,21977,19360,42416,86390,21168,43312, ...
        31060,27296,44368,23378,19296,42726,42208,53856,60005,54576, ...
        23200,30371,38608,19415,19152,42192,118966,53840,54560,56645, ...
        46496,22224,21938,18864,42359,42160,43600,111189,27936,44448]; 
lYearDays=[384,354,355,383,354,355,384,354,355,384, ...
        354,384,354,354,384,354,355,384,355,384, ...
        354,354,384,354,354,385,354,355,384,354, ...
        383,354,355,384,355,354,384,354,384,354, ...
        354,384,355,354,385,354,354,384,354,384, ...
        354,355,384,354,355,384,354,383,355,354, ...
        384,355,354,384,355,353,384,355,384,354, ...
        355,384,354,354,384,354,384,354,355,384, ...
        355,354,384,354,384,354,354,384,355,355, ...
        384,354,354,383,355,384,354,355,384,354, ...
        354,384,354,355,384,354,385,354,354,384, ...
        354,354,384,355,384,354,355,384,354,354, ...
        384,354,355,384,354,384,354,354,384,355, ...
        354,384,355,384,354,354,384,354,354,384, ...
        355,355,384,354,384,354,354,384,354,355]; 
leapDays=[29,0,0,29,0,0,30,0,0,29, ...
        0,29,0,0,30,0,0,29,0,30, ...
        0,0,29,0,0,30,0,0,29,0, ...
        29,0,0,29,0,0,30,0,30,0, ...
        0,30,0,0,30,0,0,29,0,29, ...
        0,0,30,0,0,30,0,29,0,0, ...
        29,0,0,29,0,0,29,0,29,0, ...
        0,29,0,0,29,0,29,0,0,30, ...
        0,0,29,0,29,0,0,29,0,0, ...
        29,0,0,29,0,29,0,0,29,0, ...
        0,29,0,0,29,0,29,0,0,29, ...
        0,0,29,0,29,0,0,30,0,0, ...
        29,0,0,29,0,29,0,0,29,0, ...
        0,29,0,29,0,0,30,0,0,29, ...
        0,0,29,0,29,0,0,30,0,0]; 
leapMonth=[8,0,0,5,0,0,4,0,0,2, ...
        0,6,0,0,5,0,0,2,0,7, ...
        0,0,5,0,0,4,0,0,2,0, ...
        6,0,0,5,0,0,3,0,7,0, ...
        0,6,0,0,4,0,0,2,0,7, ...
        0,0,5,0,0,3,0,8,0,0, ...
        6,0,0,4,0,0,3,0,7,0, ...
        0,5,0,0,4,0,8,0,0,6, ...
        0,0,4,0,10,0,0,6,0,0, ...
        5,0,0,3,0,8,0,0,5,0, ...
        0,4,0,0,2,0,7,0,0,5, ...
        0,0,4,0,9,0,0,6,0,0, ...
        4,0,0,2,0,6,0,0,5,0, ...
        0,3,0,7,0,0,6,0,0,5, ...
        0,0,2,0,7,0,0,5,0,0];
  
offset=datenum(y,m,d)-datenum(1900,1,31)+1; 
dayCyl = offset + 40;
monCyl = 14; 

cumLYearDays=cumsum([0,lYearDays]);
LunarYear=find(offset>cumLYearDays);
LunarYear=LunarYear(end);
monCyl=monCyl+(LunarYear-1)*12;yearCyl = LunarYear+36; 
offset=offset-cumLYearDays(LunarYear); 
monthDays=[29,30];
monthDays=monthDays((bitand(lunarInfo(LunarYear),bitshift (65536,-(1:12)))~=0)+1); 
leap = leapMonth(LunarYear);
if leap,
    monthDays=[monthDays(1:leap),leapDays(LunarYear),monthDays(leap+1:end)];
end
cumMonthDays=cumsum([0,monthDays]);
LunarMonth=find(offset>cumMonthDays);LunarMonth=LunarMonth(end);
offset=offset-cumMonthDays(LunarMonth);
ch_run_ch='';
if leap 
    if LunarMonth==(leap+1)
        ch_run_ch='loop'; 
    end
    if (LunarMonth>leap)
        LunarMonth=LunarMonth-1;
    end
end
monCyl=monCyl+LunarMonth;
xx=['LunarDate:',CnMonthStr{LunarMonth},':',CnDayStr{offset},''];
% xx=['农历',Animals{rem(yearCyl-1,12)+1},'年',ch_run_ch,CnMonthStr{LunarMonth},'月',CnDayStr{offset}];
% xx={xx;[cyclical(yearCyl),'年  ',cyclical(monCyl),'月  ',cyclical(dayCyl),'日']};
return 

function ganzhi=cyclical(num)
Gan={'甲','乙','丙','丁','戊','己','庚','辛','壬','癸'};
Zhi={'子','丑','寅','卯','辰','巳','午','未','申','酉','戌','亥'};
ganzhi=[Gan{rem(num-1,10)+1},Zhi{rem(num-1,12)+1}];
 
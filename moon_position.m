function moon = moon_position(time, location)
% moon = moon_position(time, location)
%
% Input parameters:
%   time: a structure that specify the time when the moon position is
%   calculated. 
%       time.year: year. 
%       time.month: month [1-12]
%       time.day: calendar day [1-31]
%       time.hour: local hour [0-23]
%       time.min: minute [0-59]
%       time.sec: second [0-59]
%       time.UTC: offset hour from UTC. Local time = Greenwich time + time.UTC
%   location: a structure that specify the location of the observer
%       location.latitude: latitude (in degrees, north of equator is
%       positive)
%       location.longitude: longitude (in degrees, positive for east of
%       Greenwich)
%       location.altitude: altitude above mean sea level (in meters) 
% 
% Output parameters
%   moon: a structure with the calculated moon position
%       moon.zenith = El (Elevation location of the moon in degrees)
%                       % clockwise from north
%       moon.azimuth = Az (Azimuth location of the moon in degrees)
%                       % up from the vertical
% Exemple of use
% 
% location.latitude = 40.18;
% location.longitude = -82.41;
% location.altitude = 10.14;
% time.year = 2014;
% time.month = 11;
% time.day = 11;  
% time.hour = 21;
% time.min = 30;
% time.sec = 30;
% time.UTC = -4;
%
% moon = moon_position(time, location);
%
% see also sun_position
%

Lat = location.latitude;
Lon = location.longitude;
Alt = location.altitude;


local_time = sprintf('%d/%d/%d %d:%d:%d',...
                time.year,time.month,time.day,...
                time.hour,time.min,time.sec);
localTimeNum = datenum(local_time);
utc = sprintf('Jan-0-0000 %02d:00:00',abs(time.UTC));
UTCNum = datenum(utc);
if time.UTC >=0
    UTCtimeNum = localTimeNum - UTCNum;
else
    UTCtimeNum = localTimeNum + UTCNum;
end
UTCtime = datestr(UTCtimeNum,'yyyy/mm/dd HH:MM:SS');

%Input Description:
% UTC (Coordinated Universal Time YYYY/MM/DD hh:mm:ss)
% Lat (Site Latitude in degrees -90:90 -> S(-) N(+))
% Lon (Site Longitude in degrees -180:180 W(-) E(+))
% Altitude of the site above sea level (km)
[Az, El] = LunarAzEl(UTCtime,Lat,Lon,Alt);

%Output Description:
%Az (Azimuth location of the moon in degrees)
%El (Elevation location of the moon in degrees)
moon.azimuth = Az;
moon.zenith = 90 - El;


end


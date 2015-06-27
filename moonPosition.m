function  moon = moonPosition(time, location)
% Wrapper around moon_position that returns angles in radians.
%
%   moon = moonPosition(time, location)
%
% The coordinate system is: 
%      
%     ^ y
%     |
%     |
%     .----> x
%    /
%   v
%     z 
%
% where
%   x = west   
%   y = up
%   z = north
%   
%
%
%
% See also:
%   moon_position
%   sunPosition
% ----------


moon = moon_position(time, location); 

moon.zenith = moon.zenith*pi/180;
moon.azimuth = -moon.azimuth*pi/180;
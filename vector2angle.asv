function [angle_in_degrees] = vector2angle(u,v)
a=u.^2;
b=v.^2;
a=sqrt(sum(a));
b=sqrt(sum(b));
 angle_in_degrees=acos(dot(u,v)/(a*b))*180/pi;
end
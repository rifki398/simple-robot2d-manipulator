function [the1,the2] = InverseKin(l1,l2,x,y)

% check fot singularity
r = sqrt(x^2 + y^2);

if r > (l1+l2)
    error('Initial position is unreachable')
elseif r < abs(l1-l2)
    error('Initial osition is too close')
end

cos_the2 = (x^2 + y^2 - l1^2 - l2^2)/(2*l1*l2);
the2 = acos(cos_the2);

k1 = l1 + l2*cos(the2);
k2 = l2 * sin(the2);

the1 = atan2(y,x) - atan2(k2,k1);

% Normalize if necessary
% the1 = mod(the1,2*pi);
% the2 = mod(the2,2*pi);

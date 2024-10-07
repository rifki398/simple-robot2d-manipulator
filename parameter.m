% Parameter
g = 9.81;
m1 = 1; %Mass of link 1.
m2 = 1; %Mass of link 2.
l1 = 1; %Total length of link 1.
l2 = 1; %Total length of link 2.
d1 = l1/2; %Center of mass distance along link 1 from the fixed joint.
d2 = l2/2; %Center of mass distance along link 2 from the fixed joint.
I1 = 1/12*m1*l1^2; %Moment of inertia of link 1 about COM
I2 = 1/12*m2*l2^2; %Moment of inertia of link 2 about COM

% Control Gain
Kpx = 400;
Kvx = 150;

Kpy = 400;
Kvy = 150;

% Find theta initial using inverse kinematics
[the1_init,the2_init] = InverseKin(l1,l2,x_init,y_init);

% [the1 the1dot the2 the2dot]
the_init = [the1_init 0 the2_init 0];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% Moh Rifqy Risqullah
% Departement of Electrical Engineering (Control System Engineering)
% Institut Teknologi Sepuluh Nopember
% 2024
%
%%%%%%% Simple 2D Robot Arm Manipulator Control With PD Controller %%%%%%%%
%
% Files:
% main - Execute this file.
%
% parameter -- Contain all parameters of robotic arm. Include control gain
% (this file automatically run).
%
% plotEE -- A script to plotting end-effector position based on simulation
% time (this file automatically run).
%   
% ArmPlot -- A script to visualize robotic arm in 2D cartesian coordinate.
%
% Simulasi_DIY -- Simulink file to simulate robotic arm.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all
clear
clc

% Initial value of joint angle
x_init = 0.70711;
y_init = 1.7071;

% Desired end-effector
xt = -1;
yt = 1;

parameter;

mdl = "Simulasi_DIY";
load_system(mdl);
out = sim(mdl);

plotEE;
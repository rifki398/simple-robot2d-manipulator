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
the_init = [pi/4    0.0    pi/4  0.0]';

parameter;

mdl = "Simulasi_DIY";
load_system(mdl);
out = sim(mdl);

plotEE;
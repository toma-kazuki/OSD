%% Initial setup 
%
%/*************************************************************************
%* Programmer    : Kazuki Toma
%* Title         : setup.m
%* Affiliation   : NAKASUKA/FUNASE LAB
%* Creation Date : 2024/1/6
%* Recent upDate : 2024/1/6
%* Language      : Matlab
%* Version       : 1.0.0
%**************************************************************************

disp("Start setting");

%% BASEPATH LOADING 
disp("Load baseProjectPath...");
baseProjectPath = pwd;%getUserPaths();

%% PROJECT PATH SETTINGS
addpath(genpath(fullfile(baseProjectPath,'function')));
addpath(genpath(fullfile(baseProjectPath,'images')));
addpath(genpath(fullfile(baseProjectPath,'out')));
addpath(genpath(fullfile(baseProjectPath,'scripts')));

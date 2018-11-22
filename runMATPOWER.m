clear; clc; close all; 
addpath(genpath('matpower7.0b1')); addpath(genpath('cvx')); addpath(genpath('SC_Cases')); 
addpath(genpath('IEEECases')); addpath(genpath('readMatPower')); addpath(genpath('Results')); 
addpath(genpath('C:\Users\plus0002\OneDrive\PhD\DTUproject\cvx\functions\vec_'))  
rmpath('cvx/lib/narginchk_') % remove this function to avoid a potential name conflict 
%checkcode Guggilam -cyc %% -> Applies McCabe Complexity (should keep below 10)  
% ===================== SETTINGS ======================
multiPer = 1; % 1: multiperiod model, 0: discretised model 
per = 26; % for discretised model, which period to test? 26: 1pm (30min intervals) 
plotting = 1; % 1: YES, 0: NO 
%solarCap = [0 0.4 0.7 1 1.2 1.5 1.8 2.1 2.4 2.7 3.0 3.3 3.6]; % solar PV capacity multiplier
%solarCap = 2; i = 1; % solar PV capacity multiplier 
%% Defines the number of periods and allocates memory
if multiPer == 1
    T = 48; % 26 is 1pm
    T0 = 1;
else
    T = 1; 
end
%% No of Scenarios
testCase = IEEE_18BUS_PV; 
% ===============
% testCase = matpower_LV_semiurban; % works fine
% testCase = matpower_rural; % that's a big one, only MatPower
% network2 = networkViz(testCase); % network viz
% Load Data
[solar, solarTotal, solarGen, loadHH, loadTotal, timestamp, penetration, nBuses] = dataInput(testCase, solarCap(i), PVcap);
%% MATPOWER power flow
ACOPFsolver = 1; % 1: exact ACOPF, 2: backward/forward sweep with I summation
PF = 0.85;
[ACOPF_struct, ACOPF_V, ACOPF_I2R, ACOPF_f, ACOPF_PVgen, ACOPF_Qg, ACOPF_I, ACOPF_Vdrop, ACOPF_struct_container] = ACOPF(testCase, T, T0, solar, loadHH, ACOPFsolver, multiPer, per, PF);

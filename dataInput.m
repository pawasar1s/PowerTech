function [solar, solarInstalled, solarGen, loadHH, loadTotal, penetration, nBuses, Pd12, temp] = dataInput(testCase, solarCap, PVcap, T)
%% inputs
load('loadData60min.mat', 'tttt'); load('solarProfile.mat', 'solarHH'); % load input files
load('Gug_solar.mat','P_pv');
%load('timeStamp.mat', 'timestamp');
nBuses = size(testCase.bus,1)-1;
%timestamp = table2array(all30min(1:48,1));
solar = table2array(solarHH); % normalised solar output
solar = solar*solarCap; % multiply by capacity increase coeficient
solar = solar(2:2:end,:);
%solar = ones(24,1)*P_pv(8,:);
%T = length(solar); % number of periods
if nBuses < 25 
    loadtable = tttt(1:24,[3:4 6:7 9:13 15 18:19 21:24 26:27]);
    loadHH = table2array(loadtable)*1.1; % household load, x 2 because 30min data
    loadHH(16:20,:) = loadHH(16:20,:)*1.4;
    loadTotal = sum(loadHH,2); % aggregated load
else
    loadHH = testCase.bus(:,3); % household load
    loadTotal = sum(loadHH,2); % aggregated loads
end
%
%loadHH = ones(24,18)*0.0535; % for Gug data
%
idxPV = find(testCase.bus(:,2) == 2); % find index for buses with PV systems
Pd12 = zeros(T, nBuses-1);
%Qd12 = zeros(T, nBuses-1);
Pd12(1:T,idxPV-1) = loadHH(1:T,idxPV-1); % Pg
%Qd12(1:T,idxPV-1) = loadHH(1:T,idxPV-1); % Qg: 0.6*Pg - assumed
% Peak load and peak solar 
solarInstalled = sum(PVcap)*solarCap;
loadP = sum(Pd12(solarInstalled == max(solarInstalled),:));
temp = zeros(length(solar),length(PVcap));
for j = 1 : length(solar)
    temp(j,:) = solar(j)*PVcap;
end 
solarGen = sum(temp(:));
penetration = solarInstalled/loadP;
nBuses = size(testCase.bus,1);
%%
% figure(12); plot(1:length(solar), sum(Pd12,2)); hold on; plot(1:length(solar), sum(PVcap)*solar);
% ylabel('Active power [kW]'); xlabel('Time')
% legend({'Load','Solar PV'},'Location','Northwest')
% title('Load vs Solar PV')
% xlim([1 length(solar)])
% set(gcf,'color','w'); grid on
end
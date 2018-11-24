%% load data
clear all; close all;
load('OID_relocation_I2R.mat');
load('OID_relocation_Pc.mat');
load('OID_relocation_Pen.mat');
load('VAR_relocation_I2R.mat');
load('VAR_relocation_Pc.mat');
load('VAR_relocation_Pen.mat');
%%
xval = OID_relocation_Pen.Var1';
for k = 1 : size(OID_relocation_Pc.store_Gug_PcHH,1)
    for i = 1 : size(OID_relocation_Pc.store_Gug_PcHH,2)
        OID_sum_PcHH{k,i} = sum(OID_relocation_Pc.store_Gug_PcHH{k,i},2);
        OID_sum_I2R{k,i} = sum(OID_relocation_I2R.store_Gug_I2R{k,i},2);
        VAR_sum_PcHH{k,i} = sum(VAR_relocation_Pc.store_VAR_PcHH{k,i},2);
        VAR_sum_I2R{k,i} = sum(VAR_relocation_I2R.store_VAR_I2R{k,i},2);
    end
end
OID_sum_PcHH = cell2mat(OID_sum_PcHH);
OID_sum_I2R = cell2mat(OID_sum_I2R);
VAR_sum_PcHH = cell2mat(VAR_sum_PcHH);
VAR_sum_I2R = cell2mat(VAR_sum_I2R);
%
temp_OIDhh = reshape(OID_relocation_Pc.store_Gug_PcHH, [], 1);
temp_VARhh = reshape(VAR_relocation_Pc.store_VAR_PcHH, [], 1);
OID_HHbox = cell2mat(temp_OIDhh); 
VAR_HHbox = cell2mat(temp_VARhh); 
%% BoxPlot for Curtailment and Line losses 
figure(1)
boxplot(OID_sum_PcHH)
ylabel('Curtailment [p.u.]'); xlabel('Penetration [%]')
title('Solar PV Curtailment OID')
set(gcf,'color','w'); grid on
figure(2)
boxplot(VAR_sum_PcHH)
ylabel('Curtailment [p.u.]'); xlabel('Penetration [%]')
title('Solar PV Curtailment VOlt/VAr')
set(gcf,'color','w'); grid on
%% plot(xval,(abs(VAR_sum_Pcap)),'k--','LineWidth',1)
figure(3)
boxplot(real(OID_sum_I2R))
ylabel('Line Losses [p.u.]'); xlabel('Penetration [%]')
title('Total Line losses OID')
set(gcf,'color','w'); grid on
figure(4)
boxplot(real(VAR_sum_I2R))
ylabel('Line Losses [p.u.]'); xlabel('Penetration [%]')
title('Total Line losses VOlt/VAr')
set(gcf,'color','w'); grid on
%% BoxPlot for Curtailment and Line losses 
figure(5)
boxplot(OID_HHbox)
ylabel('Curtailment [p.u.]'); xlabel('House')
title('Solar PV Curtailment OID')
set(gcf,'color','w'); grid on
figure(6)
boxplot(VAR_HHbox)
ylabel('Curtailment [p.u.]'); xlabel('House')
title('Solar PV Curtailment VOlt/VAr')
set(gcf,'color','w'); grid on
%%
% rng default
% PVsizeVec = [3 3 3 5 5 5 5 9 9 9 9 9];
% for k = 1 : 5
%     permVec = randperm(12); % returns a row vector containing a random permutation of the integers from 1 to n inclusive.
%     PVsizeVec = PVsizeVec(permVec)
%     testCase = IEEE_18BUS_PV; 
%     testCase.gen(2:end,9) = PVsizeVec*0.77;
% end
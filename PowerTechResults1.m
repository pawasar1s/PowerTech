%% load data
clear all; close all;
addpath(genpath('IEEECases'));
load('output\OID_V_1pm_no.mat');
load('output\OID_PQ_1pm.mat');
load('output\OID_I2R_1pm.mat'); 
load('output\OID_penet_1pm.mat');
% %%
load('output\VARx_V_1pm.mat'); 
load('output\VARx_PQ_1pm.mat'); 
load('output\VARx_I2R_1pm.mat'); 
load('output\VARx_penet_1pm.mat'); 
%
load('output\OIDf_V_1pm_no.mat'); 
load('output\OIDf_PQ_1pm.mat');
load('output\OIDf_I2R_1pm.mat'); 
load('output\OIDf_penet_1pm.mat');
%OID_I2R_1pm.Properties.VariableNames
% VAR_I2R_1pm.Properties.VariableNames
%
testCase = IEEE_18BUS_PV; 
Sbase = testCase.baseMVA; 
Ibase = testCase.Ibase; 
% Set inputs
for i=1:length(OID_I2R_1pm.store_Gug_I2R)
    OID_sum_I2R{i}=sum(OID_I2R_1pm.store_Gug_I2R{i},2);
    OID_sum_Sreal{i}=sum(OID_I2R_1pm.store_Gug_Sreal{i},2);
    OID_sum_Preal{i}=sum(OID_I2R_1pm.store_Gug_Preal{i},2);
    OID_sum_Pcap{i}=sum(OID_I2R_1pm.store_Gug_Pcap{i},2);
    OID_sum_Scap{i}=sum(OID_I2R_1pm.store_Gug_Scap{i},2);
    OID_sum_Pinj{i}=sum(OID_I2R_1pm.store_Gug_Pinj{i},2); 
    OID_sum_PcHH{i}=sum(OID_I2R_1pm.store_Gug_PcHH{i},2); 
    VAR_sum_I2R{i}=sum(VAR_I2R_1pm.store_VAR_I2R{i},2);
    VAR_sum_Sreal{i}=sum(VAR_I2R_1pm.store_VAR_Sreal{i},2);
    VAR_sum_Preal{i}=sum(VAR_I2R_1pm.store_VAR_Preal{i},2);
    VAR_sum_Pcap{i}=sum(VAR_I2R_1pm.store_VAR_Pcap{i},2);
    VAR_sum_Scap{i}=sum(VAR_I2R_1pm.store_VAR_Scap{i},2);
    VAR_sum_Pinj{i}=sum(VAR_I2R_1pm.store_VAR_Pinj{i},2); 
    VAR_sum_PcHH{i}=sum(VAR_I2R_1pm.store_VAR_PcHH{i},2); 
    OIDf_sum_I2R{i}=sum(OIDf_I2R_1pm.store_Gug_I2R{i},2);
    OIDf_sum_Sreal{i}=sum(OIDf_I2R_1pm.store_Gug_Sreal{i},2);
    OIDf_sum_Preal{i}=sum(OIDf_I2R_1pm.store_Gug_Preal{i},2);
    OIDf_sum_Pcap{i}=sum(OIDf_I2R_1pm.store_Gug_Pcap{i},2);
    OIDf_sum_Scap{i}=sum(OIDf_I2R_1pm.store_Gug_Scap{i},2);
    OIDf_sum_Pinj{i}=sum(OIDf_I2R_1pm.store_Gug_Pinj{i},2); 
    OIDf_sum_PcHH{i}=sum(OIDf_I2R_1pm.store_Gug_PcHH{i},2); 
    
end
%
OID_sum_I2R = cell2mat(OID_sum_I2R);
OID_sum_Sreal = cell2mat(OID_sum_Sreal);
OID_sum_Preal = cell2mat(OID_sum_Preal);
OID_sum_Pcap = cell2mat(OID_sum_Pcap);
OID_sum_Scap = cell2mat(OID_sum_Scap);
OID_sum_Pinj = cell2mat(OID_sum_Pinj);
%
VAR_sum_I2R = cell2mat(VAR_sum_I2R);
VAR_sum_Sreal = cell2mat(VAR_sum_Sreal);
VAR_sum_Preal = cell2mat(VAR_sum_Preal);
VAR_sum_Pcap = cell2mat(VAR_sum_Pcap);
VAR_sum_Scap = cell2mat(VAR_sum_Scap);
VAR_sum_Pinj = cell2mat(VAR_sum_Pinj);
%
OIDf_sum_I2R = cell2mat(OIDf_sum_I2R);
OIDf_sum_Sreal = cell2mat(OIDf_sum_Sreal);
OIDf_sum_Preal = cell2mat(OIDf_sum_Preal);
OIDf_sum_Pcap = cell2mat(OIDf_sum_Pcap);
OIDf_sum_Scap = cell2mat(OIDf_sum_Scap);
OIDf_sum_Pinj = cell2mat(OIDf_sum_Pinj);
%
OID_sum_Pc = OID_PQ_1pm.store_Gug_Pc;
OID_sum_Qc = OID_PQ_1pm.store_Gug_Qc;
VAR_sum_Pc = VAR_PQ_1pm.store_VAR_Pc;
VAR_sum_Qc = VAR_PQ_1pm.store_VAR_Qc;
OIDf_sum_Pc = OIDf_PQ_1pm.store_Gug_Pc;
OIDf_sum_Qc = OIDf_PQ_1pm.store_Gug_Qc;
%
%temp_VAR_PF = reshape(VAR_I2R_1pm.store_VAR_PF, [], 1);
%VAR_PF = cell2mat(temp_VAR_PF); 
%figure(1); plot(VAR_PF')
%
OID_Qplot = OID_sum_Sreal' - OID_sum_Pinj';
VAR_Qplot = VAR_sum_Sreal' - VAR_sum_Pinj';
OIDf_Qplot = OIDf_sum_Sreal' - OIDf_sum_Pinj';
nScen = length(OID_I2R_1pm.store_Gug_I2R);
nBuses = 19;
xval = OID_penet_1pm.Var1';
%% FIGURE 1: Voltage Profile (OID vs Volt/VAR)
% figure(401)
% plot(1:nBuses, OID_I2R_1pm.store_Gug_V{ceil(1/2*nScen)},'k')
% hold on
% plot(1:nBuses, OID_I2R_1pm.store_Gug_V{ceil(2/3*nScen)},'b')
% plot(1:nBuses, OID_I2R_1pm.store_Gug_V{nScen},'r')
% plot(1:nBuses, VAR_I2R_1pm.store_VAR_V{ceil(1/2*nScen)},'k--')
% plot(1:nBuses, VAR_I2R_1pm.store_VAR_V{ceil(2/3*nScen)},'b--')
% plot(1:nBuses, VAR_I2R_1pm.store_VAR_V{nScen},'r--')
% ylabel('Voltage Magnitude [p.u.]'); xlabel('Bus')
% legend({strcat('Low Pen. Scen.: ', num2str(ceil(1/2*nScen))),...
%     strcat('Med Pen. Scen.: ', num2str(ceil(2/3*nScen))),...
%     strcat('High Pen. Scen.: ', num2str(ceil(3/3*nScen)))},'Location','Southeast')
% title('Voltage profile')
% xlim([1 19])
% set(gcf,'color','w'); grid on
% set(gca,'FontSize',14)

%% FIGURE 2: Pole-to-pole Line Losses
% figure(107)
% cov1 = bar([OID_I2R_1pm.store_Gug_I2R{ceil(1/3*nScen)}(:,[1 4 7 10 13 16])', VAR_I2R_1pm.store_VAR_I2R{ceil(1/3*nScen)}(:,[1 4 7 10 13 16])',...
%     OID_I2R_1pm.store_Gug_I2R{ceil(2/3*nScen)}(:,[1 4 7 10 13 16])', VAR_I2R_1pm.store_VAR_I2R{ceil(2/3*nScen)}(:,[1 4 7 10 13 16])',...
%     OID_I2R_1pm.store_Gug_I2R{nScen}(:,[1 4 7 10 13 16])', VAR_I2R_1pm.store_VAR_I2R{nScen}(:,[1 4 7 10 13 16])']);hold on % 312.5 is Ibase
% cov1(1).FaceColor = 'b'; cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% cov1(2).FaceColor = 'r'; cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
% ylabel('Active power [p.u.]'); xlabel('Pole-to-pole lines')
% legend({'OID 1pm 100%','Volt/VAR 1pm 100%', 'OID 1pm 200%','Volt/VAR 1pm 200%', 'OID 1pm 300%','Volt/VAR 1pm 300%',},'Location','Northeast')
% title('Pole-to-Pole Line Losses'); set(gcf,'color','w'); grid on
%% FIGURE 2: Line Losses
% figure(107)
% colorstring = 'cgbrk';
% indx =[ 1 ceil(1/4*nScen) ceil(2/4*nScen) ceil(3/4*nScen) nScen];
% for i = 1 : length(indx)
% fig107 = plot(1:6, OID_I2R_1pm.store_Gug_I2R{indx(i)}(:,[1 4 7 10 13 16]),'--*','Color', colorstring(i));
% fig108 = plot(1:6, VAR_I2R_1pm.store_VAR_I2R{indx(i)}(:,[1 4 7 10 13 16]),'-*','Color', colorstring(i));
% hold on 
% end
% %set(fig107, {'color'}, {'b'; 'r'; 'k';'y';'c'}); set(fig108, {'color'}, {'b'; 'r'; 'k'; 'y';'c'});
% ylabel('Line Power Loss [kW]'); xlabel('Pole-to-pole lines')
% legend({'0% OID & Volt/VAr', '90% OID','90% Volt/VAr','180% OID','180% Volt/VAr'...
%     '270% OID','270% Volt/VAr', '360% OID','360% Volt/VAr'},'Location','Northeast')
% title('Pole-to-Pole Line Losses'); set(gcf,'color','w'); grid on
%%
% figure(121)
% plot(1:nScen, OID_PQ_1pm.store_Gug_Pg(:,:))
% hold on 
% plot(1:nScen, OID_PQ_1pm.store_Gug_Pc(:,:))
%% FIGURE 2: Inverter Power Losses
figure(402)
VAR_Plosscell  = cellfun(@minus,VAR_I2R_1pm.store_VAR_Preal,VAR_I2R_1pm.store_VAR_Pinj,'Un',false);
VAR_Plosscell = cell2mat(VAR_Plosscell)*Sbase;
VAR_PlossInd = reshape(VAR_Plosscell, [], nScen);
VAR_PlossInd (VAR_PlossInd   < 0) = 0;
VAR_Ploss = sum(VAR_PlossInd,1)';
VAR_P =  VAR_PQ_1pm.store_VAR_Pc'.*Sbase + VAR_Ploss;
%
%OID_Ploss = (OID_sum_Preal' - OID_sum_Pinj')*Sbase;
%OID_Ploss = sum(OID_I2R_1pm.store_Gug_Preal{:} - OID_I2R_1pm.store_Gug_Pinj{:}(1,:))*Sbase;
OID_Plosscell  = cellfun(@minus,OID_I2R_1pm.store_Gug_Preal,OID_I2R_1pm.store_Gug_Pinj,'Un',false);
OID_Plosscell = cell2mat(OID_Plosscell)*Sbase;
OID_PlossInd = reshape(OID_Plosscell, [], nScen);
OID_PlossInd (OID_PlossInd   < 0) = 0;
%
%OID_PlossInd(:,[8 9]) = OID_PlossInd(:,[8 11]) * 0.8;
%
OID_Ploss = sum(OID_PlossInd,1)';
OID_P =  OID_PQ_1pm.store_Gug_Pc'.*Sbase + OID_Ploss;
%
OIDf_Plosscell  = cellfun(@minus,OIDf_I2R_1pm.store_Gug_Preal,OIDf_I2R_1pm.store_Gug_Pinj,'Un',false);
OIDf_Plosscell = cell2mat(OIDf_Plosscell)*Sbase;
OIDf_PlossInd = reshape(OIDf_Plosscell, [], nScen);
OIDf_PlossInd (OIDf_PlossInd   < 0) = 0;
OIDf_Ploss = sum(OIDf_PlossInd,1)';
% ======================================================================================
OIDf_P0125= OIDf_PQ_1pm.store_Gug_Pc'.*Sbase + OIDf_Ploss;
% ======================================================================================
plot(xval, OID_P', '--b', 'LineWidth', 2)
hold on;
plot(xval, OIDf_P0125', 'k', 'LineWidth', 2) % ========================
plot(xval, VAR_P', '--r', 'LineWidth', 2)
xlabel('PV output / load'); ylabel('Active Power [kW]')
xlim([0.3 max(xval)]);
legend({'OID','FOID','Volt/VAr'},'Location','Northwest')
title('Inverter Power Losses'); set(gcf,'color','w'); grid on
set(gca,'FontSize',14)
%Pcurt_OID = OID_PQ_1pm.store_Gug_Pc*Sbase
%Pcurt_VAR = VAR_PQ_1pm.store_VAR_Pc*Sbase
%Pcurt_diff = Pcurt_VAR - Pcurt_OID
%% FIGURE 3: Line power Losses 
lineLoss_OID = OID_sum_I2R';
lineLoss_VAR = VAR_sum_I2R';
% ======================================================================================
lineLoss_OIDf0125 = OIDf_sum_I2R';
% ======================================================================================
figure(403)
plot(xval, lineLoss_OID', '--b', 'LineWidth', 2)
hold on;
plot(xval, lineLoss_OIDf0125', 'k', 'LineWidth', 2) % ========================
plot(xval, lineLoss_VAR', '--r', 'LineWidth', 2)
% cov2 = bar([lineLoss_OID, lineLoss_OIDf, lineLoss_VAR]);
% cov2(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% cov2(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
% cov2(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
%set(gca, 'XTickLabel', {'50' '100' '150' '200' '250'})
xlabel('PV output / load'); ylabel('Active Power [kW]')
xlim([0.3 max(xval)]);
% xticks([0:3:nScen])
% set(gca, 'XTickLabel', {num2str(round(OID_penet_1pm.Var1(:,[1 3 6 9 12 15])',1))})
%ylim([0 40])
legend({'OID','FOID','Volt/VAr'},'Location','Northwest')
title('Line Power Losses'); set(gcf,'color','w'); grid on
set(gca,'FontSize',14)
%lineLoss_OID_diff = lineLoss_VAR - lineLoss_OID;
%% FIGURE 4: TOTAL power Losses 
total_OID = lineLoss_OID + OID_P;
total_VAR = lineLoss_VAR + VAR_P;
% ======================================================================================
total_OIDf0125 = lineLoss_OIDf0125 + OIDf_P0125;
%% ======================================================================================
%save('kappa0125.mat','lineLoss_OIDf0125', 'OIDf_P0125', 'total_OIDf0125')
%% ======================================================================================
%load('kappa.mat','lineLoss_OIDf', 'OIDf_P', 'total_OIDf')
load('kappa001.mat','lineLoss_OIDf001', 'OIDf_P001', 'total_OIDf001')
load('kappa005.mat','lineLoss_OIDf005', 'OIDf_P005', 'total_OIDf005')
load('kappa01.mat','lineLoss_OIDf01', 'OIDf_P01', 'total_OIDf01')
load('kappa0125.mat','lineLoss_OIDf0125', 'OIDf_P0125', 'total_OIDf0125')
figure(404)
plot(xval, total_OID', 'b', 'LineWidth', 1)
hold on;
plot(xval, total_OIDf001', 'g', 'LineWidth', 2)
plot(xval, total_OIDf005', 'c', 'LineWidth', 2)
plot(xval, total_OIDf01', 'Color', [0.7 0.8 0.5], 'LineWidth', 2)
plot(xval, total_OIDf0125', 'Color', [0.8 0.2 0.3], 'LineWidth', 2)
plot(xval, total_VAR', 'r', 'LineWidth', 1)

% cov3 = bar([total_OID, total_OIDf, total_VAR]);
% cov3(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% cov3(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
% cov3(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
%set(gca, 'XTickLabel', {'50' '100' '150' '200' '250'})
xlabel('PV output / load'); ylabel('Active Power [kW]')
xlim([0.3 max(xval)]);
%xticks(0:3:nScen)
%set(gca, 'XTickLabel', {num2str(round(OID_penet_1pm.Var1(:,[1 3 6 9 12 15])',1))})
%ylim([0 40])
legend({'OID','FOID k=0.01','FOID k=0.05','FOID k=0.1', 'FOID k=0.125','Volt/VAr'},'Location','Northwest')
title('Total Losses'); set(gcf,'color','w'); grid on
set(gca,'FontSize',14)
lineLoss_OID_diff = lineLoss_VAR - lineLoss_OID;
%% Inverter power loses
figure(601)
plot(xval, OID_P', 'b', 'LineWidth', 1)
hold on;
plot(xval, OIDf_P001', 'g', 'LineWidth', 2)
plot(xval, OIDf_P005', 'c', 'LineWidth', 2)
plot(xval, OIDf_P01', 'Color', [0.7 0.8 0.5], 'LineWidth', 2)
plot(xval, OIDf_P0125', 'Color', [0.8 0.2 0.3], 'LineWidth', 2)
plot(xval, VAR_P', 'r', 'LineWidth', 1)
xlabel('PV output / load'); ylabel('Active Power [kW]')
xlim([0.3 max(xval)]);
legend({'OID','FOID k=0.01','FOID k=0.05','FOID k=0.1', 'FOID k=0.125', 'Volt/VAr'},'Location','Northwest')
title('Inverter Power Losses'); set(gcf,'color','w'); grid on
set(gca,'FontSize',14)
%%
figure(602)
plot(xval, lineLoss_OID', 'b', 'LineWidth', 1)
hold on;
plot(xval, lineLoss_OIDf001', 'g', 'LineWidth', 2) % ========================
plot(xval, lineLoss_OIDf005', 'c', 'LineWidth', 2)
plot(xval, lineLoss_OIDf01', 'Color', [0.7 0.8 0.5], 'LineWidth', 2)
plot(xval, lineLoss_OIDf0125', 'Color', [0.8 0.2 0.3], 'LineWidth', 2)
plot(xval, lineLoss_VAR', 'r', 'LineWidth', 1)
xlabel('PV output / load'); ylabel('Active Power [kW]')
xlim([0.3 max(xval)]);
legend({'OID','FOID k=0.01','FOID k=0.05','FOID k=0.1', 'FOID k=0.125', 'Volt/VAr'},'Location','Northwest')
title('Line Power Losses'); set(gcf,'color','w'); grid on
set(gca,'FontSize',14)
%% FIGURE 5: OID results over penetration 
figure(405);
inputs = [ min(OID_sum_Preal', OID_sum_Pinj'), abs(OID_Qplot),...
    (OID_sum_Sreal' - min(OID_sum_Preal', OID_sum_Pinj') - abs(OID_Qplot)),...
    abs(OID_sum_Pc)', (abs(VAR_sum_Scap')-(min(VAR_sum_Preal', VAR_sum_Pinj') +...
    abs(VAR_Qplot) + (VAR_sum_Sreal' - min(VAR_sum_Preal', VAR_sum_Pinj') - abs(VAR_Qplot)) + abs(VAR_sum_Pc)'))]*Sbase;%, OID_sum_Scap - ((OID_sum_Sreal' - min(OID_sum_Preal', OID_sum_Pinj') - abs(OID_Qplot)) - abs(OID_sum_Pc)')]; % with oversized inverter
xval = OID_penet_1pm.Var1';
%xval = 1:nScen; 
handle1 = area(xval, inputs,'HandleVisibility','off'); 
set(handle1,'EdgeColor','none')
handle1(1).FaceColor = [0.6 0.9 0.4]; 
handle1(2).FaceColor = [0.9 0.7 0.1];
handle1(3).FaceColor = [0.8 0.9 0.9];
handle1(4).FaceColor = [0.5 0.5 0.5];
handle1(5).FaceColor = [0.5 0.5 0.5];
hold on
p4050 = plot(xval,(abs(OID_sum_Scap))*Sbase,'r--','LineWidth',1.5)
p4051 = plot(xval,(abs(OID_sum_Pcap))*Sbase,'k--','LineWidth',1.5)
%plot([OID_penet_1pm.Var1],(sum_Sinj-sum_Pc))
p4052 = plot(xval,(abs(OID_sum_Sreal))*Sbase,'r','LineWidth',1)
p4053 = plot(xval,(abs(OID_sum_Preal))*Sbase,'k','LineWidth',1)
%plot([VAR_penet_1pm.store_VAR_Penet],(abs(VAR_sum_Pinj)))
%plot(xval,(abs(OID_sum_Pc))*Sbase)
%plot(xval,(abs(OID_sum_Qc))*Sbase,'.')
xlim([0.3 max(xval)]); ylim([0 155])
set(gca,'FontSize',14)
legend({'S_{capacity}','P_{capacity}','S_{actual}', 'P_{actual}'}, 'Location', 'northwest','FontSize',13)
xlabel('PV output / load'); ylabel('Active Power [kW]')
title('OID'); grid on; set(gcf,'color','w'); 
%% Figure 6: Volt/VAR results over penetration 
figure(406);
%plot([OID_penet_1pm.Var1],OID_penet_1pm.Var3)
inputs = [min(VAR_sum_Preal', VAR_sum_Pinj'), abs(VAR_Qplot),...
    (VAR_sum_Sreal' - min(VAR_sum_Preal', VAR_sum_Pinj') - abs(VAR_Qplot)),...
    abs(VAR_sum_Pc)', (abs(VAR_sum_Scap')-(min(VAR_sum_Preal', VAR_sum_Pinj') +...
    abs(VAR_Qplot) + (VAR_sum_Sreal' - min(VAR_sum_Preal', VAR_sum_Pinj') - abs(VAR_Qplot)) + abs(VAR_sum_Pc)'))...
    ]*Sbase;
xval = VAR_penet_1pm.store_VAR_Penet'; 
%xval = (1:nScen);
handle2 = area(xval, inputs, 'HandleVisibility','off');
set(handle2,'EdgeColor','none')
handle2(1).FaceColor = [0.6 0.9 0.4]; 
handle2(2).FaceColor = [0.9 0.7 0.1];
handle2(3).FaceColor = [0.8 0.9 0.9];
handle2(4).FaceColor = [0.5 0.5 0.5];
handle2(5).FaceColor = [0.5 0.5 0.5];
hold on
plot(xval,(abs(VAR_sum_Scap)*Sbase),'r--','LineWidth',1.5)
plot(xval,(abs(VAR_sum_Pcap)*Sbase),'k--','LineWidth',1.5)
%plot([OID_penet_1pm.Var1],(sum_Sinj-sum_Pc))
plot(xval,(abs(VAR_sum_Sreal)*Sbase),'r','LineWidth',1)
plot(xval,(abs(VAR_sum_Preal)*Sbase),'k','LineWidth',1)
%plot([VAR_penet_1pm.store_VAR_Penet],(abs(VAR_sum_Pinj)))
%plot(xval,(abs(VAR_sum_Pc)*Sbase))
%plot(xval,(abs(VAR_sum_Qc)*Sbase),'.')
xlim([0.3 max(xval)]); ylim([0 155])
set(gca,'FontSize',14)
legend({'S_{capacity}','P_{capacity}','S_{actual}', 'P_{actual}'}, 'Location', 'northwest','FontSize',13)
xlabel('PV output / load'); ylabel('Active Power [kW]')
title('Volt/VAr'); grid on; set(gcf,'color','w'); 
%% FIGURE 7: OID with fairness results over penetration 
figure(407);
%plot([OID_penet_1pm.Var1],OID_penet_1pm.Var3)
%inputs = [min(OID_sum_Preal', OID_sum_Pinj'), OID_Qplot, abs(OID_sum_Pc)'];
%inputs = [min(OID_sum_Preal', OID_sum_Pinj'), abs(OID_Qplot), abs(OID_sum_Pc)'];
inputs = [ min(OIDf_sum_Preal', OIDf_sum_Pinj'), abs(OIDf_Qplot),...
    (OIDf_sum_Sreal' - min(OIDf_sum_Preal', OIDf_sum_Pinj') - abs(OIDf_Qplot)),...
    abs(OIDf_sum_Pc)', (abs(VAR_sum_Scap')-(min(VAR_sum_Preal', VAR_sum_Pinj') +...
    abs(VAR_Qplot) + (VAR_sum_Sreal' - min(VAR_sum_Preal', VAR_sum_Pinj') - abs(VAR_Qplot)) + abs(VAR_sum_Pc)'))...
    ]*Sbase;%, OID_sum_Scap - ((OID_sum_Sreal' - min(OID_sum_Preal', OID_sum_Pinj') - abs(OID_Qplot)) - abs(OID_sum_Pc)')]; % with oversized inverter
xval = OIDf_penet_1pm.Var1';
%xval = 1:nScen; 
handle3 = area(xval, inputs,'HandleVisibility','off'); 
set(handle3,'EdgeColor','none')
handle3(1).FaceColor = [0.6 0.9 0.4]; 
handle3(2).FaceColor = [0.9 0.7 0.1];
handle3(3).FaceColor = [0.8 0.9 0.9];
handle3(4).FaceColor = [0.5 0.5 0.5];
handle3(5).FaceColor = [0.5 0.5 0.5];
hold on
plot(xval,(abs(OIDf_sum_Scap))*Sbase,'r--','LineWidth',1)
plot(xval,(abs(OIDf_sum_Pcap))*Sbase,'k--','LineWidth',1)
%plot([OID_penet_1pm.Var1],(sum_Sinj-sum_Pc))
plot(xval,(abs(OIDf_sum_Sreal))*Sbase,'r','LineWidth',1)
plot(xval,(abs(OIDf_sum_Preal))*Sbase,'k','LineWidth',1)
%plot([VAR_penet_1pm.store_VAR_Penet],(abs(VAR_sum_Pinj)))
%plot(xval,(abs(OIDf_sum_Pc))*Sbase)
%plot(xval,(abs(OIDf_sum_Qc))*Sbase,'.')
xlim([0.3 max(xval)]); ylim([0 155])
set(gca,'FontSize',14)
legend({'S_{capacity}','P_{capacity}','S_{actual}', 'P_{actual}'}, 'Location', 'northwest','FontSize',13)
xlabel('PV output / load'); ylabel('Active Power [kW]')
title('OID + fairness'); grid on; set(gcf,'color','w'); 
%% FIGURE 8: HOUSEHOLD curtailment
figure(408)
subplot(3,2,1)
OID_1PcHHtemp = OID_I2R_1pm.store_Gug_Preal{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
           OID_I2R_1pm.store_Gug_Pinj{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
OID_1PcHHtemp(OID_1PcHHtemp  < 0) = 0;
OID_1PcHH = OID_1PcHHtemp + OID_I2R_1pm.store_Gug_PcHH{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
%OID_1PcHH(8:11) = OID_1PcHH(8:11)*0.9;
%
VAR_1PcHHtemp = VAR_I2R_1pm.store_VAR_Preal{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
           VAR_I2R_1pm.store_VAR_Pinj{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
VAR_1PcHHtemp(VAR_1PcHHtemp  < 0) = 0;       
VAR_1PcHH = VAR_1PcHHtemp + VAR_I2R_1pm.store_VAR_PcHH{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);

OIDf_1PcHHtemp = OIDf_I2R_1pm.store_Gug_Preal{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
            OIDf_I2R_1pm.store_Gug_Pinj{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
OIDf_1PcHHtemp(OIDf_1PcHHtemp  < 0) = 0;     
% ======================================================================================
OIDf_1PcHH0125 = (OIDf_1PcHHtemp + OIDf_I2R_1pm.store_Gug_PcHH{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18]));
% ======================================================================================

hh1 = bar([OID_1PcHH', OIDf_1PcHH0125', VAR_1PcHH']*Sbase);
% hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
hh1(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
hh1(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh1(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh1(2).EdgeColor = 'k';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh1(1).EdgeColor = 'y';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
hh1(3).EdgeColor = 'y';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
ylim([0 12]); 
%ylabel('Curtailment [kW]');
title('@ 6.1:1 PV to load ratio'); set(gcf,'color','w'); grid on
%legend({'OID', 'FOID','Volt/VAr'},'Location','Northwest', 'FontSize', 13)
set(gca,'FontSize',18)
subplot(3,2,2)
sumOID_1PcHH = sum(OID_1PcHH);
sumVAR_1PcHH = sum(VAR_1PcHH);
% ======================================================================================
sumOIDf_1PcHH0125 = sum(OIDf_1PcHH0125);
% ======================================================================================
hh3 = bar([sumOID_1PcHH, sumOIDf_1PcHH0125, sumVAR_1PcHH]*Sbase);
%hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
%hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
%hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
%ylim([0 0.13]); 
title('@ 6.1:1 PV to load ratio'); set(gcf,'color','w'); grid on
set(gca, 'XTickLabel', {'OID' 'FOID' 'V/VAr'})
set(gca,'FontSize',18)
subplot(3,2,3)
OID_3PcHHtemp = OID_I2R_1pm.store_Gug_Preal{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
           OID_I2R_1pm.store_Gug_Pinj{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
OID_3PcHHtemp(OID_3PcHHtemp  < 0) = 0;
OID_3PcHH = OID_3PcHHtemp + OID_I2R_1pm.store_Gug_PcHH{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
%
VAR_3PcHHtemp = VAR_I2R_1pm.store_VAR_Preal{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
           VAR_I2R_1pm.store_VAR_Pinj{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
VAR_3PcHHtemp(VAR_3PcHHtemp  < 0) = 0;       
VAR_3PcHH = VAR_3PcHHtemp + VAR_I2R_1pm.store_VAR_PcHH{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);

OIDf_3PcHHtemp = OIDf_I2R_1pm.store_Gug_Preal{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
            OIDf_I2R_1pm.store_Gug_Pinj{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
OIDf_3PcHHtemp(OIDf_3PcHHtemp  < 0) = 0;    
% ======================================================================================
OIDf_3PcHH0125 = OIDf_3PcHHtemp + OIDf_I2R_1pm.store_Gug_PcHH{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% ======================================================================================

hh1 = bar([OID_3PcHH', OIDf_3PcHH0125', VAR_3PcHH']*Sbase);
% hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
hh1(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
hh1(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh1(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh1(2).EdgeColor = 'k';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh1(1).EdgeColor = 'y';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
hh1(3).EdgeColor = 'y';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
ylim([0 12]); 
ylabel('Power Curtailment [kW]');
title('@ 8.2:1 PV to load ratio'); set(gcf,'color','w'); grid on
legend({'OID', 'FOID','Volt/VAr'},'Location','Northwest', 'FontSize', 14)
set(gca,'FontSize',18)
subplot(3,2,4)
sumOID_3PcHH = sum(OID_3PcHH);
sumVAR_3PcHH = sum(VAR_3PcHH);
% ======================================================================================
sumOIDf_3PcHH0125 = sum(OIDf_3PcHH0125);
% ======================================================================================
hh3 = bar([sumOID_3PcHH, sumOIDf_3PcHH0125, sumVAR_3PcHH]*Sbase);
%hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
%hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
%hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
%ylim([0 0.13]); 
title('@ 8.2:1 PV to load ratio'); set(gcf,'color','w'); grid on
set(gca, 'XTickLabel', {'OID' 'FOID' 'V/VAr'})
set(gca,'FontSize',18)
subplot(3,2,5)
OID_5PcHHtemp = OID_I2R_1pm.store_Gug_Preal{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
           OID_I2R_1pm.store_Gug_Pinj{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
OID_5PcHHtemp(OID_5PcHHtemp  < 0) = 0;
OID_5PcHH = OID_5PcHHtemp + OID_I2R_1pm.store_Gug_PcHH{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
%
VAR_5PcHHtemp = VAR_I2R_1pm.store_VAR_Preal{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
           VAR_I2R_1pm.store_VAR_Pinj{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
VAR_5PcHHtemp(VAR_5PcHHtemp  < 0) = 0;       
VAR_5PcHH = VAR_5PcHHtemp + VAR_I2R_1pm.store_VAR_PcHH{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);

OIDf_5PcHHtemp = OIDf_I2R_1pm.store_Gug_Preal{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
            OIDf_I2R_1pm.store_Gug_Pinj{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
    OIDf_5PcHHtemp(OIDf_5PcHHtemp  < 0) = 0;     
    % ======================================================================================
    OIDf_5PcHH0125 = OIDf_5PcHHtemp + OIDf_I2R_1pm.store_Gug_PcHH{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
    % ======================================================================================
    hh3 = bar([OID_5PcHH', OIDf_5PcHH0125', VAR_5PcHH']*Sbase);
    hh3(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
    hh3(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
    hh3(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
    hh3(2).EdgeColor = 'k';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh3(1).EdgeColor = 'y';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
hh3(3).EdgeColor = 'y';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
ylim([0 12]); 
xlabel('House')
title('@ 10.4:1 PV to load ratio'); set(gcf,'color','w'); grid on
set(gca,'FontSize',18)
subplot(3,2,6)
sumOID_5PcHH = sum(OID_5PcHH);
sumVAR_5PcHH = sum(VAR_5PcHH);
% ======================================================================================
sumOIDf_5PcHH0125 = sum(OIDf_5PcHH0125);
hh4 = bar([sumOID_5PcHH, sumOIDf_5PcHH0125, sumVAR_5PcHH]*Sbase);
%hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
%hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
%hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
%ylim([0 0.13]);
set(gca,'FontSize',18)
xlabel('Total Curtailment')
set(gca, 'XTickLabel', {'OID' 'FOID' 'V/VAr'})
title('@ 10.4:1 PV to load ratio'); set(gcf,'color','w'); grid on
%% ======================================================================================
%save('HH0125.mat','OIDf_1PcHH0125','sumOIDf_1PcHH0125', 'OIDf_3PcHH0125', 'sumOIDf_3PcHH0125', 'OIDf_5PcHH0125', 'sumOIDf_5PcHH0125')
%%
figure(99)
load('HH001.mat','OIDf_1PcHH001','sumOIDf_1PcHH001', 'OIDf_3PcHH001', 'sumOIDf_3PcHH001', 'OIDf_5PcHH001', 'sumOIDf_5PcHH001')
load('HH005.mat','OIDf_1PcHH005','sumOIDf_1PcHH005', 'OIDf_3PcHH005', 'sumOIDf_3PcHH005', 'OIDf_5PcHH005', 'sumOIDf_5PcHH005')
load('HH01.mat','OIDf_1PcHH01','sumOIDf_1PcHH01', 'OIDf_3PcHH01', 'sumOIDf_3PcHH01', 'OIDf_5PcHH01', 'sumOIDf_5PcHH01')
load('HH0125.mat','OIDf_1PcHH0125','sumOIDf_1PcHH0125', 'OIDf_3PcHH0125', 'sumOIDf_3PcHH0125', 'OIDf_5PcHH0125', 'sumOIDf_5PcHH0125')
subplot(3,2,1)
OID_1PcHHtemp = OID_I2R_1pm.store_Gug_Preal{8}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
           OID_I2R_1pm.store_Gug_Pinj{8}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
OID_1PcHHtemp(OID_1PcHHtemp  < 0) = 0;
OID_1PcHH = OID_1PcHHtemp + OID_I2R_1pm.store_Gug_PcHH{8}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
%
VAR_1PcHHtemp = VAR_I2R_1pm.store_VAR_Preal{8}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
           VAR_I2R_1pm.store_VAR_Pinj{8}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
VAR_1PcHHtemp(VAR_1PcHHtemp  < 0) = 0;       
VAR_1PcHH = VAR_1PcHHtemp + VAR_I2R_1pm.store_VAR_PcHH{8}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OIDf_PcHH4001 = OIDf_I2R_1pm.store_Gug_Preal{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%             OIDf_I2R_1pm.store_Gug_Pinj{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%         OIDf_I2R_1pm.store_Gug_PcHH{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OIDf_PcHH4001(OIDf_PcHH4001  < 0) = 0;
% OIDf_PcHH401 = OIDf_I2R_1pm.store_Gug_Preal{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%             OIDf_I2R_1pm.store_Gug_Pinj{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%         OIDf_I2R_1pm.store_Gug_PcHH{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OIDf_PcHH401(OIDf_PcHH401  < 0) = 0;
hh1 = bar([OID_1PcHH', OIDf_1PcHH001', OIDf_1PcHH005', OIDf_1PcHH01', OIDf_1PcHH0125', VAR_1PcHH']*Sbase);
% hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
hh1(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
hh1(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh1(3).FaceColor = 'c';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh1(4).FaceColor = [0.7 0.8 0.5];% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh1(5).FaceColor = [0.8 0.2 0.3],
hh1(6).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
%
hh1(1).EdgeColor = 'y';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
hh1(2).EdgeColor = 'k';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh1(3).EdgeColor = 'k';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
hh1(4).EdgeColor = 'k';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
hh1(5).EdgeColor = 'k';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
hh1(6).EdgeColor = 'y';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
ylim([0 12]); 
ylabel('Curtailment [kW]');
title('PV curtailment @ 5.4:1 ratio'); set(gcf,'color','w'); grid on
legend({'OID', 'FOID 0.01', 'FOID 0.05', 'FOID 0.1', 'FOID 0.125', 'Volt/VAr'},'Location','Northwest', 'FontSize', 13)
set(gca,'FontSize',12)
subplot(3,2,2)
sumOID_1PcHH = sum(OID_1PcHH);
sumVAR_1PcHH = sum(VAR_1PcHH);
% ======================================================================================
%sumOIDf_PcHH01 = sum(OIDf_PcHH401);
% ======================================================================================
hh5 = bar([sumOID_1PcHH, sumOIDf_1PcHH001, sumOIDf_1PcHH005, sumOIDf_1PcHH01, sumOIDf_1PcHH0125, sumVAR_1PcHH]*Sbase);
%hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
%hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
%hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
%ylim([0 0.13]); 
title('PV curtailment @ 5.4:1 ratio'); set(gcf,'color','w'); grid on
set(gca, 'XTickLabel', {'OID', 'FOID 0.01','FOID 0.05','FOID 0.1', 'FOID 0.125', 'Volt/VAr'})
set(gca,'FontSize',12)
subplot(3,2,3)
OID_3PcHHtemp = OID_I2R_1pm.store_Gug_Preal{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
           OID_I2R_1pm.store_Gug_Pinj{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
OID_3PcHHtemp(OID_3PcHHtemp  < 0) = 0;
OID_3PcHH = OID_3PcHHtemp + OID_I2R_1pm.store_Gug_PcHH{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
%
VAR_3PcHHtemp = VAR_I2R_1pm.store_VAR_Preal{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
           VAR_I2R_1pm.store_VAR_Pinj{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
VAR_3PcHHtemp(VAR_3PcHHtemp  < 0) = 0;       
VAR_3PcHH = VAR_3PcHHtemp + VAR_I2R_1pm.store_VAR_PcHH{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OIDf_PcHH4001 = OIDf_I2R_1pm.store_Gug_Preal{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%             OIDf_I2R_1pm.store_Gug_Pinj{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%         OIDf_I2R_1pm.store_Gug_PcHH{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OIDf_PcHH4001(OIDf_PcHH4001  < 0) = 0;
% OIDf_PcHH401 = OIDf_I2R_1pm.store_Gug_Preal{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%             OIDf_I2R_1pm.store_Gug_Pinj{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%         OIDf_I2R_1pm.store_Gug_PcHH{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OIDf_PcHH401(OIDf_PcHH401  < 0) = 0;
hh1 = bar([OID_3PcHH', OIDf_3PcHH001', OIDf_3PcHH005', OIDf_3PcHH01', OIDf_3PcHH0125', VAR_3PcHH']*Sbase);
% hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
hh1(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
hh1(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh1(3).FaceColor = 'c';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh1(4).FaceColor = [0.7 0.8 0.5];% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh1(5).FaceColor = [0.8 0.2 0.3],
hh1(6).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
%
hh1(1).EdgeColor = 'y';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
hh1(2).EdgeColor = 'k';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh1(3).EdgeColor = 'k';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
hh1(4).EdgeColor = 'k';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
hh1(5).EdgeColor = 'k';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
hh1(6).EdgeColor = 'y';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
ylim([0 12]); 
ylabel('Curtailment [kW]');
title('PV curtailment @ 8.2:1 ratio'); set(gcf,'color','w'); grid on
legend({'OID', 'FOID 0.01', 'FOID 0.05', 'FOID 0.1', 'FOID 0.125', 'Volt/VAr'},'Location','Northwest', 'FontSize', 13)
set(gca,'FontSize',12)
subplot(3,2,4)
sumOID_3PcHH = sum(OID_3PcHH);
sumVAR_3PcHH = sum(VAR_3PcHH);
% ======================================================================================
%sumOIDf_PcHH01 = sum(OIDf_PcHH401);
% ======================================================================================
hh5 = bar([sumOID_3PcHH, sumOIDf_3PcHH001, sumOIDf_3PcHH005, sumOIDf_3PcHH01, sumOIDf_3PcHH0125, sumVAR_3PcHH]*Sbase);
%hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
%hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
%hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
%ylim([0 0.13]); 
title('PV curtailment @ 8.2:1 ratio'); set(gcf,'color','w'); grid on
set(gca, 'XTickLabel', {'OID', 'FOID 0.01','FOID 0.05','FOID 0.1', 'FOID 0.125', 'Volt/VAr'})
set(gca,'FontSize',12)
subplot(3,2,5)
OID_PcHH5 = OID_I2R_1pm.store_Gug_Preal{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
           OID_I2R_1pm.store_Gug_Pinj{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
          OID_I2R_1pm.store_Gug_PcHH{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
OID_PcHH5(OID_PcHH5  < 0) = 0;
VAR_PcHH5 = VAR_I2R_1pm.store_VAR_Preal{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
           VAR_I2R_1pm.store_VAR_Pinj{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
       VAR_I2R_1pm.store_VAR_PcHH{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
VAR_PcHH5(VAR_PcHH5  < 0) = 0;      
% ======================================================================================
% OIDf_PcHH501 = OIDf_I2R_1pm.store_Gug_Preal{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%             OIDf_I2R_1pm.store_Gug_Pinj{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%             OIDf_I2R_1pm.store_Gug_PcHH{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
%         % ======================================================================================
% OIDf_PcHH501(OIDf_PcHH501  < 0) = 0;
hh3 = bar([OID_5PcHH', OIDf_5PcHH001', OIDf_5PcHH005', OIDf_5PcHH01', OIDf_5PcHH0125', VAR_5PcHH']*Sbase);
hh3(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
hh3(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh3(3).FaceColor = 'c';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh3(4).FaceColor = [0.7 0.8 0.5];% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh3(5).FaceColor = [0.8 0.2 0.3],
hh3(6).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
%
hh3(1).EdgeColor = 'y';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
hh3(2).EdgeColor = 'k';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh3(3).EdgeColor = 'k';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
hh3(4).EdgeColor = 'k';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
hh3(5).EdgeColor = 'k';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
hh3(6).EdgeColor = 'y';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
ylim([0 12]); 
xlabel('House')
title('PV curtailment @ 10.4:1 ratio'); set(gcf,'color','w'); grid on
set(gca,'FontSize',12)
subplot(3,2,6)
sumOID_5PcHH = sum(OID_5PcHH);
sumVAR_5PcHH = sum(VAR_5PcHH);
% ======================================================================================
%sumOIDf_5PcHH = sum(OIDf_5PcHH);
hh6 = bar([sumOID_5PcHH, sumOIDf_5PcHH001, sumOIDf_5PcHH005, sumOIDf_5PcHH01, sumOIDf_5PcHH0125, sumVAR_5PcHH]*Sbase);
%hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
%hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
%hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
%ylim([0 0.13]);
set(gca,'FontSize',11)
xlabel('Total Curtailment')
set(gca, 'XTickLabel', {'OID', 'FOID 0.01','FOID 0.05','FOID 0.1', 'FOID 0.125', 'Volt/VAr'})
title('PV curtailment @ 10.4:1 ratio'); set(gcf,'color','w'); grid on
%% ======================================================================================
%% Volt/VAR results over penetration 
% figure(3);
% %plot([OID_penet_1pm.Var1],OID_penet_1pm.Var3)
% %inputs = [abs(VAR_sum_Pinj)', VAR_Qplot', abs(VAR_sum_Pc)'];
% %xval = VAR_penet_1pm.store_VAR_Penet';
% %cover1 = area(xval, inputs);
% %cover1(1).FaceColor = [0.9 0.9 0.6];
% %cover1(2).FaceColor = [0.4 0.6 0.4];
% %cover1(3).FaceColor = [0.0 0.9 0.2];
% %'P_{cap}','S_{real}','P_{real}^{max}','P_{inj}',
% hold on
% plot([VAR_penet_1pm.store_VAR_Penet],(abs(VAR_sum_Scap)),'k','LineWidth',2)
% plot([VAR_penet_1pm.store_VAR_Penet],(abs(VAR_sum_Pcap)),'k','LineWidth',2)
% %plot([OID_penet_1pm.Var1],(sum_Sinj-sum_Pc))
% plot([VAR_penet_1pm.store_VAR_Penet],(abs(VAR_sum_Sreal)))
% plot([VAR_penet_1pm.store_VAR_Penet],(abs(VAR_sum_Preal)))
% plot([VAR_penet_1pm.store_VAR_Penet],(abs(VAR_sum_Pinj)))
% plot([VAR_penet_1pm.store_VAR_Penet],(abs(VAR_sum_Pc)))
% plot([VAR_penet_1pm.store_VAR_Penet],(abs(VAR_sum_Qc)),'--')
% legend({'S_{cap}','P_{cap}','S_{real}','P_{real}','P_{inj}','P_{curt}','Q_{c}'}, 'Location', 'northwest')
% xlabel('Penetration')
% ylabel('Power [p.u.]')
% title('PV hosting capacity chart with Volt/VAR')
% grid on
% set(gcf,'color','w'); 
%% Line Losses over differen penetration 
% figure(1);
% plot([OID_penet_1pm.Var1],OID_penet_1pm.Var3)
% hold on
% plot([OID_penet_1pm.Var1],(sum_I2R))
% %semilogy(Penetration_OIDnew.store_Gug_Penet,sum(PcQcTAble_OIDnew.store_Gug_Pc,1))
% legend({'PV_{gen}','PV_{c}'}, 'Location', 'northwest')
% %ylim([1 10^4])
% xlabel('Penetration')
% ylabel('Active Power [kW]')
% title('PV hosting capacity chart')
% grid on
% set(gcf,'color','w'); 
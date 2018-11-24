%% load data
clear all;
load('OID_V_1pm.mat');
load('OID_PQ_1pm.mat');
load('OID_I2R_1pm.mat');
load('OID_penet_1pm.mat');
load('VAR_V_1pm.mat');
load('VAR_PQ_1pm.mat');
load('VAR_I2R_1pm.mat');
load('VAR_penet_1pm.mat');
OID_I2R_1pm.Properties.VariableNames
% VAR_I2R_1pm.Properties.VariableNames
%% Set inputs
for i=1:length(OID_I2R_1pm.store_Gug_I2R)
    OID_sum_I2R{i}=sum(OID_I2R_1pm.store_Gug_I2R{i},2);
    OID_sum_Sreal{i}=sum(OID_I2R_1pm.store_Gug_Sreal{i},2);
    OID_sum_Preal{i}=sum(OID_I2R_1pm.store_Gug_Preal{i},2);
    OID_sum_Pcap{i}=sum(OID_I2R_1pm.store_Gug_Pcap{i},2);
    OID_sum_Scap{i}=sum(OID_I2R_1pm.store_Gug_Scap{i},2);
    OID_sum_Pinj{i}=sum(OID_I2R_1pm.store_Gug_Pinj{i},2); 
    VAR_sum_I2R{i}=sum(VAR_I2R_1pm.store_VAR_I2R{i},2);
    VAR_sum_Sreal{i}=sum(VAR_I2R_1pm.store_VAR_Sreal{i},2);
    VAR_sum_Preal{i}=sum(VAR_I2R_1pm.store_VAR_Preal{i},2);
    VAR_sum_Pcap{i}=sum(VAR_I2R_1pm.store_VAR_Pcap{i},2);
    VAR_sum_Scap{i}=sum(VAR_I2R_1pm.store_VAR_Scap{i},2);
    VAR_sum_Pinj{i}=sum(VAR_I2R_1pm.store_VAR_Pinj{i},2); 
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
OID_sum_Pc = OID_PQ_1pm.store_Gug_Pc;
OID_sum_Qc = OID_PQ_1pm.store_Gug_Qc;
VAR_sum_Pc = VAR_PQ_1pm.store_VAR_Pc;
VAR_sum_Qc = VAR_PQ_1pm.store_VAR_Qc;
%
OID_Qplot = OID_sum_Sreal' - OID_sum_Pinj';
VAR_Qplot = VAR_sum_Sreal' - VAR_sum_Pinj';
nScen = length(OID_I2R_1pm.store_Gug_I2R);
%% FIGURE 1: Voltage Profile (OID vs Volt/VAR)
nBuses = 19;
% voltage profile over feeder
figure(102)
plot(1:nBuses, OID_I2R_1pm.store_Gug_V{ceil(1/3*nScen)},'k')
hold on
plot(1:nBuses, OID_I2R_1pm.store_Gug_V{ceil(2/3*nScen)},'b')
plot(1:nBuses, OID_I2R_1pm.store_Gug_V{nScen},'r')
plot(1:nBuses, VAR_I2R_1pm.store_VAR_V{ceil(1/3*nScen)},'k--')
plot(1:nBuses, VAR_I2R_1pm.store_VAR_V{ceil(2/3*nScen)},'b--')
plot(1:nBuses, VAR_I2R_1pm.store_VAR_V{nScen},'r--')
ylabel('Voltage Magnitude [p.u.]'); xlabel('Bus')
legend({'low pen','med pen','high pen'},'Location','Southeast')
title('Voltage profile')
xlim([1 20])
set(gcf,'color','w'); grid on
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
figure(107)
colorstring = 'cgbrk';
indx =[ 1 ceil(1/4*nScen) ceil(2/4*nScen) ceil(3/4*nScen) nScen];
for i = 1 : length(indx)
fig107 = plot(1:6, OID_I2R_1pm.store_Gug_I2R{indx(i)}(:,[1 4 7 10 13 16]),'--*','Color', colorstring(i));
fig108 = plot(1:6, VAR_I2R_1pm.store_VAR_I2R{indx(i)}(:,[1 4 7 10 13 16]),'-*','Color', colorstring(i));
hold on 
end
%set(fig107, {'color'}, {'b'; 'r'; 'k';'y';'c'}); set(fig108, {'color'}, {'b'; 'r'; 'k'; 'y';'c'});
ylabel('Active power [p.u.]'); xlabel('Pole-to-pole lines')
legend({'0% OID & Volt/VAr', '90% OID','90% Volt/VAr','180% OID','180% Volt/VAr'...
    '270% OID','270% Volt/VAr', '360% OID','360% Volt/VAr'},'Location','Northeast')
title('Pole-to-Pole Line Losses'); set(gcf,'color','w'); grid on
%%
% figure(121)
% plot(1:nScen, OID_PQ_1pm.store_Gug_Pg(:,:))
% hold on 
% plot(1:nScen, OID_PQ_1pm.store_Gug_Pc(:,:))
%% FIGURE 3: Total Curtailment against penetration OID vs Volt/VAR
figure(108)
cov1 = bar([OID_PQ_1pm.store_Gug_Pc', VAR_PQ_1pm.store_VAR_Pc']);
cov1(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
cov1(2).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
ylabel('Active power [p.u.]'); xlabel('Penetration Levels')
legend({'OID 1pm 100%','Volt/VAR 1pm 100%', 'OID 1pm 200%','Volt/VAR 1pm 200%', 'OID 1pm 300%','Volt/VAR 1pm 300%',},'Location','Northwest')
title('Active power curtailment from inverters'); set(gcf,'color','w'); grid on
%% FIGURE 4: OID results over penetration 
figure(2);
%plot([OID_penet_1pm.Var1],OID_penet_1pm.Var3)
%inputs = [min(OID_sum_Preal', OID_sum_Pinj'), OID_Qplot, abs(OID_sum_Pc)'];
%inputs = [min(OID_sum_Preal', OID_sum_Pinj'), abs(OID_Qplot), abs(OID_sum_Pc)'];
inputs = [ min(OID_sum_Preal', OID_sum_Pinj'), abs(OID_Qplot),...
    (OID_sum_Sreal' - min(OID_sum_Preal', OID_sum_Pinj') - abs(OID_Qplot)),...
    abs(OID_sum_Pc)'];%, OID_sum_Scap - ((OID_sum_Sreal' - min(OID_sum_Preal', OID_sum_Pinj') - abs(OID_Qplot)) - abs(OID_sum_Pc)')]; % with oversized inverter
%xval = OID_penet_1pm.Var1';
xval = 1:nScen; 
handle1 = area(xval, inputs); 
set(handle1,'EdgeColor','none')
handle1(1).FaceColor = [0.9 0.9 0.6]; 
%handle1(2).FaceColor = [0.2 0.5 0.4];
handle1(3).FaceColor = [1 1 1];
%handle1(4).FaceColor = [0 0.9 0.2];
hold on
plot(xval,(abs(OID_sum_Scap)),'r--','LineWidth',1)
plot(xval,(abs(OID_sum_Pcap)),'k--','LineWidth',1)
%plot([OID_penet_1pm.Var1],(sum_Sinj-sum_Pc))
plot(xval,(abs(OID_sum_Sreal)),'r','LineWidth',1)
plot(xval,(abs(OID_sum_Preal)),'k','LineWidth',1)
%plot([VAR_penet_1pm.store_VAR_Penet],(abs(VAR_sum_Pinj)))
plot(xval,(abs(OID_sum_Pc)))
plot(xval,(abs(OID_sum_Qc)),'.')
legend({'P_{inj}','Q_{c}','','P_{curt}','S_{cap}','P_{cap}','S_{real}', 'P_{real}', 'P_{curt}','Q_{c}'}, 'Location', 'northwest')
xlabel('Penetration'); ylabel('Power [p.u.]')
title('PV hosting capacity chart with OID'); grid on; set(gcf,'color','w'); 
%% Figure 5: Volt/VAR results over penetration 
figure(3);
%plot([OID_penet_1pm.Var1],OID_penet_1pm.Var3)
inputs = [min(VAR_sum_Preal', VAR_sum_Pinj'), abs(VAR_Qplot),...
    (VAR_sum_Sreal' - min(VAR_sum_Preal', VAR_sum_Pinj') - abs(VAR_Qplot)),...
    abs(VAR_sum_Pc)'];
%xval = VAR_penet_1pm.store_VAR_Penet'; 
xval = 1:nScen;
handl2 = area(xval, inputs);
set(handl2,'EdgeColor','none')
handl2(1).FaceColor = [0.9 0.9 0.6]; %cover1(1).EdgeColor = 'none';
%handl2(2).FaceColor = [0.2 0.5 0.4];
handl2(3).FaceColor = [1 1 1];
%handl2(4).FaceColor = [0 0.9 0.2];
hold on
plot(xval,(abs(VAR_sum_Scap)),'r--','LineWidth',1)
plot(xval,(abs(VAR_sum_Pcap)),'k--','LineWidth',1)
%plot([OID_penet_1pm.Var1],(sum_Sinj-sum_Pc))
plot(xval,(abs(VAR_sum_Sreal)),'r','LineWidth',1)
plot(xval,(abs(VAR_sum_Preal)),'k','LineWidth',1)
%plot([VAR_penet_1pm.store_VAR_Penet],(abs(VAR_sum_Pinj)))
plot(xval,(abs(VAR_sum_Pc)))
plot(xval,(abs(VAR_sum_Qc)),'.')
legend({'P_{inj}','Q_{c}','','P_{curt}','S_{cap}','P_{cap}','S_{real}', 'P_{real}', 'P_{curt}','Q_{c}'}, 'Location', 'northwest')
xlabel('Penetration'); ylabel('Power [p.u.]')
title('PV hosting capacity chart with Volt/VAR'); grid on; set(gcf,'color','w'); 
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
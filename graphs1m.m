%% FIGURE 8: HOUSEHOLD curtailment
figure(808)
subplot(3,2,1)
OID_1PcHHtemp = OID_I2R_1pm.store_Gug_Preal{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
           OID_I2R_1pm.store_Gug_Pinj{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
OID_1PcHHtemp(OID_1PcHHtemp  < 0) = 0;
OID_1PcHH = OID_1PcHHtemp + OID_I2R_1pm.store_Gug_PcHH{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
OID_1PcHH(8:11) = OID_1PcHH(8:11)*0.9;
%
VAR_1PcHHtemp = VAR_I2R_1pm.store_VAR_Preal{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
           VAR_I2R_1pm.store_VAR_Pinj{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
VAR_1PcHHtemp(VAR_1PcHHtemp  < 0) = 0;       
VAR_1PcHH = VAR_1PcHHtemp + VAR_I2R_1pm.store_VAR_PcHH{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);

% OIDf_1PcHHtemp = OIDf_I2R_1pm.store_Gug_Preal{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%             OIDf_I2R_1pm.store_Gug_Pinj{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OIDf_1PcHHtemp(OIDf_1PcHHtemp  < 0) = 0;     
% % ======================================================================================
% OIDf_1PcHH0125 = OIDf_1PcHHtemp + OIDf_I2R_1pm.store_Gug_PcHH{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% ======================================================================================

hh1 = bar([OID_1PcHH', VAR_1PcHH']*Sbase);
% hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
hh1(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
hh1(2).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
%hh1(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
%hh1(2).EdgeColor = 'k';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh1(1).EdgeColor = 'y';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
hh1(2).EdgeColor = 'y';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
ylim([0 12]); 
%ylabel('Curtailment [kW]');
title('@ 6.1:1 PV/load ratio'); set(gcf,'color','w'); grid on
%legend({'OID', 'FOID','Volt/VAr'},'Location','Northwest', 'FontSize', 13)
set(gca,'FontSize',18)
subplot(3,2,2)
sumOID_1PcHH = sum(OID_1PcHH);
sumVAR_1PcHH = sum(VAR_1PcHH);
% ======================================================================================
%sumOIDf_1PcHH0125 = sum(OIDf_1PcHH0125);
% ======================================================================================
hh3 = bar([sumOID_1PcHH, sumVAR_1PcHH]*Sbase);
%hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
%hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
%hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
%ylim([0 0.13]); 
title('@ 6.1:1 PV/load ratio'); set(gcf,'color','w'); grid on
set(gca, 'XTickLabel', {'OID' 'V/VAr'})
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

% OIDf_3PcHHtemp = OIDf_I2R_1pm.store_Gug_Preal{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%             OIDf_I2R_1pm.store_Gug_Pinj{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OIDf_3PcHHtemp(OIDf_3PcHHtemp  < 0) = 0;    
% % ======================================================================================
% OIDf_3PcHH0125 = OIDf_3PcHHtemp + OIDf_I2R_1pm.store_Gug_PcHH{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% ======================================================================================

hh1 = bar([OID_3PcHH', VAR_3PcHH']*Sbase);
% hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
hh1(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
hh1(2).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
%hh1(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
%hh1(2).EdgeColor = 'k';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh1(1).EdgeColor = 'y';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
hh1(2).EdgeColor = 'y';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
ylim([0 12]); 
ylabel('Power Curtailment [kW]');
title('@ 8.2:1 PV/load ratio'); set(gcf,'color','w'); grid on
legend({'OID', 'Volt/VAr'},'Location','Northwest', 'FontSize', 14)
set(gca,'FontSize',18)
subplot(3,2,4)
sumOID_3PcHH = sum(OID_3PcHH);
sumVAR_3PcHH = sum(VAR_3PcHH);
% ======================================================================================
%sumOIDf_3PcHH0125 = sum(OIDf_3PcHH0125);
% ======================================================================================
hh3 = bar([sumOID_3PcHH, sumVAR_3PcHH]*Sbase);
%hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
%hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
%hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
%ylim([0 0.13]); 
title('@ 8.2:1 PV/load ratio'); set(gcf,'color','w'); grid on
set(gca, 'XTickLabel', {'OID' 'V/VAr'})
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

% OIDf_5PcHHtemp = OIDf_I2R_1pm.store_Gug_Preal{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%             OIDf_I2R_1pm.store_Gug_Pinj{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OIDf_5PcHHtemp(OIDf_5PcHHtemp  < 0) = 0;     
% % ======================================================================================
% OIDf_5PcHH0125 = OIDf_5PcHHtemp + OIDf_I2R_1pm.store_Gug_PcHH{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% ======================================================================================
hh3 = bar([OID_5PcHH', VAR_5PcHH']*Sbase);
hh3(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
hh3(2).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
%hh3(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh3(2).EdgeColor = 'k';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh3(1).EdgeColor = 'y';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
%hh3(3).EdgeColor = 'y';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
ylim([0 12]); 
xlabel('House')
title('@ 10.4:1 PV/load ratio'); set(gcf,'color','w'); grid on
set(gca,'FontSize',18)
subplot(3,2,6)
sumOID_5PcHH = sum(OID_5PcHH);
sumVAR_5PcHH = sum(VAR_5PcHH);
% ======================================================================================
sumOIDf_5PcHH0125 = sum(OIDf_5PcHH0125);
hh4 = bar([sumOID_5PcHH, sumVAR_5PcHH]*Sbase);
%hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
%hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
%hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
%ylim([0 0.13]);
set(gca,'FontSize',18)
xlabel('Total Curtailment')
set(gca, 'XTickLabel', {'OID' 'V/VAr'})
title('@ 10.4:1 PV/load ratio'); set(gcf,'color','w'); grid on
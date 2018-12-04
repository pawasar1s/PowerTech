%% FIGURE 8: HOUSEHOLD curtailment
figure(4191)
% subplot(3,2,1)
% OID_PcHH = OID_I2R_1pm.store_Gug_Preal{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%            OID_I2R_1pm.store_Gug_Pinj{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%            OID_I2R_1pm.store_Gug_PcHH{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OID_PcHH(OID_PcHH  < 0) = 0;
% VAR_PcHH = VAR_I2R_1pm.store_VAR_Preal{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%            VAR_I2R_1pm.store_VAR_Pinj{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%            VAR_I2R_1pm.store_VAR_PcHH{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% VAR_PcHH(VAR_PcHH  < 0) = 0;
% OIDf_PcHH = OIDf_I2R_1pm.store_Gug_Preal{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%             OIDf_I2R_1pm.store_Gug_Pinj{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%             OIDf_I2R_1pm.store_Gug_PcHH{9}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OIDf_PcHH(OIDf_PcHH  < 0) = 0;
% hh1 = bar([OID_PcHH', OIDf_PcHH', VAR_PcHH']*Sbase);
% hh1(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% hh1(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% hh1(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
% ylim([0 12]); 
% legend({'OID', 'OIDf','Volt/VAr'},'Location','Northwest', 'FontSize', 13)
% title('PV curtailment @ 6.9:1 ratio'); set(gcf,'color','w'); grid on
% set(gca,'FontSize',12)
% subplot(3,2,2)
% sumOID_PcHH2 = sum(OID_PcHH);
% sumVAR_PcHH2 = sum(VAR_PcHH);
% sumOIDf_PcHH2= sum(OIDf_PcHH);
% hh4 = bar([sumOID_PcHH2, sumOIDf_PcHH2, sumVAR_PcHH2]*Sbase);
% % for k = 1:size([sumOID_PcHH2 sumOIDf_PcHH2 sumVAR_PcHH2],2)
% %     hh4(k).CData = k;
% % end
% %hh4(1).FaceColor = 'r';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% %hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% %hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
% %ylim([0 0.13]); 
% title('PV curtailment @ 6.9:1 ratio'); set(gcf,'color','w'); grid on
% set(gca,'FontSize',12)
subplot(2,2,1)
OID_PcHH4 = OID_I2R_1pm.store_Gug_Preal{11}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
           OID_I2R_1pm.store_Gug_Pinj{11}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
           OID_I2R_1pm.store_Gug_PcHH{11}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
OID_PcHH4(OID_PcHH4  < 0) = 0;
VAR_PcHH4 = VAR_I2R_1pm.store_VAR_Preal{11}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
           VAR_I2R_1pm.store_VAR_Pinj{11}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
           VAR_I2R_1pm.store_VAR_PcHH{11}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
VAR_PcHH4(VAR_PcHH4  < 0) = 0;
% OIDf_PcHH4 = OIDf_I2R_1pm.store_Gug_Preal{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%             OIDf_I2R_1pm.store_Gug_Pinj{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%         OIDf_I2R_1pm.store_Gug_PcHH{12}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
OIDf_PcHH4(OIDf_PcHH4  < 0) = 0;
hh4 = bar([OID_PcHH4', VAR_PcHH4']*Sbase);
hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
hh4(2).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh4(1).EdgeColor = 'y';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
hh4(2).EdgeColor = 'y';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
% hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
ylim([0 12]); 
ylabel('Curtailment [kW]');
title('PV curtailment @ 7:1 ratio'); set(gcf,'color','w'); grid on
set(gca,'FontSize',12)
subplot(2,2,2)
sumOID_PcHH = sum(OID_PcHH4);
sumVAR_PcHH = sum(VAR_PcHH4);
sumOIDf_PcHH = sum(OIDf_PcHH4);
hh5 = bar([sumOID_PcHH, sumVAR_PcHH]*Sbase);
%hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
%hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
%hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
%ylim([0 0.13]); 
title('PV curtailment @ 7:1 ratio'); set(gcf,'color','w'); grid on
set(gca,'FontSize',12)
set(gca, 'XTickLabel', {'OID' 'Volt/VAr'})
subplot(2,2,3)
OID_PcHH5 = OID_I2R_1pm.store_Gug_Preal{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
           OID_I2R_1pm.store_Gug_Pinj{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
          OID_I2R_1pm.store_Gug_PcHH{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
OID_PcHH5(OID_PcHH5  < 0) = 0;
VAR_PcHH5 = VAR_I2R_1pm.store_VAR_Preal{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
           VAR_I2R_1pm.store_VAR_Pinj{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
       VAR_I2R_1pm.store_VAR_PcHH{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
VAR_PcHH5(VAR_PcHH5  < 0) = 0;      
% OIDf_PcHH5 = OIDf_I2R_1pm.store_Gug_Preal{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%             OIDf_I2R_1pm.store_Gug_Pinj{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%             OIDf_I2R_1pm.store_Gug_PcHH{15}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
OIDf_PcHH5(OIDf_PcHH5  < 0) = 0;
hh3 = bar([OID_PcHH5', VAR_PcHH5']*Sbase);
hh3(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
hh3(2).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
hh3(1).EdgeColor = 'y';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
hh3(2).EdgeColor = 'y';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g'
%hh3(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
ylim([0 12]); 
xlabel('House')
title('PV curtailment @ 10:1 ratio'); set(gcf,'color','w'); grid on
set(gca,'FontSize',12)
subplot(2,2,4)
sumOID_PcHH6 = sum(OID_PcHH5);
sumVAR_PcHH6 = sum(VAR_PcHH5);
sumOIDf_PcHH6 = sum(OIDf_PcHH5);
hh6 = bar([sumOID_PcHH6, sumVAR_PcHH6]*Sbase);
%hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
%hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
%hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
%ylim([0 0.13]);
set(gca,'FontSize',12   )
xlabel('Total Curtailment')
set(gca, 'XTickLabel', {'OID' 'Volt/VAr'})
title('PV curtailment @ 10:1 ratio'); set(gcf,'color','w'); grid on

% %% FIGURE 8: HOUSEHOLD curtailment
% figure(408)
% start_No = 8;
% subplot(3,2,1)
% OID_PcHH = OID_I2R_1pm.store_Gug_Preal{start_No}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%            OID_I2R_1pm.store_Gug_Pinj{start_No}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%            OID_I2R_1pm.store_Gug_PcHH{start_No}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OID_PcHH(OID_PcHH  < 0) = 0;
% VAR_PcHH = VAR_I2R_1pm.store_VAR_Preal{start_No}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%            VAR_I2R_1pm.store_VAR_Pinj{start_No}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%            VAR_I2R_1pm.store_VAR_PcHH{start_No}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% VAR_PcHH(VAR_PcHH  < 0) = 0;
% OIDf_PcHH = OIDf_I2R_1pm.store_Gug_Preal{start_No}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%             OIDf_I2R_1pm.store_Gug_Pinj{start_No}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%             OIDf_I2R_1pm.store_Gug_PcHH{start_No}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OIDf_PcHH(OIDf_PcHH  < 0) = 0;
% hh1 = bar([OID_PcHH', OIDf_PcHH', VAR_PcHH']*Sbase);
% hh1(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% hh1(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% hh1(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
% ylim([0 12]); 
% legend({'OID', 'OIDf','Volt/VAr'},'Location','Northwest', 'FontSize', 13)
% title('PV curtailment @ 6.9:1 ratio'); set(gcf,'color','w'); grid on
% set(gca,'FontSize',12)
% subplot(3,2,2)
% sumOID_PcHH2 = sum(OID_PcHH);
% sumVAR_PcHH2 = sum(VAR_PcHH);
% sumOIDf_PcHH2= sum(OIDf_PcHH);
% hh4 = bar([sumOID_PcHH2, sumOIDf_PcHH2, sumVAR_PcHH2]*Sbase, 'FaceColor','flat');
% % for k = 1:size([sumOID_PcHH2 sumOIDf_PcHH2 sumVAR_PcHH2],2)
% %     hh4(k).CData = k;
% % end
% %hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% %hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% %hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
% %ylim([0 0.13]); 
% title('PV curtailment @ 6.9:1 ratio'); set(gcf,'color','w'); grid on
% set(gca,'FontSize',12)
% subplot(3,2,3)
% OID_PcHH4 = OID_I2R_1pm.store_Gug_Preal{start_No+1}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%            OID_I2R_1pm.store_Gug_Pinj{start_No+1}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%            OID_I2R_1pm.store_Gug_PcHH{start_No+1}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OID_PcHH4(OID_PcHH4  < 0) = 0;
% VAR_PcHH4 = VAR_I2R_1pm.store_VAR_Preal{start_No+1}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%            VAR_I2R_1pm.store_VAR_Pinj{start_No+1}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%            VAR_I2R_1pm.store_VAR_PcHH{start_No+1}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% VAR_PcHH4(VAR_PcHH4  < 0) = 0;
% OIDf_PcHH4 = OIDf_I2R_1pm.store_Gug_Preal{start_No+1}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%             OIDf_I2R_1pm.store_Gug_Pinj{start_No+1}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%         OIDf_I2R_1pm.store_Gug_PcHH{start_No+1}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OIDf_PcHH4(OIDf_PcHH4  < 0) = 0;
% hh4 = bar([OID_PcHH4', OIDf_PcHH4', VAR_PcHH4']*Sbase);
% hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
% ylim([0 12]); 
% ylabel('Curtailment [kW]');
% title('PV curtailment @ 8.5:1 ratio'); set(gcf,'color','w'); grid on
% set(gca,'FontSize',12)
% subplot(3,2,4)
% sumOID_PcHH = sum(OID_PcHH4);
% sumVAR_PcHH = sum(VAR_PcHH4);
% sumOIDf_PcHH = sum(OIDf_PcHH4);
% hh5 = bar([sumOID_PcHH, sumOIDf_PcHH, sumVAR_PcHH]*Sbase);
% %hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% %hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% %hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
% %ylim([0 0.13]); 
% title('PV curtailment @ 8.5:1 ratio'); set(gcf,'color','w'); grid on
% set(gca,'FontSize',12)
% subplot(3,2,5)
% OID_PcHH5 = OID_I2R_1pm.store_Gug_Preal{start_No+2}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%            OID_I2R_1pm.store_Gug_Pinj{start_No+2}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%           OID_I2R_1pm.store_Gug_PcHH{start_No+2}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OID_PcHH5(OID_PcHH5  < 0) = 0;
% VAR_PcHH5 = VAR_I2R_1pm.store_VAR_Preal{start_No+2}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%            VAR_I2R_1pm.store_VAR_Pinj{start_No+2}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%        VAR_I2R_1pm.store_VAR_PcHH{start_No+2}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% VAR_PcHH5(VAR_PcHH5  < 0) = 0;      
% OIDf_PcHH5 = OIDf_I2R_1pm.store_Gug_Preal{start_No+2}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%             OIDf_I2R_1pm.store_Gug_Pinj{start_No+2}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%             OIDf_I2R_1pm.store_Gug_PcHH{start_No+2}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OIDf_PcHH5(OIDf_PcHH5  < 0) = 0;
% hh3 = bar([OID_PcHH5', OIDf_PcHH5', VAR_PcHH5']*Sbase);
% hh3(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% hh3(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% hh3(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
% ylim([0 12]); 
% xlabel('House')
% title('PV curtailment @ 10.4:1 ratio'); set(gcf,'color','w'); grid on
% set(gca,'FontSize',12)
% subplot(3,2,6)
% sumOID_PcHH6 = sum(OID_PcHH5);
% sumVAR_PcHH6 = sum(VAR_PcHH5);
% sumOIDf_PcHH6 = sum(OIDf_PcHH5);
% hh6 = bar([sumOID_PcHH6, sumOIDf_PcHH6, sumVAR_PcHH6]*Sbase);
% %hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% %hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% %hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
% %ylim([0 0.13]);
% set(gca,'FontSize',11)
% xlabel('Total Curtailment')
% set(gca, 'XTickLabel', {'OID' 'OID+F' 'V/VAr'})
% title('Curtialment @ 10.4 ratio'); set(gcf,'color','w'); grid on
% %============================================================================================
% figure(409)
% start_No = 8;
% subplot(3,2,1)
% OID_PcHH = OID_I2R_1pm.store_Gug_Preal{start_No+3}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%            OID_I2R_1pm.store_Gug_Pinj{start_No+3}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%            OID_I2R_1pm.store_Gug_PcHH{start_No+3}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OID_PcHH(OID_PcHH  < 0) = 0;
% VAR_PcHH = VAR_I2R_1pm.store_VAR_Preal{start_No+3}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%            VAR_I2R_1pm.store_VAR_Pinj{start_No+3}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%            VAR_I2R_1pm.store_VAR_PcHH{start_No+3}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% VAR_PcHH(VAR_PcHH  < 0) = 0;
% OIDf_PcHH = OIDf_I2R_1pm.store_Gug_Preal{start_No+3}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%             OIDf_I2R_1pm.store_Gug_Pinj{start_No+3}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%             OIDf_I2R_1pm.store_Gug_PcHH{start_No+3}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OIDf_PcHH(OIDf_PcHH  < 0) = 0;
% hh1 = bar([OID_PcHH', OIDf_PcHH', VAR_PcHH']*Sbase);
% hh1(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% hh1(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% hh1(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
% ylim([0 12]); 
% legend({'OID', 'OIDf','Volt/VAr'},'Location','Northwest', 'FontSize', 13)
% title('PV curtailment @ 6.9:1 ratio'); set(gcf,'color','w'); grid on
% set(gca,'FontSize',12)
% subplot(3,2,2)
% sumOID_PcHH2 = sum(OID_PcHH);
% sumVAR_PcHH2 = sum(VAR_PcHH);
% sumOIDf_PcHH2= sum(OIDf_PcHH);
% hh4 = bar([sumOID_PcHH2, sumOIDf_PcHH2, sumVAR_PcHH2]*Sbase, 'FaceColor','flat');
% % for k = 1:size([sumOID_PcHH2 sumOIDf_PcHH2 sumVAR_PcHH2],2)
% %     hh4(k).CData = k;
% % end
% %hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% %hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% %hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
% %ylim([0 0.13]); 
% title('PV curtailment @ 6.9:1 ratio'); set(gcf,'color','w'); grid on
% set(gca,'FontSize',12)
% subplot(3,2,3)
% OID_PcHH4 = OID_I2R_1pm.store_Gug_Preal{start_No+4}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%            OID_I2R_1pm.store_Gug_Pinj{start_No+4}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%            OID_I2R_1pm.store_Gug_PcHH{start_No+4}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OID_PcHH4(OID_PcHH4  < 0) = 0;
% VAR_PcHH4 = VAR_I2R_1pm.store_VAR_Preal{start_No+4}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%            VAR_I2R_1pm.store_VAR_Pinj{start_No+4}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%            VAR_I2R_1pm.store_VAR_PcHH{start_No+4}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% VAR_PcHH4(VAR_PcHH4  < 0) = 0;
% OIDf_PcHH4 = OIDf_I2R_1pm.store_Gug_Preal{start_No+4}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%             OIDf_I2R_1pm.store_Gug_Pinj{start_No+4}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%         OIDf_I2R_1pm.store_Gug_PcHH{start_No+4}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OIDf_PcHH4(OIDf_PcHH4  < 0) = 0;
% hh4 = bar([OID_PcHH4', OIDf_PcHH4', VAR_PcHH4']*Sbase);
% hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
% ylim([0 12]); 
% ylabel('Curtailment [kW]');
% title('PV curtailment @ 8.5:1 ratio'); set(gcf,'color','w'); grid on
% set(gca,'FontSize',12)
% subplot(3,2,4)
% sumOID_PcHH = sum(OID_PcHH4);
% sumVAR_PcHH = sum(VAR_PcHH4);
% sumOIDf_PcHH = sum(OIDf_PcHH4);
% hh5 = bar([sumOID_PcHH, sumOIDf_PcHH, sumVAR_PcHH]*Sbase);
% %hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% %hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% %hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
% %ylim([0 0.13]); 
% title('PV curtailment @ 8.5:1 ratio'); set(gcf,'color','w'); grid on
% set(gca,'FontSize',12)
% subplot(3,2,5)
% OID_PcHH5 = OID_I2R_1pm.store_Gug_Preal{start_No+5}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%            OID_I2R_1pm.store_Gug_Pinj{start_No+5}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%           OID_I2R_1pm.store_Gug_PcHH{start_No+5}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OID_PcHH5(OID_PcHH5  < 0) = 0;
% VAR_PcHH5 = VAR_I2R_1pm.store_VAR_Preal{start_No+5}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%            VAR_I2R_1pm.store_VAR_Pinj{start_No+5}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%        VAR_I2R_1pm.store_VAR_PcHH{start_No+5}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% VAR_PcHH5(VAR_PcHH5  < 0) = 0;      
% OIDf_PcHH5 = OIDf_I2R_1pm.store_Gug_Preal{start_No+5}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%             OIDf_I2R_1pm.store_Gug_Pinj{start_No+5}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%             OIDf_I2R_1pm.store_Gug_PcHH{start_No+5}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OIDf_PcHH5(OIDf_PcHH5  < 0) = 0;
% hh3 = bar([OID_PcHH5', OIDf_PcHH5', VAR_PcHH5']*Sbase);
% hh3(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% hh3(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% hh3(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
% ylim([0 12]); 
% xlabel('House')
% title('PV curtailment @ 10.4:1 ratio'); set(gcf,'color','w'); grid on
% set(gca,'FontSize',12)
% subplot(3,2,6)
% sumOID_PcHH6 = sum(OID_PcHH5);
% sumVAR_PcHH6 = sum(VAR_PcHH5);
% sumOIDf_PcHH6 = sum(OIDf_PcHH5);
% hh6 = bar([sumOID_PcHH6, sumOIDf_PcHH6, sumVAR_PcHH6]*Sbase);
% %hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% %hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% %hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
% %ylim([0 0.13]);
% set(gca,'FontSize',11)
% xlabel('Total Curtailment')
% set(gca, 'XTickLabel', {'OID' 'OID+F' 'V/VAr'})
% title('Curtialment @ 10.4 ratio'); set(gcf,'color','w'); grid on
% %============================================================================================
% figure(410)
% start_No = 8;
% subplot(3,2,1)
% OID_PcHH = OID_I2R_1pm.store_Gug_Preal{start_No+6}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%            OID_I2R_1pm.store_Gug_Pinj{start_No+6}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%            OID_I2R_1pm.store_Gug_PcHH{start_No+6}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OID_PcHH(OID_PcHH  < 0) = 0;
% VAR_PcHH = VAR_I2R_1pm.store_VAR_Preal{start_No+6}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%            VAR_I2R_1pm.store_VAR_Pinj{start_No+6}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%            VAR_I2R_1pm.store_VAR_PcHH{start_No+6}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% VAR_PcHH(VAR_PcHH  < 0) = 0;
% OIDf_PcHH = OIDf_I2R_1pm.store_Gug_Preal{start_No+6}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%             OIDf_I2R_1pm.store_Gug_Pinj{start_No+6}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%             OIDf_I2R_1pm.store_Gug_PcHH{start_No+6}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OIDf_PcHH(OIDf_PcHH  < 0) = 0;
% hh1 = bar([OID_PcHH', OIDf_PcHH', VAR_PcHH']*Sbase);
% hh1(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% hh1(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% hh1(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
% ylim([0 12]); 
% legend({'OID', 'OIDf','Volt/VAr'},'Location','Northwest', 'FontSize', 13)
% title('PV curtailment @ 6.9:1 ratio'); set(gcf,'color','w'); grid on
% set(gca,'FontSize',12)
% subplot(3,2,2)
% sumOID_PcHH2 = sum(OID_PcHH);
% sumVAR_PcHH2 = sum(VAR_PcHH);
% sumOIDf_PcHH2= sum(OIDf_PcHH);
% hh4 = bar([sumOID_PcHH2, sumOIDf_PcHH2, sumVAR_PcHH2]*Sbase, 'FaceColor','flat');
% % for k = 1:size([sumOID_PcHH2 sumOIDf_PcHH2 sumVAR_PcHH2],2)
% %     hh4(k).CData = k;
% % end
% %hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% %hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% %hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
% %ylim([0 0.13]); 
% title('PV curtailment @ 6.9:1 ratio'); set(gcf,'color','w'); grid on
% set(gca,'FontSize',12)
% subplot(3,2,3)
% OID_PcHH4 = OID_I2R_1pm.store_Gug_Preal{start_No+7}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%            OID_I2R_1pm.store_Gug_Pinj{start_No+7}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%            OID_I2R_1pm.store_Gug_PcHH{start_No+7}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OID_PcHH4(OID_PcHH4  < 0) = 0;
% VAR_PcHH4 = VAR_I2R_1pm.store_VAR_Preal{start_No+7}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%            VAR_I2R_1pm.store_VAR_Pinj{start_No+7}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%            VAR_I2R_1pm.store_VAR_PcHH{start_No+7}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% VAR_PcHH4(VAR_PcHH4  < 0) = 0;
% OIDf_PcHH4 = OIDf_I2R_1pm.store_Gug_Preal{start_No+7}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
%             OIDf_I2R_1pm.store_Gug_Pinj{start_No+7}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
%         OIDf_I2R_1pm.store_Gug_PcHH{start_No+7}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% OIDf_PcHH4(OIDf_PcHH4  < 0) = 0;
% hh4 = bar([OID_PcHH4', OIDf_PcHH4', VAR_PcHH4']*Sbase);
% hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
% ylim([0 12]); 
% ylabel('Curtailment [kW]');
% title('PV curtailment @ 8.5:1 ratio'); set(gcf,'color','w'); grid on
% set(gca,'FontSize',12)
% subplot(3,2,4)
% sumOID_PcHH = sum(OID_PcHH4);
% sumVAR_PcHH = sum(VAR_PcHH4);
% sumOIDf_PcHH = sum(OIDf_PcHH4);
% hh5 = bar([sumOID_PcHH, sumOIDf_PcHH, sumVAR_PcHH]*Sbase);
% %hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% %hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% %hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
% %ylim([0 0.13]); 
% title('PV curtailment @ 8.5:1 ratio'); set(gcf,'color','w'); grid on
% set(gca,'FontSize',12)
% %%
% % subplot(3,2,5)
% % OID_PcHH5 = OID_I2R_1pm.store_Gug_Preal{start_No+8}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
% %            OID_I2R_1pm.store_Gug_Pinj{start_No+8}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
% %           OID_I2R_1pm.store_Gug_PcHH{start_No+8}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% % OID_PcHH5(OID_PcHH5  < 0) = 0;
% % VAR_PcHH5 = VAR_I2R_1pm.store_VAR_Preal{start_No+8}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
% %            VAR_I2R_1pm.store_VAR_Pinj{start_No+8}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
% %        VAR_I2R_1pm.store_VAR_PcHH{start_No+8}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% % VAR_PcHH5(VAR_PcHH5  < 0) = 0;      
% % OIDf_PcHH5 = OIDf_I2R_1pm.store_Gug_Preal{start_No+8}(1,[1 3:4 6:7 9:10 12:13 15:16 18])-...
% %             OIDf_I2R_1pm.store_Gug_Pinj{start_No+8}(1,[1 3:4 6:7 9:10 12:13 15:16 18])+...
% %             OIDf_I2R_1pm.store_Gug_PcHH{start_No+8}(1,[1 3:4 6:7 9:10 12:13 15:16 18]);
% % OIDf_PcHH5(OIDf_PcHH5  < 0) = 0;
% % hh3 = bar([OID_PcHH5', OIDf_PcHH5', VAR_PcHH5']*Sbase);
% % hh3(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% % hh3(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% % hh3(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
% % ylim([0 12]); 
% % xlabel('House')
% % title('PV curtailment @ 10.4:1 ratio'); set(gcf,'color','w'); grid on
% % set(gca,'FontSize',12)
% % subplot(3,2,6)
% % sumOID_PcHH6 = sum(OID_PcHH5);
% % sumVAR_PcHH6 = sum(VAR_PcHH5);
% % sumOIDf_PcHH6 = sum(OIDf_PcHH5);
% % hh6 = bar([sumOID_PcHH6, sumOIDf_PcHH6, sumVAR_PcHH6]*Sbase);
% % %hh4(1).FaceColor = 'b';% cov1(3).FaceColor = 'b'; cov1(5).FaceColor = 'b';
% % %hh4(2).FaceColor = 'g';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'g';
% % %hh4(3).FaceColor = 'r';% cov1(4).FaceColor = 'r'; cov1(6).FaceColor = 'r';
% % %ylim([0 0.13]);
% % set(gca,'FontSize',11)
% % xlabel('Total Curtailment')
% % set(gca, 'XTickLabel', {'OID' 'OID+F' 'V/VAr'})
% % title('Curtialment @ 10.4 ratio'); set(gcf,'color','w'); grid on

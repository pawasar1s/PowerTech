%% GRAPHS
% if plotting == 1 & matpower ==1
%     %nBuses = size(testCase.bus,1); % number of buses
%     nLines = size(testCase.branch,1); % number of lines
%     if matpower == 0
%         error('Graphs wont be displayed with matpower == 0, change to 1')
%     end
%     if multiPer == 0
%         % ============  FEEDER VOLTAGE PROFILE
%         f4 = figure(4);
%         movegui(f4,'northwest');
%         plot(1:nBuses,real(Gug_V),'r--')
%         hold on
%         plot(1:nBuses,abs(ACOPF_V'),'b--')
%         %plot([3 6 9 12 15 18],Gug_V([3 6 9 12 15 18]),'k*')  % poles
%         %plot([5 7 8 11 19],Gug_V([5 7 8 11 19]),'ko') % big solar
%         %plot([3 6 9 12 15 18],ACOPF_V([3 6 9 12 15 18]),'k*') % poles
%         %plot([5 7 8 11 19],ACOPF_V([5 7 8 11 19]),'ko') % big solar
%         hold off
%         xlabel('bus')
%         ylabel('Voltage [p.u.]')
%         xlim([1 nBuses]); ylim([0.90 1.15])
%         xticks(0:1:nBuses);
%         legend('V Gug','V MatPower','Poles','Large Solar','Location','SouthWest')
%         title('Voltage Profile')
%         set(gcf,'color','w');
%         grid on
%         %grid minor
%         % ============  LINE LOSSES
%         f5 = figure(5);
%         movegui(f5,'southwest');
%         %plot(1:size(ACOPF.branch,1),ACOPF_I2R(:,[25 40]),'+')
%         %hold on
%         plot(1:nLines,ACOPF_I2R','ro-')
%         hold on
%         plot(1:nLines, Gug_I2R,'ko-')
%         legend({'Linearised','ACOPF'})
% %         plot([1 4 7 10 13 16], ACOPF_I2R([1 4 7 10 13 16]),'ko-')
% %         hold on
% %         plot([2 3 5 6 8 9 11 12 14 15 17 18], ACOPF_I2R([2 3 5 6 8 9 11 12 14 15 17 18]),'k*')
% %         %
% %         plot([1 4 7 10 13 16], Gug_I2R([1 4 7 10 13 16]),'ro-')
% %         hold on
% %         plot([2 3 5 6 8 9 11 12 14 15 17 18], Gug_I2R([2 3 5 6 8 9 11 12 14 15 17 18]),'r*')
%         xlabel('Lines')
%         ylabel('Line losses [kW]')
%         %legend('ACOPF Pole-to-pole','ACOPF Drop Lines',...
%         %    'Gug Pole-to-pole', 'Gug Drop Lines','Location','NorthEast')
%         title('Line Losses')
%         xlim([0 nLines]);
%         %xticks(1:1:size(ACOPF.branch,1));
%         set(gcf,'color','w');
%         grid on
%         %grid minor
%         % ============  ACTIVE/REACTIVE POWER PURCHASE
%     elseif multiPer == 1
%         UB = ones(size(solar,1),1)*1.05;
%         timE = 0:minutes(30):hours(23.5);
%         tt = 1:48;
%         % ============  LOAD PROFILES
%         % figure(1)
%         % plot(loadHH)
%         % xlabel('Periods')
%         % ylabel('Household Loads [kW]')
%         % xlim([1 48]);
%         % set(gcf,'color','w');
%         % grid on
%         % figure(10)
%         % plot(sum(loadHH,2))
%         % xlabel('Periods')
%         % ylabel('Household Loads [kW]')
%         % Voltage profile for 3 poles over day
%         
%         % figure(2) ============  ANIMATION
%         % pol0 = animatedline('Marker','*','Color','r');
%         % pol1 = animatedline('Color','r');
%         % pol2 = animatedline('Color','b');
%         % pol3 = animatedline('Color','k');
%         % axis([1 T 0.94 1.08])
%         % set(gcf,'color','w');
%         % for k = 1:length(tt)
%         %     addpoints(pol0,tt(k),UB(k));
%         %     addpoints(pol1,tt(k),ACOPF_V(k,3));
%         %     addpoints(pol2,tt(k),ACOPF_V(k,9));
%         %     addpoints(pol3,tt(k),ACOPF_V(k,18));
%         %     %xticks(0:0.5:24);
%         %     drawnow
%         %     grid on
%         %     xlabel('Time (Hour)')
%         %     title('Voltage profile over day')
%         %     pause(.15)
%         % end
%         
%         % ============  VOLTAGE OVER DAY FOR 3 BUSES
%         f3 = figure(3) 
%         movegui(f3,'southwest');
%         plot(timE,ACOPF_V(:,3),'r')
%         hold on
%         plot(timE,ACOPF_V(:,9),'b')
%         plot(timE,ACOPF_V(:,18),'k')
%         plot(timE,abs(Gug_V(:,3)),'r--')
%         plot(timE,abs(Gug_V(:,9)),'b--')
%         plot(timE,abs(Gug_V(:,18)),'k--')
%         %plot(timE,ones(T,1)*1.05,'Marker','*','Color','r')
%         hold off
%         %plot(t,ones(size(solarHH,1),1)*0.95,'Marker','*','Color','r')
%         xlabel('Time (Hour)')
%         ylabel('Voltage [p.u.]')
%         ylim([0.94 1.1])
%         %xticks(0:2:size(loadHH,1));
%         title('Voltage profile over day')
%         legend({'ACOPF: Pole 3','ACOPF: Pole 9','ACOPF: Pole 18','Gug: Pole 3','Gug: Pole 9','Gug: Pole 18'},'Location','northwest')
%         set(gcf,'color','w');
%         grid on
%         
%         % ============  FEEDER VOLTAGE PROFILE
%         f4 = figure(4);
%         movegui(f4,'northwest');
%         %plot(1:nBuses,voltageVec)
%         %hold on
%         %plot([3 6 9 12 15 18],voltageVec([3 6 9 12 15 18]),'b*')  % poles
%         %hold on
%         plot(1:nBuses,ACOPF_V(26,:),'r')
%         hold on
%         plot(1:nBuses,ACOPF_V(40,:),'b')
%         plot(1:nBuses,abs(Gug_V(26,:)),'r--')
%         plot(1:nBuses,abs(Gug_V(40,:)),'b--')
%         plot([3 6 9 12 15 18],ACOPF_V(26,[3 6 9 12 15 18]),'k*') % poles
%         plot([5 7 8 11 19],ACOPF_V(26,[5 7 8 11 19]),'ro') % big solar
%         %plot([3 6 9 12 15 18],ACOPF_V(40,[3 6 9 12 15 18]),'k*') % poles
%         %plot([5 7 8 11 19],ACOPF_V(40,[5 7 8 11 19]),'ro') % big solar
%         plot([3 6 9 12 15 18],abs(Gug_V(40,[3 6 9 12 15 18])),'k*') % poles
%         plot([5 7 8 11 19],abs(Gug_V(40,[5 7 8 11 19])),'ro') % big solar
%         hold off
%         xlabel('bus')
%         ylabel('Voltage [p.u.]')
%         xlim([1 nBuses]); ylim([0.95 1.1])
%         xticks(0:1:nBuses);
%         legend('ACOPF: V @ 1.00pm','ACOPF: V @ 8.00pm','Gug: V @ 1.00pm','Gug: V @ 8.00pm','Location','SouthWest')
%         title('Voltage Profile')
%         set(gcf,'color','w');
%         grid on
%         grid minor
%         
%         % ============  LINE LOSSES
%         f5 = figure(5);
%         movegui(f5,'southeast');
%         %plot(1:size(ACOPF.branch,1),ACOPF_I2R(:,[25 40]),'+')
%         %hold on
%         plot([1 4 7 10 13 16], ACOPF_I2R([26 40],[1 4 7 10 13 16]),'ro')
%         hold on
%         plot([1 4 7 10 13 16], abs(Gug_I2RTot([26 40],[1 4 7 10 13 16])),'bo')
%         plot([2 3 5 6 8 9 11 12 14 15 17 18], ACOPF_I2R([26 40],[2 3 5 6 8 9 11 12 14 15 17 18]),'*')
%         plot([2 3 5 6 8 9 11 12 14 15 17 18], abs(Gug_I2RTot([26 40],[2 3 5 6 8 9 11 12 14 15 17 18])),'*')
%         xlabel('Lines')
%         ylabel('Line losses [kW]')
%         legend('ACOPF: Pole-to-pole @ 1.00pm','ACOPF: Pole-to-pole @ 8.00pm',...
%             'Gug: Pole-to-pole @ 1.00pm','Gug: Pole-to-pole @ 8.00pm',...
%             'Location','NorthEast')
%         title('Line Losses')
%         xlim([0 nLines]); %ylim([0.9 1.05])
%         %xticks(1:1:size(ACOPF.branch,1));
%         set(gcf,'color','w');
%         grid on
%         grid minor
%         %% ==============  CURRENT
%         figure(70)
%         plot(1:18, (ACOPF_I(:,:))'); 
%         hold on;  
%         plot([1 4 7 10 13 16],ACOPF_I(:,[1 4 7 10 13 16]),'k*') % poles
%         hold on;
%         plot([1 4 7 10 13 16],ACOPF_I(:,[1 4 7 10 13 16]),'k*') % poles
%         plot([5 6 8 11 18],ACOPF_I(:,[5 6 8 11 18]),'ko') % poles
%        %ylim([-60 90])
%         figure(71)
%         plot(1:18, (Gug_ITot(:,:))'); 
%         hold on;  
%         plot([1 4 7 10 13 16],Gug_ITot(:,[1 4 7 10 13 16]),'ko') % poles
%         %%
%         idxHH = find(testCase.bus(2:end,2) ~= 2); % idx for buses with PV
%         % update load data
%         myloads = loadHH; % Pg
%         myloads(:,idxHH) = 0; 
%         figure(72)
%         boxplot((myloads(:,:))); 
%         hold on;  
%         title('loads') 
%         ylabel('Load [kW]')
%         plot([2 5 8 11 14 17],ACOPF_I(:,[2 5 8 11 14 17]),'k*') % poles
%         %% ============  REACTIVE POWER PURCHASE
%         f7 = figure(7);
%         movegui(f7,'northeast');
%         %plot(timE, ACOPF_PgQg)
%         %hold on
%         %plot(timE, loadTotal, 'g')
%         %hold on
%         %plot(timE, abs(sum(ACOPF_I2R,2)), 'k','LineWidth',2)
%         plot(timE, abs(Gug_QgTot), 'r','LineWidth',2)
%         % yyaxis right
%         % plot(t, ACOPF_f,'*')
%         hold off
%         xlabel('Time [Hours]')
%         ylabel('Grid Purchases [kW]')
%         legend('Active Grid Power (P)','Reactive Grid Power (Q)','Total Load','Line Losses','Location','SouthWest')
%         title('Reactive power from the grid')
%         grid on
%         set(gcf,'color','w');
%         %% ============  Volt/Var
%         f8 = figure(8);
%         movegui(f8,'northeast');        
%         scatter(Gug_V(:,18),-abs(Gug_QcTot))
%         xlim([0.93 1.1])
%         %ylim([-0.01 0.01])
%         xlabel('Voltage Magnitude [p.u.]')
%         ylabel('Reactive Power [kVAR]')
%         grid on
%         set(gcf,'color','w');    
%         % ============  VOlt/Watt
%         f9 = figure(9);
%         movegui(f9,'southeast');        
%         scatter(Gug_V(:,18),abs(Gug_PcTot))
%         xlim([0.93 1.1])
%         %ylim([-0.01 0.01])
%         xlabel('Voltage Magnitude [p.u.]')
%         ylabel('Active Power [kW]')
%         grid on
%         set(gcf,'color','w');    
%     end
% if solarScen == 1
%     f9 = figure(9) 
%         movegui(f9,'southwest');
%         %plot(timE,store_Gug_V(abs(Gug_V(:,3)),'r--')
%         %hold on
%         %plot(timE,abs(Gug_V(:,9)),'b--')
%         plot(timE,abs(store_Gug_V),'k--')
%         %plot(timE,ones(T,1)*1.05,'Marker','*','Color','r')
%         %hold off
%         %plot(t,ones(size(solarHH,1),1)*0.95,'Marker','*','Color','r')
%         xlabel('Time (Hour)')
%         ylabel('Voltage [p.u.]')
%         ylim([0.94 1.08])
%         %xticks(0:2:size(loadHH,1));
%         title('Voltage profile over day')
%         legend({'ACOPF: Pole 3','ACOPF: Pole 9','ACOPF: Pole 18','Gug: Pole 3','Gug: Pole 9','Gug: Pole 18'},'Location','northwest')
%         set(gcf,'color','w');
%         grid on    
% end
%     define_constants;
%     mpcbase = loadcase('IEEE_18BUS');
%     mpcbase.bus(:, PD) = 0;
%     mpcbase.bus(:, QD) = 0;
%     mpcbase.gen(:, PG) = 0;
%     mpctarget = loadcase('IEEE_18BUS');
%     results = runcpf(mpcbase, mpctarget);
%     results.cpf.max_lam
%%
%     for k = 1 : nRandLoc 
            %rng default
%         if nRandLoc > 1 
%             permVec = randperm(12); % returns a row vector containing a random permutation of the integers from 1 to n inclusive.
%             PVsizeVec = PVsizeVec(permVec) 
%             PVcap = PVsizeVec*PVsysEff; 
%         end
%%
%             elseif saveRes == 2
%                 OID_relocation_I2R = table(store_Gug_I2R); % 5x41 times x scenarios
%                 save('C:\Users\plus0002\OneDrive\PhD\DTUnew\OID_relocation_I2R.mat', 'OID_relocation_I2R')
%                 OID_relocation_Pc = table(store_Gug_PcHH); % 1x41
%                 save('C:\Users\plus0002\OneDrive\PhD\DTUnew\OID_relocation_Pc.mat', 'OID_relocation_Pc')
%                 OID_relocation_Pen = table(store_Gug_Penet'); % 1 x 41
%                 save('C:\Users\plus0002\OneDrive\PhD\DTUnew\OID_relocation_Pen.mat', 'OID_relocation_Pen')
%             end
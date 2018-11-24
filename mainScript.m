clear; clc; close all; 
addpath(genpath('matpower7.0b1')); addpath(genpath('cvx')); addpath(genpath('SC_Cases')); 
addpath(genpath('IEEECases')); addpath(genpath('readMatPower')); addpath(genpath('Results')); 
addpath(genpath('C:\Users\plus0002\OneDrive\PhD\PowerTech2018\cvx\functions\vec_'))  
rmpath('cvx/lib/narginchk_') % remove this function to avoid a potential name conflict 
%checkcode Guggilam -cyc %% -> Applies McCabe Complexity (should keep below 10)  

% ===================== SETTINGS ======================
multiPer = 1; % 1: multiperiod model, 0: discretised model 
per = 26; % for discretised model, which period to test? 26: 1pm (30min intervals) 
OID_model = 2; % 1: run Guggilam OID model, 2: run Volt/Var droop control model  
plotting = 0; % 1: YES, 0: NO 
saveRes = 1; % 0: don't save 1: save for single location, 2: save losses for random locations
%solarCap = [1 2 2.5]; % solar PV capacity multiplier
%solarCap = 2; i = 1; % solar PV capacity multiplier 
solarCap = 0:0.15:3.6;% 25 scenario
%solarCap = 0:0.15:3.6;% 25 scenario
nRandLoc = 1; % No of scnearios with rand location 
nRandCap = length(solarCap); % No of penetration scnearios 
% Defines the number of periods and allocates memory
if multiPer == 1
    T = 26; % 26 is 1pm, set to 26 for complete results
    T0 = 26; % set to 26 for complete results, 1:48 used only during manual code validation 
else
    T = 1; 
end
% ================== Allocate empty matrices ===========
if OID_model == 1 
    store_Gug_V18 = complex(zeros(T-T0+1, nRandCap)); % voltage vector, house 18
    store_Gug_V9 = complex(zeros(T-T0+1, nRandCap)); % voltage vector, house 9
    store_Gug_V3 = complex(zeros(T-T0+1, nRandCap)); % voltage vector, house 3
    store_Gug_Pc = complex(zeros(T-T0+1, nRandCap)); % Pc - curtailment
    store_Gug_Qc = complex(zeros(T-T0+1, nRandCap)); % Qc - from PV
    store_Gug_Qg = complex(zeros(T-T0+1, nRandCap)); % Qg - from grid
    store_Gug_Pg = complex(zeros(T-T0+1, nRandCap)); % Pg - from grid
    store_Gug_V = cell(1, nRandCap); 
    store_Gug_Preal = cell(1, nRandCap);
    store_Gug_Sreal = cell(1, nRandCap);
    store_Gug_I2R = cell(nRandLoc, nRandCap); % line losses
    store_Gug_I = cell(1, nRandCap); % line current 
    store_Gug_Vdrop = cell(1, nRandCap); % voltage drop
    store_Gug_Penet = zeros(nRandCap, 1); % penetration levels
    store_Gug_PVCap = zeros(nRandCap, 1); % total PV capacity
    store_Gug_PVGen = zeros(nRandCap, 1); % total PV generated
    store_Gug_Scap = cell(1, nRandCap); % max inverter capacity 
    store_Gug_Pcap = cell(1, nRandCap); % Pav 
    store_Gug_Pinj = cell(1, nRandCap); %Sinj real 
    store_Gug_PF = cell(1, nRandCap); %Sinj real
    store_Gug_PcHH = cell(nRandLoc, nRandCap);
elseif OID_model == 2 
    store_VAR_V18 = complex(zeros(T-T0+1,nRandCap)); % voltage vector, house 18
    store_VAR_V9 = complex(zeros(T-T0+1, nRandCap)); % voltage vector, house 9
    store_VAR_V3 = complex(zeros(T-T0+1, nRandCap)); % voltage vector, house 3
    store_VAR_Pc = complex(zeros(T-T0+1, nRandCap)); % Pc - curtailment
    store_VAR_Qc = complex(zeros(T-T0+1, nRandCap)); % Qc - from PV
    store_VAR_Qg = complex(zeros(T-T0+1, nRandCap)); % Qg - from grid
    store_VAR_Pg = complex(zeros(T-T0+1, nRandCap)); % Pg - from grid
    store_VAR_V = cell(1, nRandCap);
    store_VAR_Preal = cell(1, nRandCap);
    store_VAR_Sreal = cell(1, nRandCap);
    store_VAR_I2R = cell(nRandLoc, nRandCap); % line losses
    store_VAR_I = cell(1, nRandCap); % line current 
    store_VAR_Vdrop = cell(1, nRandCap); % voltage drop
    store_VAR_Penet = zeros(nRandCap, 1); % penetration levels 
    store_VAR_PVCap = zeros(nRandCap, 1); % total PV capacity
    store_VAR_PVGen = zeros(nRandCap, 1); % total PV generated
    store_VAR_Scap = cell(1, nRandCap); % max inverter capacity 
    store_VAR_Pcap = cell(1, nRandCap); % Pav 
    store_VAR_Pinj = cell(1, nRandCap); %Sinj real
    store_VAR_PF = cell(1, nRandCap); %Sinj real
    store_VAR_PcHH = cell(nRandLoc, nRandCap); 
end
%% No of Scenarios
for i = 1 : nRandCap
    rng default % generates the same random scenarios
    PVsizeVec = [5.52 5.7 9.0 9.0 9.0 5.7 9.0 5.7 5.52 5.52 5.7 9.0]; % a vector with PV systems
    PVsysEff = 0.77; 
    PVcap = PVsizeVec*PVsysEff; 
    testCase = IEEE_18BUS_PV; 
    % No of Random Locations 
    for k = 1 : nRandLoc 
        if nRandLoc > 1 
            permVec = randperm(12); % returns a row vector containing a random permutation of the integers from 1 to n inclusive.
            PVsizeVec = PVsizeVec(permVec) 
            PVcap = PVsizeVec*PVsysEff; 
        end
        % ===============
        % testCase = matpower_LV_semiurban; % works fine
        % testCase = matpower_rural; % that's a big one, only MatPower
        % network2 = networkViz(testCase); % network viz
        %% Load Data
        [solar, solarTotal, solarGen, loadHH, loadTotal, timestamp, penetration, nBuses] = dataInput(testCase, solarCap(i), PVcap);
        %% Guggilam OID model
        if OID_model == 1
            [V, Pcurt, Qc, Vmax, Gug_V, Gug_I2R, Gug_ITot, Gug_Vdrop, Gug_Preal, Gug_Sreal, Gug_PgTot, Gug_QgTot, Gug_I2RTot, Gug_PcTot, Gug_QcTot, Gug_max_Scap, Gug_max_Pcap, Gug_Pinj, Gug_check_PF, Gug_PcHH] = Guggilam(testCase, T, T0, solar, loadHH, multiPer, per, plotting, PVcap);
            % store results
            store_Gug_V18(:,i) = Gug_V(:,18); %voltage vector Bus 18
            store_Gug_V9(:,i) = Gug_V(:,9); % voltage vector Bus 9
            store_Gug_V3(:,i) = Gug_V(:,3); % voltage vector Bus 3
            store_Gug_Pc(:,i) = Gug_PcTot; % Pc - curtailment
            store_Gug_Qc(:,i) = Gug_QcTot; % Qc - from PV
            store_Gug_Qg(:,i) = Gug_QgTot; % Qg - from grid
            store_Gug_Pg(:,i) = Gug_PgTot; % Pg - from grid
            store_Gug_V{i} = Gug_V; % V - voltage
            store_Gug_Preal{i} = Gug_Preal;
            store_Gug_Sreal{i} = Gug_Sreal;
            store_Gug_I2R{k,i} = Gug_I2RTot; % line loss
            store_Gug_I{i} = Gug_ITot; % line current
            store_Gug_Vdrop{i} = Gug_Vdrop; % voltage drop
            store_Gug_Penet(i) = penetration; % penetration level
            store_Gug_PVCap(i) = solarTotal; % total solar PV capacity
            store_Gug_PVGen(i) = solarGen; % total PV generated
            store_Gug_Scap{i} = Gug_max_Scap; % max inverter capacity
            store_Gug_Pcap{i} = Gug_max_Pcap; % Pav
            store_Gug_Pinj{i} = Gug_Pinj;
            store_Gug_PF{i} = Gug_check_PF;
            store_Gug_PcHH{k,i} = Gug_PcHH;
            % save output to .mat file
            if saveRes == 1
                if Vmax(2) > 1.05
                    noLim_Voltage = table( store_Gug_V18, store_Gug_V9, store_Gug_V3);
                    save('noLim_Voltage.mat', 'noLim_Voltage')
                    noLim_PQ = table(store_Gug_Pc, store_Gug_Qc, store_Gug_Pg, store_Gug_Qg);
                    save('noLim_PQ.mat', 'noLim_PQ')
                    noLim_I2R_Drop = table(store_Gug_I2R, store_Gug_I, store_Gug_Scap, store_Gug_Pcap, store_Gug_Pinj, store_Gug_PF, store_Gug_PcHH);
                    save('noLim_I2R_Drop.mat', 'noLim_I2R_Drop')
                    noLim_capPen = table(store_Gug_Penet, store_Gug_PVCap, store_Gug_PVGen);
                    save('noLim_capPen.mat', 'noLim_capPen')
                elseif Vmax(2) == 1.05
                    OID_V_1pm = table( store_Gug_V18, store_Gug_V9, store_Gug_V3); % 1x41 times x scenarios
                    save('OID_V_1pm_no.mat', 'OID_V_1pm')
                    OID_PQ_1pm = table(store_Gug_Pc, store_Gug_Qc, store_Gug_Pg, store_Gug_Qg); % 1x41
                    save('OID_PQ_1pm.mat', 'OID_PQ_1pm')
                    OID_I2R_1pm = table(store_Gug_I2R, store_Gug_I, store_Gug_Preal, store_Gug_Sreal, store_Gug_V, store_Gug_Vdrop, store_Gug_Scap, store_Gug_Pcap, store_Gug_Pinj, store_Gug_PF, store_Gug_PcHH); % 1x41 cell
                    save('OID_I2R_1pm.mat', 'OID_I2R_1pm')
                    OID_penet_1pm = table(store_Gug_Penet', store_Gug_PVCap', store_Gug_PVGen'); % 1 x 41
                    save('OID_penet_1pm.mat', 'OID_penet_1pm')
                end
            % saves results for random locations
            elseif saveRes == 2
                OID_relocation_I2R = table(store_Gug_I2R); % 5x41 times x scenarios
                save('C:\Users\plus0002\OneDrive\PhD\DTUnew\OID_relocation_I2R.mat', 'OID_relocation_I2R')
                OID_relocation_Pc = table(store_Gug_PcHH); % 1x41
                save('C:\Users\plus0002\OneDrive\PhD\DTUnew\OID_relocation_Pc.mat', 'OID_relocation_Pc')
                OID_relocation_Pen = table(store_Gug_Penet'); % 1 x 41
                save('C:\Users\plus0002\OneDrive\PhD\DTUnew\OID_relocation_Pen.mat', 'OID_relocation_Pen')
            end
            % Volt/VAR droop model
        elseif OID_model == 2
            [V, Pcurt, Qc, Vmax, Gug_V, Gug_I2R, Gug_ITot, Gug_Vdrop, Gug_Preal, Gug_Sreal, Gug_PgTot, Gug_QgTot, Gug_I2RTot, Gug_PcTot, Gug_QcTot, Gug_max_Scap, Gug_max_Pcap, Gug_Pinj, Gug_check_PF, Gug_PcHH] = VoltVar(testCase, T, T0, solar, loadHH, multiPer, per, plotting);
            % store results
            store_VAR_V18(:,i) = Gug_V(:,18); % voltage vector Bus 18
            store_VAR_V9(:,i) = Gug_V(:,9); % voltage vector Bus 9
            store_VAR_V3(:,i) = Gug_V(:,3); % voltage vector Bus 3
            store_VAR_Pc(:,i) = Gug_PcTot; % Pc - curtailment
            store_VAR_Qc(:,i) = Gug_QcTot; % Qc - from PV
            store_VAR_Qg(:,i) = Gug_QgTot; % Qg - from grid
            store_VAR_Pg(:,i) = Gug_PgTot; % Pg - from grid
            store_VAR_V{i} = Gug_V; % V - voltage
            store_VAR_Preal{i} = Gug_Preal;
            store_VAR_Sreal{i} = Gug_Sreal;
            store_VAR_I2R{k,i} = Gug_I2RTot; % line loss
            store_VAR_I{i} = Gug_ITot; % current loss
            store_VAR_Vdrop{i} = Gug_Vdrop; % voltage drop
            store_VAR_Penet(i) = penetration; % penetration level
            store_VAR_PVCap(i) = solarTotal; % total solar PV capacity
            store_VAR_PVGen(i) = solarGen; % total PV generated
            store_VAR_Scap{i} = Gug_max_Scap; % max inverter capacity
            store_VAR_Pcap{i} = Gug_max_Pcap; % Pav
            store_VAR_Pinj{i} = Gug_Pinj;
            store_VAR_PF{i} = Gug_check_PF;
            store_VAR_PcHH{k,i} = Gug_PcHH; 
            % save output to .mat file
            if saveRes == 1
                VAR_V_1pm = table( store_VAR_V18, store_VAR_V9, store_VAR_V3);
                save('VAR_V_1pm.mat', 'VAR_V_1pm')
                VAR_PQ_1pm = table(store_VAR_Pc, store_VAR_Qc, store_VAR_Pg, store_VAR_Qg);
                save('VAR_PQ_1pm.mat', 'VAR_PQ_1pm')
                VAR_I2R_1pm = table(store_VAR_I2R, store_VAR_I, store_VAR_Preal, store_VAR_Sreal, store_VAR_V, store_VAR_Vdrop, store_VAR_Scap, store_VAR_Pcap, store_VAR_Pinj, store_VAR_PF);
                save('VAR_I2R_1pm.mat', 'VAR_I2R_1pm')
                VAR_penet_1pm = table(store_VAR_Penet, store_VAR_PVCap, store_VAR_PVGen);
                save('VAR_penet_1pm.mat', 'VAR_penet_1pm')
             elseif saveRes == 2
                VAR_relocation_I2R = table(store_VAR_I2R); % 5x41 times x scenarios
                save('C:\Users\plus0002\OneDrive\PhD\DTUnew\VAR_relocation_I2R.mat', 'VAR_relocation_I2R')
                VAR_relocation_Pc = table(store_VAR_PcHH); % 1x41
                save('C:\Users\plus0002\OneDrive\PhD\DTUnew\VAR_relocation_Pc.mat', 'VAR_relocation_Pc')
                VAR_relocation_Pen = table(store_VAR_Penet'); % 1 x 41
                save('C:\Users\plus0002\OneDrive\PhD\DTUnew\VAR_relocation_Pen.mat', 'VAR_relocation_Pen')
            end
        end
    end
end
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


clear all; clc; close all; 
%%
addpath(genpath('matpower7.0b1')); addpath(genpath('cvx')); addpath(genpath('SC_Cases')); 
addpath(genpath('IEEECases')); addpath(genpath('readMatPower')); addpath(genpath('Results')); addpath(genpath('output')); 
addpath(genpath('C:\Users\plus0002\OneDrive\PhD\PowerTech2018\cvx\functions\vec_'))  
rmpath('cvx/lib/narginchk_') % remove this function to avoid a potential name conflict 
%checkcode Guggilam -cyc %% -> Applies McCabe Complexity (should keep below 10)  
% ===================== SETTINGS ======================
multiPer = 1; % 1: multiperiod model, 0: discretised model 
per = 13; % for discretised model, which period to test? 26: 1pm (30min intervals) 
if multiPer == 1
    T = 13; % 26 is 1pm, set to 26 for complete results
    T0 = 13; % set to 26 for complete results, 1:48 used only during manual code validation 
end     
    k = 2; kappa = [0.01 0.025 0.1 0.125]; 
    %%
for g = 1 : 3  
    OID_model = g; % 1: run Guggilam OID model, 2: run Volt/Var droop control model
    plotting = 0; % 1: YES, 0: NO
    saveRes = 1; % 0: don't save 1: save for single location, 2: save losses for random locations
    %solarCap = [1 2 2.5]; % solar PV capacity multiplier
    %solarCap = 1.7; i = 1; % solar PV capacity multiplier
    solarCap = 0.1:0.2:3; % solar PV capacity multiplier
    nRandCap = length(solarCap); % No of penetration scnearios
    %% ================== Allocate empty matrices ===========
    nRandLoc = 1; % No of scnearios with rand location
    if OID_model == 1 || 2 
        store_Gug_V18 = complex(zeros(T-T0+1, nRandCap)); % voltage vector, house 18
        store_Gug_V9 = complex(zeros(T-T0+1, nRandCap)); % voltage vector, house 9
        store_Gug_V3 = complex(zeros(T-T0+1, nRandCap)); % voltage vector, house 3
        store_Gug_Pc = zeros(T-T0+1, nRandCap); % Pc - curtailment
        store_Gug_Qc = zeros(T-T0+1, nRandCap); % Qc - from PV
        store_Gug_Qg = zeros(T-T0+1, nRandCap); % Qg - from grid
        store_Gug_Pg = zeros(T-T0+1, nRandCap); % Pg - from grid
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
    elseif OID_model == 3
        store_VAR_V18 = complex(zeros(T-T0+1,nRandCap)); % voltage vector, house 18
        store_VAR_V9 = complex(zeros(T-T0+1, nRandCap)); % voltage vector, house 9
        store_VAR_V3 = complex(zeros(T-T0+1, nRandCap)); % voltage vector, house 3
        store_VAR_Pc = zeros(T-T0+1, nRandCap); % Pc - curtailment
        store_VAR_Qc = zeros(T-T0+1, nRandCap); % Qc - from PV
        store_VAR_Qg = zeros(T-T0+1, nRandCap); % Qg - from grid
        store_VAR_Pg = zeros(T-T0+1, nRandCap); % Pg - from grid
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
    %% Looping over different models
    PVsizeVec = ones(1,12)*5; % a vector with PV systems
    PVsysEff = 0.8; 
    PVcap = PVsizeVec*PVsysEff;  
    testCase = IEEE_18BUS_PV; 
    % No of Random Locations 
        % ===============
        % testCase = matpower_LV_semiurban; % works fine
        % testCase = matpower_rural; % that's a big one, only MatPower
        % network2 = networkViz(testCase); % network viz
   for i = 1 : nRandCap
   % Load Data 
   [solar, solarTotal, solarGen, loadHH, loadTotal, penetration, nBuses, Pd12, temp] = dataInput(testCase, solarCap(i), PVcap, T);
        %% Guggilam OID model
        if OID_model == 1
            [V, Pcurt, Qc, Vmax, Gug_V, Gug_I2R, Gug_ITot, Gug_Vdrop, Gug_Preal, Gug_Sreal, Gug_PgTot, Gug_QgTot, Gug_I2RTot, Gug_PcTot, Gug_QcTot, Gug_max_Scap, Gug_max_Pcap, Gug_Pinj, Gug_check_PF, Gug_PcHH] = OID(testCase, T, T0, solar, loadHH, multiPer, per, plotting, PVcap, Pd12);
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
            store_Gug_I2R{1,i} = Gug_I2RTot; % line loss
            store_Gug_I{i} = Gug_ITot; % line current
            store_Gug_Vdrop{i} = Gug_Vdrop; % voltage drop
            store_Gug_Penet(i) = penetration; % penetration level
            store_Gug_PVCap(i) = solarTotal; % total solar PV capacity
            store_Gug_PVGen(i) = solarGen; % total PV generated
            store_Gug_Scap{i} = Gug_max_Scap; % max inverter capacity
            store_Gug_Pcap{i} = Gug_max_Pcap; % Pav
            store_Gug_Pinj{i} = Gug_Pinj;
            store_Gug_PF{i} = Gug_check_PF;
            store_Gug_PcHH{1,i} = Gug_PcHH;
            % save output to .mat file
            if saveRes == 1
%              if Vmax(2) > 1.05
%                     noLim_Voltage = table( store_Gug_V18, store_Gug_V9, store_Gug_V3);
%                     save('output/OID_V_1pm_no.mat', 'noLim_Voltage')
%                     noLim_PQ = table(store_Gug_Pc, store_Gug_Qc, store_Gug_Pg, store_Gug_Qg);
%                     save('output/OID_PQ_1pm.mat', 'noLim_PQ')
%                     noLim_I2R_Drop = table(store_Gug_I2R, store_Gug_I, store_Gug_Scap, store_Gug_Pcap, store_Gug_Pinj, store_Gug_PF, store_Gug_PcHH);
%                     save('output/OID_I2R_1pm.mat', 'noLim_I2R_Drop')
%                     noLim_capPen = table(store_Gug_Penet, store_Gug_PVCap, store_Gug_PVGen);
%                     save('output/OID_penet_1pm.mat', 'noLim_capPen')
                OID_V_1pm = table( store_Gug_V18, store_Gug_V9, store_Gug_V3); % 1x41 times x scenarios
                save('C:\Dev\OID_V_1pm_no.mat', 'OID_V_1pm')
                OID_PQ_1pm = table(store_Gug_Pc, store_Gug_Qc, store_Gug_Pg, store_Gug_Qg); % 1x41
                save('C:\Dev\OID_PQ_1pm.mat', 'OID_PQ_1pm')
                OID_I2R_1pm = table(store_Gug_I2R, store_Gug_I, store_Gug_Preal, store_Gug_Sreal, store_Gug_V, store_Gug_Vdrop, store_Gug_Scap, store_Gug_Pcap, store_Gug_Pinj, store_Gug_PF, store_Gug_PcHH); % 1x41 cell
                save('C:\Dev\OID_I2R_1pm.mat', 'OID_I2R_1pm')
                OID_penet_1pm = table(store_Gug_Penet', store_Gug_PVCap', store_Gug_PVGen'); % 1 x 41
                save('C:\Dev\OID_penet_1pm.mat', 'OID_penet_1pm')
             end
        elseif OID_model == 2 
            [V, Pcurt, Qc, Vmax, Gug_V, Gug_I2R, Gug_ITot, Gug_Vdrop, Gug_Preal, Gug_Sreal, Gug_PgTot, Gug_QgTot, Gug_I2RTot, Gug_PcTot, Gug_QcTot, Gug_max_Scap, Gug_max_Pcap, Gug_Pinj, Gug_check_PF, Gug_PcHH] = FOID(testCase, T, T0, solar, loadHH, multiPer, per, plotting, PVcap, Pd12, kappa(k));
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
            store_Gug_I2R{1,i} = Gug_I2RTot; % line loss
            store_Gug_I{i} = Gug_ITot; % line current
            store_Gug_Vdrop{i} = Gug_Vdrop; % voltage drop
            store_Gug_Penet(i) = penetration; % penetration level
            store_Gug_PVCap(i) = solarTotal; % total solar PV capacity
            store_Gug_PVGen(i) = solarGen; % total PV generated
            store_Gug_Scap{i} = Gug_max_Scap; % max inverter capacity
            store_Gug_Pcap{i} = Gug_max_Pcap; % Pav
            store_Gug_Pinj{i} = Gug_Pinj;
            store_Gug_PF{i} = Gug_check_PF;
            store_Gug_PcHH{1,i} = Gug_PcHH;
            % save output to .mat file
            if saveRes == 1       
                OIDf_V_1pm = table( store_Gug_V18, store_Gug_V9, store_Gug_V3); % 1x41 times x scenarios
                save('C:\Dev\OIDf_V_1pm_no.mat', 'OIDf_V_1pm')
                OIDf_PQ_1pm = table(store_Gug_Pc, store_Gug_Qc, store_Gug_Pg, store_Gug_Qg); % 1x41
                save('C:\Dev\OIDf_PQ_1pm.mat', 'OIDf_PQ_1pm')
                OIDf_I2R_1pm = table(store_Gug_I2R, store_Gug_I, store_Gug_Preal, store_Gug_Sreal, store_Gug_V, store_Gug_Vdrop, store_Gug_Scap, store_Gug_Pcap, store_Gug_Pinj, store_Gug_PF, store_Gug_PcHH); % 1x41 cell
                save('C:\Dev\OIDf_I2R_1pm.mat', 'OIDf_I2R_1pm')
                OIDf_penet_1pm = table(store_Gug_Penet', store_Gug_PVCap', store_Gug_PVGen'); % 1 x 41
                save('C:\Dev\OIDf_penet_1pm.mat', 'OIDf_penet_1pm') 
            % saves results for random locations
%             elseif saveRes == 2
%                 OID_relocation_I2R = table(store_Gug_I2R); % 5x41 times x scenarios
%                 save('C:\Users\plus0002\OneDrive\PhD\DTUnew\OID_relocation_I2R.mat', 'OID_relocation_I2R')
%                 OID_relocation_Pc = table(store_Gug_PcHH); % 1x41
%                 save('C:\Users\plus0002\OneDrive\PhD\DTUnew\OID_relocation_Pc.mat', 'OID_relocation_Pc')
%                 OID_relocation_Pen = table(store_Gug_Penet'); % 1 x 41
%                 save('C:\Users\plus0002\OneDrive\PhD\DTUnew\OID_relocation_Pen.mat', 'OID_relocation_Pen')
            end            
            % Volt/VAR droop model
        elseif OID_model == 3
            [V, Pcurt, Qc, Vmax, Gug_V, Gug_I2R, Gug_ITot, Gug_Vdrop, Gug_Preal, Gug_Sreal, Gug_PgTot, Gug_QgTot, Gug_I2RTot, Gug_PcTot, Gug_QcTot, Gug_max_Scap, Gug_max_Pcap, Gug_Pinj, Gug_check_PF, Gug_PcHH] = VoltVar(testCase, T, T0, solar, loadHH, multiPer, per, plotting, PVcap, Pd12);
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
            store_VAR_I2R{1,i} = Gug_I2RTot; % line loss
            store_VAR_I{i} = Gug_ITot; % current loss
            store_VAR_Vdrop{i} = Gug_Vdrop; % voltage drop
            store_VAR_Penet(i) = penetration; % penetration level
            store_VAR_PVCap(i) = solarTotal; % total solar PV capacity
            store_VAR_PVGen(i) = solarGen; % total PV generated
            store_VAR_Scap{i} = Gug_max_Scap; % max inverter capacity
            store_VAR_Pcap{i} = Gug_max_Pcap; % Pav
            store_VAR_Pinj{i} = Gug_Pinj;
            store_VAR_PF{i} = Gug_check_PF;
            store_VAR_PcHH{1,i} = Gug_PcHH; 
            % save output to .mat file
            if saveRes == 1
                VAR_V_1pm = table( store_VAR_V18, store_VAR_V9, store_VAR_V3);
                save('C:\Dev\VARx_V_1pm.mat', 'VAR_V_1pm')
                VAR_PQ_1pm = table(store_VAR_Pc, store_VAR_Qc, store_VAR_Pg, store_VAR_Qg);
                save('C:\Dev\VARx_PQ_1pm.mat', 'VAR_PQ_1pm')
                VAR_I2R_1pm = table(store_VAR_I2R, store_VAR_I, store_VAR_Preal, store_VAR_Sreal, store_VAR_V, store_VAR_Vdrop, store_VAR_Scap, store_VAR_Pcap, store_VAR_Pinj, store_VAR_PF, store_VAR_PcHH);
                save('C:\Dev\VARx_I2R_1pm.mat', 'VAR_I2R_1pm')
                VAR_penet_1pm = table(store_VAR_Penet, store_VAR_PVCap, store_VAR_PVGen);
                save('C:\Dev\VARx_penet_1pm.mat', 'VAR_penet_1pm')
%              elseif saveRes == 2
%                 VAR_relocation_I2R = table(store_VAR_I2R); % 5x41 times x scenarios
%                 save('C:\Users\plus0002\OneDrive\PhD\DTUnew\VAR_relocation_I2R.mat', 'VAR_relocation_I2R')
%                 VAR_relocation_Pc = table(store_VAR_PcHH); % 1x41
%                 save('C:\Users\plus0002\OneDrive\PhD\DTUnew\VAR_relocation_Pc.mat', 'VAR_relocation_Pc')
%                 VAR_relocation_Pen = table(store_VAR_Penet'); % 1 x 41
%                 save('C:\Users\plus0002\OneDrive\PhD\DTUnew\VAR_relocation_Pen.mat', 'VAR_relocation_Pen')
            end
        end
    end
end



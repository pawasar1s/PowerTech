scenn = 8;
figure(4); plot(1:18, OID_I2R_1pm.store_Gug_Preal{scenn}*Sbase,'r'); 
hold on;
plot(1:18, OID_I2R_1pm.store_Gug_Sreal{scenn}*Sbase,'k--'); 
plot(1:18, OID_I2R_1pm.store_Gug_Pinj{scenn}*Sbase,'b');
%([0 0.14])
title('OID')
legend('Preal','Sreal','Pinj')
%%
figure(3); 
plot(1:18, VAR_I2R_1pm.store_VAR_Preal{scenn}*Sbase,'r'); 
hold on;
plot(1:18, VAR_I2R_1pm.store_VAR_Sreal{scenn}*Sbase,'k--'); 
plot(1:18, VAR_I2R_1pm.store_VAR_Pinj{scenn}*Sbase,'b');
%ylim([0 0.14])
title('VAR')
legend('Preal','Sreal','Pinj')
%%
figure(5); 
plot(1:18, OID_I2R_1pm.store_Gug_PF{scenn},'b');
hold on; 
plot(1:18, VAR_I2R_1pm.store_VAR_PF{scenn},'r');
plot(1:18, OIDf_I2R_1pm.store_Gug_PF{scenn},'k');
legend('OID','Volt/VAr','FOID')
%%
figure(6); 
plot(1:18, OID_I2R_1pm.store_Gug_PcHH{scenn},'b');
hold on; 
plot(1:18, VAR_I2R_1pm.store_VAR_PcHH{scenn},'r');
plot(1:18, OIDf_I2R_1pm.store_Gug_PcHH{scenn},'k');
legend('OID','Volt/VAr','FOID')
%%
figure(7); 
plot(1:19, OID_I2R_1pm.store_Gug_V{scenn},'b');
hold on; 
plot(1:19, VAR_I2R_1pm.store_VAR_V{scenn},'r');
plot(1:19, OIDf_I2R_1pm.store_Gug_V{scenn},'k');
legend('OID','Volt/VAr','FOID')

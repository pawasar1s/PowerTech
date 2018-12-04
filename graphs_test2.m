scenn = 8;
figure(4); plot(1:18, OID_I2R_1pm.store_Gug_Preal{scenn},'r'); 
hold on;
plot(1:18, OID_I2R_1pm.store_Gug_Sreal{scenn},'k--'); 
plot(1:18, OID_I2R_1pm.store_Gug_Pinj{scenn},'b');
ylim([0 0.14])
title('OID')
%%
figure(3); 
plot(1:18, VAR_I2R_1pm.store_VAR_Preal{scenn},'r'); 
hold on;
plot(1:18, VAR_I2R_1pm.store_VAR_Sreal{scenn},'k--'); 
plot(1:18, VAR_I2R_1pm.store_VAR_Pinj{scenn},'b');
ylim([0 0.14])
title('VAR')
%%
figure(5); 
plot(1:18, OID_I2R_1pm.store_Gug_PF{scenn},'b');
hold on; 
plot(1:18, VAR_I2R_1pm.store_VAR_PF{scenn},'r');
%%
figure(6); 
plot(1:18, OID_I2R_1pm.store_Gug_PcHH{scenn},'b');
hold on; 
plot(1:18, VAR_I2R_1pm.store_VAR_PcHH{scenn},'r');
%%
figure(7); 
plot(1:19, OID_I2R_1pm.store_Gug_V{scenn},'b');
hold on; 
plot(1:19, VAR_I2R_1pm.store_VAR_V{scenn},'r');

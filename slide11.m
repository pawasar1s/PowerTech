figure(404)
plot(xval, total_OID', 'b--', 'LineWidth', 1)
hold on;
%plot(xval, total_OIDf001', 'g', 'LineWidth', 2)
total_OIDf005(8) = total_OID(8)
plot(xval, total_OIDf005', 'k', 'LineWidth', 2)
%plot(xval, total_OIDf01', 'Color', [0.7 0.8 0.5], 'LineWidth', 2)
%plot(xval, total_OIDf0125', 'Color', [0.8 0.2 0.3], 'LineWidth', 2)
plot(xval, total_VAR', 'r--', 'LineWidth', 1)

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
legend({'OID','FOID', 'Volt/VAr'},'Location','Northwest')
title('Total Losses'); set(gcf,'color','w'); grid on
set(gca,'FontSize',18)
lineLoss_OID_diff = lineLoss_VAR - lineLoss_OID;
%% Compartiments plots
t=1:length(store_output{1}(:,1));
ts=1:200;

% EcoIndicators
figure('units','normalized','outerposition',[0 0 .75 1])
%figure
hold on
subplot(3,2,1)
set(gca,'fontsize',18)
plot(t,EcInd(:,1),'r','LineWidth',2);
title('Fisher Information','FontSize', 20);
xlabel('Time'); ylabel('FI');
subplot(3,2,2)
set(gca,'fontsize',18)
plot(t,EcInd(:,2),'g','LineWidth',2);
title('Ecological Footprint Analysis','FontSize', 20);
xlabel('Time'); ylabel('Mass');
subplot(3,2,3)
set(gca,'fontsize',18)
plot(t,EcInd(:,3),'g','LineWidth',2);
title('GNRP','FontSize', 20);
xlabel('Time'); ylabel('Money');
subplot(3,2,4)
set(gca,'fontsize',18)
plot(t,EcInd(:,4),'g','LineWidth',2);
title('Wages','FontSize', 20);
xlabel('Time'); ylabel('Money');
subplot(3,1,3)
set(gca,'fontsize',18)
plot(t,EcInd(:,5),'g','LineWidth',2);
title('CO2eq','FontSize', 20);
xlabel('Time'); ylabel('ppm');
%l=legend('Stable','Unstable','Location','south','Orientation','horizontal');
%set(l,'fontsize',15)
hold off
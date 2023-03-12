%% Compartiments plots
%t=0:10399;
t=0:200;
t2=1:200;
%t2=1:10400;
ts=0:200;
ts2=1:200;
%ts=0:10400;
%ts2=1:10400;
% Plants
figure('units','normalized','outerposition',[0 0 .75 1])
%figure
hold on
subplot(3,1,1)
set(gca,'fontsize',18)
%plot(ts,yc(:,1),t,y(:,1),'g','LineWidth',2);
plot(t,P1,'g','LineWidth',2);
title('P1','FontSize', 20);
xlabel('Time'); ylabel('Mass');
subplot(3,1,2)
set(gca,'fontsize',18)
%plot(ts,yc(:,2),t,y(:,2),'g','LineWidth',2);
plot(t,P2,'g','LineWidth',2);
title('P2','FontSize', 20);
xlabel('Time'); ylabel('Mass');
subplot(3,1,3)
set(gca,'fontsize',18)
%plot(ts,yc(:,3),t,y(:,3),'g','LineWidth',2);
plot(t,P3,'g','LineWidth',2);
title('P3','FontSize', 20);
xlabel('Time'); ylabel('Mass');
hold off

% Herbivores
figure('units','normalized','outerposition',[0 0 .75 1])
%figure
hold on
subplot(3,1,1)
set(gca,'fontsize',18)
plot(t,H1,'g','LineWidth',2);
title('H1','FontSize', 20);
xlabel('Time'); ylabel('Mass');
subplot(3,1,2)
set(gca,'fontsize',18)
plot(t,H2,'g','LineWidth',2);
title('H2','FontSize', 20);
xlabel('Time'); ylabel('Mass');
subplot(3,1,3)
set(gca,'fontsize',18)
plot(t,H3,'g','LineWidth',2);
title('H3','FontSize', 20);
xlabel('Time'); ylabel('Mass');
hold off

% Carnivores
figure('units','normalized','outerposition',[0 0 .75 1])
%figure
hold on
subplot(2,1,1)
set(gca,'fontsize',18)
plot(t,C1,'g','LineWidth',2);
title('C1','FontSize', 20);
xlabel('Time'); ylabel('Mass');
subplot(2,1,2)
set(gca,'fontsize',18)
plot(t,C2,'g','LineWidth',2);
title('C2','FontSize', 20);
xlabel('Time'); ylabel('Mass');
hold off

% Humans
figure('units','normalized','outerposition',[0 0 .75 1])
%figure
hold on
subplot(2,1,1)
set(gca,'fontsize',18)
plot(t,numHH,'g',t,numHH1,'r',t,numHH2,'m','LineWidth',2);
title('Number of Humans','FontSize', 20);
xlabel('Time'); ylabel('Humans');
axis([t(1) t(end) min(min([numHH numHH1 numHH2]))*0.8 max(max([numHH numHH1 numHH2]))*1.2])
subplot(2,2,3)
set(gca,'fontsize',18)
plot(t,HH,'g',t,HH1,'r',t,HH2,'m','LineWidth',2);
title('House Holds','FontSize', 20);
xlabel('Time'); ylabel('Mass');
subplot(2,2,4)
set(gca,'fontsize',18)
plot(t2,EMFnumHH,'g','LineWidth',2);
title('People in Economic Mobility','FontSize', 20);
xlabel('Time'); ylabel('Humans');
hold off

% Pools
figure('units','normalized','outerposition',[0 0 .75 1])
%figure
hold on
subplot(3,1,1)
set(gca,'fontsize',18)
plot(t,RP,'g','LineWidth',2);
title('Resourse Pool','FontSize', 20);
xlabel('Time'); ylabel('Mass');
subplot(3,1,2)
set(gca,'fontsize',18)
plot(t,IRP,'g','LineWidth',2);
title('Inaccesible Resourse Pool','FontSize', 20);
xlabel('Time'); ylabel('Mass');
subplot(3,1,3)
set(gca,'fontsize',18)
plot(t,ERP,'g','LineWidth',2);
title('Energy Pool','FontSize', 20);
xlabel('Time'); ylabel('Mass');
hold off

% Industry
figure('units','normalized','outerposition',[0 0 .75 1])
%figure
hold on
subplot(2,2,1)
set(gca,'fontsize',18)
plot(t2,P1production,'g','LineWidth',2);
title('P1 production','FontSize', 20);
xlabel('Time'); ylabel('Mass');
subplot(2,2,2)
set(gca,'fontsize',18)
plot(t2,H1production,'g','LineWidth',2);
title('H1 production','FontSize', 20);
xlabel('Time'); ylabel('Mass');
subplot(2,2,3)
set(gca,'fontsize',18)
plot(t2,ISproduction,'g','LineWidth',2);
title('IS production','FontSize', 20);
xlabel('Time'); ylabel('Mass');
subplot(2,2,4)
set(gca,'fontsize',18)
plot(t2,EEproduction,'g','LineWidth',2);
title('EE production','FontSize', 20);
xlabel('Time'); ylabel('Mass');
hold off

% Economics
figure('units','normalized','outerposition',[0 0 .75 1])
%figure
hold on
subplot(2,2,1)
set(gca,'fontsize',18)
plot(t2,pP1,'g','LineWidth',2);
title('P1 price','FontSize', 20);
xlabel('Time'); ylabel('$');
subplot(2,2,2)
set(gca,'fontsize',18)
plot(t2,pH1,'g','LineWidth',2);
title('H1 price','FontSize', 20);
xlabel('Time'); ylabel('$');
subplot(2,2,3)
set(gca,'fontsize',18)
plot(t2,pIS,'g','LineWidth',2);
title('IS price','FontSize', 20);
xlabel('Time'); ylabel('$');
subplot(2,2,4)
set(gca,'fontsize',18)
plot(t2,pEE,'g','LineWidth',2);
title('EE price','FontSize', 20);
xlabel('Time'); ylabel('$');
subplot(2,2,4)
plot(t2,W,'g--',t2,W1,'r',t2,W2,'m','LineWidth',2);
title('Wages');
xlabel('Time'); ylabel('$');
hold off

% Demandas
figure('units','normalized','outerposition',[0 0 .75 1])
%figure
hold on
subplot(2,2,1)
set(gca,'fontsize',18)
plot(t2,P1HHdemand,'g',t2,P1HHdemand1,'r',t2,P1HHdemand2,'m','LineWidth',2);
title('P1 demanda','FontSize', 20);
xlabel('Time'); ylabel('mass');
subplot(2,2,2)
set(gca,'fontsize',18)
plot(t2,H1HHdemand,'g',t2,H1HHdemand1,'r',t2,H1HHdemand2,'m','LineWidth',2);
title('H1 demanda');
xlabel('Time'); ylabel('mass');
subplot(2,2,3)
set(gca,'fontsize',18)
plot(t2,ISHHdemand,'g',t2,ISHHdemand1,'r',t2,ISHHdemand2,'m','LineWidth',2);
title('IS demanda');
xlabel('Time'); ylabel('mass');
subplot(2,2,4)
set(gca,'fontsize',18)
plot(t2,EEHHdemand,'g',t2,EEHHdemand1,'r',t2,EEHHdemand2,'m','LineWidth',2);
title('EE demanda');
xlabel('Time'); ylabel('energy');
hold off
% 
% % 
% %figure
% %hold on
% %plot(ts,yc(:,26),t,y(:,26),'g','LineWidth',2);
% %hold off
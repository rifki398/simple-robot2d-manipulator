% Find initial end-effector position
ee_init = ForwardKin(l1,l2,the_init(1),the_init(3));
disp('================ Initial Position End Effector =================');
disp(['X Position: ' num2str(ee_init(1)) ' m']);
disp(['Y Position: ' num2str(ee_init(2)) ' m']);
disp('================ Initial Joint Angle =================');
disp(['Theta1: ' num2str(rad2deg(the_init(1))) ' deg']);
disp(['Theta2: ' num2str(rad2deg(the_init(3))) ' deg']);


t = out.tout;
n = length(t);

% OPERATIONAL SPACE (comment if u don't need it)
xpos(1:n,1) = out.eeposX1.Data;
ypos(1:n,1) = out.eeposY1.Data;

% % JOINT SPACE (comment if u don't need it)
% xpos(1:n,1) = out.eeposX.Data;
% ypos(1:n,1) = out.eeposY.Data;


% Plot end-effector position
arm_plot;

figure
subplot(2,1,1)
hold on
yline(xt,'k--','LineWidth',2)
plot(t,xpos,'r','LineWidth',2);
hold off
xlabel('t(s)'); ylabel('position (m)');
title('End-Effector Position at X-Axis');
legend('Reference','Actual','Location','eastoutside')

subplot(2,1,2)
hold on
yline(yt,'k--','LineWidth',2)
plot(t,ypos,'b','LineWidth',2);
hold off
xlabel('t(s)'); ylabel('position (m)');
title('End-Effector Position at Y-Axis');
legend('Reference','Actual','Location','eastoutside')

set(gcf,'color','w')
% THIS FILE USED TO OBTAIN THETA1 & THETA2 FROM SIMULINK
the1(1:n,1) = out.the1.Data;
the2(1:n,1) = out.the2.Data;

filename = 'anim.gif'; % For GIF
figure;
grid on
title('Robot Position (Updating...)')
xlabel('x (m)'); ylabel('y (m)');
set(gcf,'color','w')
axis([-2.2 2 -2.2 2])

for i = 1 : n
    hold on
    the1_temp = the1(i);
    the2_temp = the2(i);
    
    % Two joints position at link 1
    x10 = 0; y10 = 0;
    x1f = l1*cos(the1_temp);
    y1f = l1*sin(the1_temp);
    
    % Two joints position at link 2
    x20 = x1f; y20 = y1f;
    ee = ForwardKin(l1,l2,the1_temp,the2_temp);
    x2f = ee(1); y2f = ee(2);
    
    if norm([xt;yt] - ee) <= 1e-2
        break
    end
    
    if i == 1
        h1 = plot([x10 x1f],[y10 y1f],'r','LineWidth',2);
        h2 = plot([x20 x2f],[y20 y2f],'b','LineWidth',2);
        h3 = plot(x2f,y2f,'ko','LineWidth',4);
        plot([-0.5 0.5],[0 0],'k--','LineWidth',2)
    else
        h1.XData = [x10 x1f]; h1.YData = [y10 y1f];
        h2.XData = [x20 x2f]; h2.YData = [y20 y2f];
        h3.XData = x2f; h3.YData = y2f;
    end
    
    drawnow
    frame = getframe(gcf);
    im = frame2im(frame);
    [imind, cm] = rgb2ind(im, 256);
    if i == 1
        imwrite(imind, cm, filename, 'gif', 'Loopcount', inf, 'DelayTime', 0.05);
    else
        imwrite(imind, cm, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 0.05);
    end
    hold off
end

title('Robot Position (Final)')

function ra_e = ForwardKin(l1,l2,th1,th2)

t2 = th1+th2;
ra_e = [l2.*cos(t2)+l1.*cos(th1); % x
    l2.*sin(t2)+l1.*sin(th1)]; % y
end

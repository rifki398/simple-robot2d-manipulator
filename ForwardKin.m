function ra_e = ForwardKin(l1,l2,th1,th2)
%ForwardKin
%    RA_E = ForwardKin(L1,L2,TH1,TH2)

%    This function was generated by the Symbolic Math Toolbox version 9.3.
%    21-Jun-2024 03:34:29

t2 = th1+th2;
ra_e = [l2.*cos(t2)+l1.*cos(th1); % x
    l2.*sin(t2)+l1.*sin(th1)]; % y
end
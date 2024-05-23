clear all
close all
clc

syms G real
syms m1 m2 real
syms x1 y1 x2 y2 real
syms dx1 dy1 dx2 dy2 real
q = [x1;y1;x2;y2];
dq = [dx1;dy1;dx2;dy2];

% velocities
V1 = [dx1;dy1;0];
V2 = [dx2;dy2;0];

% generalized forces
e = [(x1-x2)/((x1-x2)^2+(y1-y2)^2)^0.5 (y1-y2)/((x1-x2)^2+(y1-y2)^2)^0.5 0];
F = G*m1*m2/((x1-x2)^2+(y1-y2)^2) * e;
Power = -F*V1 + F*V2;
Q = simplify(jacobian(Power,dq)).';

% lagrangian;
T = 0.5*m1*V1.'*V1 + 0.5*m2*V2.'*V2;
V = 0;
L = T - V;

Mass = simplify(jacobian(jacobian(L,dq).',dq));
Bias = simplify(Q - (jacobian(jacobian(L,dq).',q)*dq - jacobian(L,q).'));



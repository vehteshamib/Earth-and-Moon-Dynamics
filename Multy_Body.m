function dz = Multy_Body (t,z)

global G m1 m2
x1 = z(1);  y1 = z(2);  x2 = z(3);  y2 = z(4);
dx1= z(5);  dy1= z(6);  dx2= z(7);  dy2= z(8);
dq = [dx1;dy1;dx2;dy2];

Mass =[ m1,  0,  0,  0
         0, m1,  0,  0
         0,  0, m2,  0
         0,  0,  0, m2];
Bias =[ -(G*m1*m2*(x1 - x2))/((x1 - x2)^2 + (y1 - y2)^2)^(3/2)
        -(G*m1*m2*(y1 - y2))/((x1 - x2)^2 + (y1 - y2)^2)^(3/2)
         (G*m1*m2*(x1 - x2))/((x1 - x2)^2 + (y1 - y2)^2)^(3/2)
         (G*m1*m2*(y1 - y2))/((x1 - x2)^2 + (y1 - y2)^2)^(3/2)];

X = Mass\Bias;
dz = [dq ; X];
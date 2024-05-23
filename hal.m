clc; clear all;

global G m1 m2

m1=5.9752*10^24; m2=7.342*10^23; G=6.67384*10^(-11);

z0 = [-5527750;0;404000000;0     ;     0;-125.578;     0;1022];

tic
option = odeset('maxstep' , 1000);
[t,z] = ode45(@Multy_Body,[0:100000:30000000],z0,option);
toc
x1 = z(:,1);   y1 = z(:,2);   x2 = z(:,3);   y2 = z(:,4);   
dx1 = z(:,5);  dy1 = z(:,6);  dx2 = z(:,7);  dy2 = z(:,8);   

figure
hold on
plot(t,x1)
plot(t,y1)

figure
for i = 1:length(t)
  plot(x1(i),y1(i),'r*','linewidth',8)
  hold on
  plot(x2(i),y2(i),'g*','linewidth',8)
  str=['Time = ',num2str(t(i))];
  text(0,10000000,str,'fontsize',18,'fontweight','bold');
  axis equal
  axis([-504000000 504000000 -504000000 504000000])
  pause(0.001)
  hold off
end

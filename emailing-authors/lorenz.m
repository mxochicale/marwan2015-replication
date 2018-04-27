function dy=lorenz(t,y)
% Lorenz-System

dy=zeros(3,1);

r = 28;
b = 8/3;
s = 10;

dy(1) = -s * (y(1) - y(2));
dy(2) = -y(1)*y(3) + r*y(1) -y(2);
dy(3) = y(1)*y(2) - b*y(3);

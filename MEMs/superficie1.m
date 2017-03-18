p1 = [0 0 0];
p2 = [2 0 0];
p3 = [2 4 0];
p4 = [0 4 0]; 

x = [p1(1) p2(1) p3(1) p4(1)];
y = [p1(2) p2(2) p3(2) p4(2)];
z = [p1(3) p2(3) p3(3) p4(3)];

fill3(x, y, z, 1);
xlabel('x'); ylabel('y'); zlabel('z');  

axis([-1 3 -1 5 -1 4])
grid
hold on
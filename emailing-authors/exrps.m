figure(1)

% Matlab script for fig_constrRP
[t, x] = ode45('lorenz',[1 50], [1.6186 1.8792 17.617]);
X=crp2([x(1:1500,1),x(1:1500,2),x(1:1500,3)],1,1,5,'euc','non','sil');
clf
colormap(flipud(gray))
subplot(1,2,1)
plot3(x(1:1500,1),x(1:1500,2),x(1:1500,3),'k'), hold on
i = 75;
plot3(x(i,1),x(i,2),x(i,3),'k.','markers',25)
plot3(x(i,1),x(i,2),x(i,3),'o','color',[.6 .6 .6],'linewidth',2,'markers',30)
i2 = find(X(i,:),1,'last');
i3 = find(~X(i,:),1,'last');
plot3(x(i2,1),x(i2,2),x(i2,3),'k.','markers',25)
plot3(x(i3,1),x(i3,2),x(i3,3),'ko','markers',8)
set(gca,'xMinorGrid','on','yMinorGrid','on','zMinorGrid','on','dataas',[1 1 1],'xgrid','on','ygrid','on','zgrid','on','gridlinestyle','-','ticklength',[0 0],'xtick',[-25 20],'ytick',[-30 30],'ztick',[7 45],'xlim',[-25 20],'ylim',[-30 30],'zlim',[7 45])
view(32,34)
text(-55,-20,55,'A','fontweight','b','fontsize',12)
subplot(1,2,2)
imagesc(t(1:1500),t(1:1500),X),set(gca,'ydir','norm'),axis square,xlabel('Time'),ylabel('Time')
text(-5,27,'B','fontweight','b','fontsize',12)


figure(2)

% Matlab script for fig_RPexamples
clf
N=400;
offset=2*20;

subplot(1,4,1)
X=crp(rand(N,1),1,1,.2,'sil');
imagesc(double(X))
axis equal, axis([0 N 0 N]), set(gca,'ydir','norm','xtick',[],'ytick',[]), colormap(flipud(gray(2)))
text(0.,N+offset,'A','fontweight','b')

subplot(1,4,2)
X=crp(sin(.2*[1:N]').*sin(.05*[1:N]'),1,31,.4,'sil');
imagesc(double(X))
axis equal, axis([0 N 0 N]), set(gca,'ydir','norm','xtick',[],'ytick',[]), colormap(flipud(gray(2)))
text(0,N+offset,'B','fontweight','b')

subplot(1,4,3), 
x=.617; 
for i=2:500; 
   x(i)=4*x(i-1)*(1-x(i-1)); 
end
X=crp(x(201:200+150)+.01*[1:150],1,1,.2,'sil');
imagesc(double(X))
axis equal, axis([0 150 0 150]), set(gca,'ydir','norm','xtick',[],'ytick',[]), colormap(flipud(gray(2)))
text(0,150+2*7.5,'C','fontweight','b')

subplot(1,4,4)
x=0; 
for i=1:2000; 
   x(i+1)=x(i)+(2*rand-1);
end
X=crp(x,1,1,.2,'sil');
imagesc(double(X))
axis equal, axis([0 N 0 N]), set(gca,'ydir','norm','xtick',[],'ytick',[]), colormap(flipud(gray(2)))
text(0,N+offset,'D','fontweight','b')

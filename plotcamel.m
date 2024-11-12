cpz = load('Camelpz.mat');
cpy = load('Camelpy.mat');
gpz = load('Goatpz.mat');
gpy = load('Goatpy.mat');
gw = load('GoatWeight.mat');
cw = load('CamelWeight.mat');
tc = cpz.pz.Time;
pzc = cpz.pz.Data;

tc = cpy.py.Time;
pyc = cpy.py.Data;

tg = gpz.pz.Time;
pzg = gpz.pz.Data;

tg = gpy.py.Time;
pyg = gpy.py.Data;

fzg = gw.push.Data;
fzc = cw.push.Data;

subplot(2,1,1)
plot(tc,pzc,'r:',tg,pzg,'b:',tc,pyc,'r-',tg,pyg,'b-','LineWidth',3);
xlabel('Time [sec]');
ylabel('Vertical pos [m]');
legend('Camel','Goat');
set(gca,'fontsize',16);
subplot(2,1,2)
plot(tc,fzc,'r:',tg,fzg,'b:','LineWidth',3);
xlabel('Time [sec]');
ylabel('Vertical force [m]');
set(gca,'fontsize',16);
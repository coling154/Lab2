clear;
T_set = 22; % thermostat set temperature [degC]
%T_outside = 15; % outside temperature [degC]
ts = 0.01; % sample time [hr]

%t=0:ts:10;
load('T_outside.mat');

%initilise arrays
y_k=zeros(1,length(t));
heat_gain=zeros(1,length(t));
T_room=zeros(1,length(t));

T_room(1)=15;%initial room temp is 15
y_k(1)=false;%initial heater logic

for i=2:length(t)
    if(T_set-T_room(i-1)>2)
        y_k(i)=true;
    elseif(T_set-T_room(i-1)<-2)
            y_k(i)=false;
    else
        y_k(i)=y_k(i-1);
    end
    heat_gain(i)=heater(y_k(i),T_room(i-1));
    T_room(i)=room(heat_gain(i),T_room(i-1),T_outside(i-1),ts);
end

%% plot
figure(1)
subplot(1,2,1)
plot(t,T_room);
hold on;
yline(T_set);
hold off;
legend("T_r_o_o_m","T_s_e_t");
title("Room & Set Temp vs Time");
xlabel("Time (hr)");
ylabel("Temp (C)");

subplot(1,2,2)
plot(t,heat_gain);
title("Heat gain vs time");
xlabel("Time");
ylabel("Heat Gain");






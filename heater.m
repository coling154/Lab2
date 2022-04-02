function heat_gain = heater(y_k,T_room)
T_heater=50;
M=3600;
c=1005.4;

heat_gain=y_k*M*c*(T_heater-T_room);
end


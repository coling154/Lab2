function T_room_new=room(heat_gain,T_room,T_outside,ts)
m=1470; %mass of air in the room (kg)
R=4.329e-7; %thermal resistance (hr*degC/J)
c=1005.4; % heat capacity of air (J/kg*degC)

T_room_new=(ts*((1/(m*c))*(heat_gain-(T_room-T_outside)/R)))+T_room; %solved equation to calculate the new room temperature
end

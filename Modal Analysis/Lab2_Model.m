% Modal Analysis
% Lab 2
% 11.September.2018
% Andrew S. Johnson

% Define Variables:
l_imp = 20;     % Inches
w_imp = 1.995;  % Inches
t_imp = 0.136;  % Inches

in2m = 0.0254;
density = 8050;         % kg/m^3
e = 200 * 10^9;         % Pascal


l = l_imp * in2m;       % Meters
w = w_imp * in2m;       % Meters
t = t_imp * in2m;       % Meters
v = l * w * t;          % Cubic Meters
m = v * density;
i = 1/12 * w * t^3;

k = (16 * e * i)/(3 * l^3);

l1_imp = 3;
l1 = l1_imp * in2m;      % Meters
v1 = l1 * w * t;        % Cubic Meters
m1 = v1 * density;      % Kilograms

l2_imp = 3;
l2 = l2_imp * in2m;      % Meters
v2 = l2 * w * t;        % Cubic Meters
m2 = v2 * density;      % Kilograms

l3_imp = 3;
l3 = l3_imp * in2m;      % Meters
v3 = l3 * w * t;        % Cubic Meters
m3 = v3 * density;      % Kilograms

l4_imp = 3;
l4 = l4_imp * in2m;      % Meters
v4 = l4 * w * t;        % Cubic Meters
m4 = v4 * density;      % Kilograms

l5_imp = 3;
l5 = l5_imp * in2m;      % Meters
v5 = l5 * w * t;        % Cubic Meters
m5 = v5 * density;      % Kilograms

l6_imp = 3;
l6 = l6_imp * in2m;      % Meters
v6 = l6 * w * t;        % Cubic Meters
m6 = v6 * density;      % Kilograms

l7_imp = 2;
l7 = l7_imp * in2m;      % Meters
v7 = l7 * w * t;        % Cubic Meters
m7 = v7 * density;      % Kilograms
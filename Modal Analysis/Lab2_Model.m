% Modal Analysis
% Lab 2
% 11.September.2018
% Andrew S. Johnson

% Housekeeping
clear
clc
clf

% Measured Dimensions:
l_imp = 20;     % Inches
w_imp = 1.995;  % Inches
t_imp = 0.136;  % Inches

% Constants and Material Properties
in2m = 0.0254;
density = 8050;         % Kg/M^3
e = 200 * 10^9;         % Pascal

% Calculated Global Dimensions and Properties
l = l_imp * in2m;       % Meters
w = w_imp * in2m;       % Meters
t = t_imp * in2m;       % Meters
v = l * w * t;          % Cubic Meters
m = v * density;        % Kg/M^3
i = (1/12) * w * t^3;
k = stiffness.stiff(l, e, i);  % N/M

% Calculated Element Dimensions and Properties
l1_imp = 3;
l1 = l1_imp * in2m;      % Meters
v1 = l1 * w * t;        % Cubic Meters
m1 = v1 * density;      % Kilograms
k1 = stiffness.stiff(l1, e, i);  % N/M

l2_imp = 3;
l2 = l2_imp * in2m;      % Meters
v2 = l2 * w * t;        % Cubic Meters
m2 = v2 * density;      % Kilograms
k2 = stiffness.stiff(l2, e, i);  % N/M

l3_imp = 3;
l3 = l3_imp * in2m;      % Meters
v3 = l3 * w * t;        % Cubic Meters
m3 = v3 * density;      % Kilograms
k3 = stiffness.stiff(l3, e, i);  % N/M

l4_imp = 3;
l4 = l4_imp * in2m;      % Meters
v4 = l4 * w * t;        % Cubic Meters
m4 = v4 * density;      % Kilograms
k4 = stiffness.stiff(l4, e, i);  % N/M

l5_imp = 3;
l5 = l5_imp * in2m;      % Meters
v5 = l5 * w * t;        % Cubic Meters
m5 = v5 * density;      % Kilograms
k5 = stiffness.stiff(l5, e, i);  % N/M

l6_imp = 3;
l6 = l6_imp * in2m;      % Meters
v6 = l6 * w * t;        % Cubic Meters
m6 = v6 * density;      % Kilograms
k6 = stiffness.stiff(l6, e, i);  % N/M

l7_imp = 2;
l7 = l7_imp * in2m;      % Meters
v7 = l7 * w * t;        % Cubic Meters
m7 = v7 * density;      % Kilograms
k7 = stiffness.stiff(l7, e, i);  % N/M

% Mass Matrix
M = [m1 0 0 0 0 0 0;
     0 m2 0 0 0 0 0;
     0 0 m3 0 0 0 0;
     0 0 0 m4 0 0 0;
     0 0 0 0 m5 0 0;
     0 0 0 0 0 m6 0;
     0 0 0 0 0 0 m7];

 % Stiffness Matrix
 K = [k1 -k1 0 0 0 0 0;
      -k1 k1+k2 -k2 0 0 0 0;
      0 -k2 k2+k3 -k3 0 0 0;
      0 0 -k3 k3+k4 -k4 0 0;
      0 0 0 -k4 k4+k5 -k5 0;
      0 0 0 0 -k5 k5+k6 -k6;
      0 0 0 0 0 -k6 k6+k7];
  
  % Eigenland
  [V, D] = eig(K, M);
  
  % Natural Frequencies
  for i=1:7
      F(i) = sqrt(D(i,i))/(2*pi);
  end
  disp('Natural Frequencies (Hz):');
  disp(F);
  
 % Mode Shapes
 for i=1:7
     for k=1:7
         S(k,i) = V(k,i)/V(1,i) - 1;
     end
 end
 
  % Normalize Mode 7
 for i=1:7
     S(i,7) = S(i,7)/500;
 end
 
 disp('Mode Shapes:');
 disp(S);
  
 % Plot
 X = linspace(1, 7, 7);
 for i=1:7
   plot(X, S(:,i), 'o-');
   hold on
 end
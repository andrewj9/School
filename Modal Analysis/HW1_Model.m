% Modal Analysis
% Homework 1
% 12.September.2018
% Andrew S. Johnson

% Housekeeping
clear
clc
clf

% Calculated Element Dimensions and Properties
m1 = 1500;      % Kilograms
k1 = 400000 * 2;  % N/M

m2 = 3000;      % Kilograms
k2 = 800000 * 2;  % N/M

m3 = 3000;      % Kilograms
k3 = 1200000 * 2;  % N/M

m4 = 4500;      % Kilograms
k4 = 1600000 * 2;  % N/M

% Mass Matrix
M = [m1 0 0 0;
     0 m2 0 0;
     0 0 m3 0;
     0 0 0 m4];

 % Stiffness Matrix
 K = [k1 -k1 0 0;
      -k1 k1+k2 -k2 0;
      0 -k2 k2+k3 -k3;
      0 0 -k3 k3+k4];
  
 % Damping Matrix
 for i=1:4
     for k=1:4
         C(k,i) = 0.01*M(k,i)+0.0005*K(k,i);
     end
 end
 
 % Eigenland
 [V,D] = eig(K,M);
  
 % Natural Frequencies
 for i=1:4
     F(i) = sqrt(D(i,i))/(2*pi);
 end
 disp('Natural Frequencies (Hz):');
 disp(F);
  
 % Mode Shapes
 for i=1:4
     for k=1:4
         S(k,i) = V(k,i)/V(1,i);
     end
 end
 disp('Mode Shapes:');
 disp(S);
  
 % Plot
 X = linspace(1, 4, 4);
 for i=1:4
   plot(X, S(:,i), 'o-');
   hold on
 end
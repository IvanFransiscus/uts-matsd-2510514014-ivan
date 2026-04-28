%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 6 — Optimasi Harga Produk Via Gradient Descent Manual 
%  --------------------------------------------------- 
%  Nama  : Ivan Fransiscus
%  NIM   : 2510514014
%  Parameter: N=14, a=1, b=4, K=6, theta0=50, alpha=0,005 
%  Tanggal: 2026-04-27 
% ===================================================== 

clc; clear; close all; 
  
% Parameter personalisasi 
N = 14;  a = 1;  b = 4;  K = 6; 
theta0 = 50;  % derajat 
alpha_lr = 0.005;

% nomor 6 bagian e
disp('= soal 6e');
iterasi_maks = 500;

A = -3*(a+1);       
B = 2*(b+5)*K;      
C = 100;

D = B^2 - 4*A*C;
x_1 = (-B + sqrt(D)) / (2*A); % titik minimum
x_2 = (-B - sqrt(D)) / (2*A); % titik maks

x_optimal = x_2; 
pi_optimal = -(a+1)*x_optimal^3 + (b+5)*K*x_optimal^2 + 100*x_optimal - (K^2*10);

%bagian gradient descentnya
x_k = zeros(1, iterasi_maks + 1);
pi_k = zeros(1, iterasi_maks + 1);

x_k(1) = 1; %bagian titik awal x0 = 1
pi_k(1) = -(a+1)*x_k(1)^3 + (b+5)*K*x_k(1)^2 + 100*x_k(1) - (K^2*10);

for k = 1:iterasi_maks
    gradien = -3*(a+1)*x_k(k)^2 + 2*(b+5)*K*x_k(k) + 100; %turunan pertama dari fungsi profit phi(x)
    
    x_k(k+1) = x_k(k) + alpha_lr * gradien; % update rule
    
    pi_k(k+1) = -(a+1)*x_k(k+1)^3 + (b+5)*K*x_k(k+1)^2 + 100*x_k(k+1) - (K^2*10); %menghitung nilai profit
end

final_x = x_k(end);
final_pi = pi_k(end);

fprintf('Solusi Fungsi phi(x) : %.6f (Profit maksimum: %.6f)\n', x_optimal, pi_optimal);
fprintf('Solusi GD x* : %.6f (Profit maksikmum: %.6f)\n', final_x, final_pi);

% visualisasi grafik
figure('Name', 'Analisis Gradient Descent', 'Position', [100 100 1000 450]);

%membuat grafik bagian kiri
subplot(1, 2, 1);
plot(0:iterasi_maks, pi_k, 'b-', 'LineWidth', 2); hold on; grid on;
plot(iterasi_maks, final_pi, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
title('Grafik Konvergensi Gradient Descent'); xlabel('Iterasi (k)'); ylabel('Profit \pi(x_k)');
legend('Lintasan GD', 'Titik Akhir', 'Location', 'South');

%membuat grafik profit bagian kanan
subplot(1, 2, 2);
x_range = linspace(0, 22, 100); 
pi_range = -(a+1)*x_range.^3 + (b+5)*K*x_range.^2 + 100*x_range - (K^2*10);
plot(x_range, pi_range, 'c-', 'LineWidth', 1.5); hold on; grid on;

plot(x_k(1), pi_k(1), 'ms', 'MarkerSize', 8, 'MarkerFaceColor', 'm'); 
plot(x_optimal, pi_optimal, 'g^', 'MarkerSize', 10, 'MarkerFaceColor', 'g'); 
plot(final_x, final_pi, 'ro', 'MarkerSize', 8); 

title('Kurva Profit dan Titik Kritis'); xlabel('Harga x'); ylabel('Profit');
legend('Kurva Profit', 'Titik Awal', 'Solusi Analitik', 'Solusi GD', 'Location', 'south');

% nomor 6 bagian f

alpha1 = 10 * alpha_lr;  % 0.05
alpha2 = 0.1 * alpha_lr; % 0.0005

x1 = zeros(1, iterasi_maks + 1); pi_x1 = zeros(1, iterasi_maks + 1);
x2 = zeros(1, iterasi_maks + 1); pi_x2 = zeros(1, iterasi_maks + 1);

% deklrasi titik awal sama
x1(1) = 1; pi_x1(1) = pi_k(1);
x2(1) = 1; pi_x2(1) = pi_k(1);

%looping gradient descent
for k = 1:iterasi_maks
    % alpha1
    gradien_x1 = -3*(a+1)*x1(k)^2 + 2*(b+5)*K*x1(k) + 100;
    x1(k+1) = x1(k) + alpha1 * gradien_x1;
    pi_x1(k+1) = -(a+1)*x1(k+1)^3 + (b+5)*K*x1(k+1)^2 + 100*x1(k+1) - (K^2*10);
    
    %alpha2
    gradien_x2 = -3*(a+1)*x2(k)^2 + 2*(b+5)*K*x2(k) + 100;
    x2(k+1) = x2(k) + alpha2 * gradien_x2;
    pi_x2(k+1) = -(a+1)*x2(k+1)^3 + (b+5)*K*x2(k+1)^2 + 100*x2(k+1) - (K^2*10);
end

figure('Name', 'Analsisi Sensitivitas');
hold on; grid on;

plot(0:iterasi_maks, pi_k, 'b-', 'LineWidth', 2);
plot(0:iterasi_maks, pi_x1, 'r-', 'LineWidth', 1.5);
plot(0:iterasi_maks, pi_x2, 'g-', 'LineWidth', 2);

ylim([-1000, 8000]);

title('Analisis Sensitivitas Learning Rate');
xlabel('Iterasi (k)');
ylabel('Profit \pi(x_k)');
legend('alpha normal (0.005)', 'alpha1 (0.05)', 'alpha2 (0.0005)', 'Location', 'best');

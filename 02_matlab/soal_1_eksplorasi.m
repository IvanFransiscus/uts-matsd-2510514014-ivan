%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 1 — Eksplorasi Awal dan Profil Data Transaksi 
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


% nomor 1 bagian b
D = [23, 31, 39, 47, 55, 58, 59];

disp('time stamp');
disp(datetime('now', 'Format', 'default')); 

rata2 = mean(D);
median_ = median(D);
modus = mode(D);
range_ = range(D);
std_ = std(D,1);

disp('= soal 1b');
fprintf('Mean (Rata-rata)   : %f\n', rata2);
fprintf('Median (Tengah)    : %f\n', median_);
fprintf('Mode (Modus)       : %f\n', modus);
fprintf('Range (Rentang)    : %f\n', range_);
fprintf('Std Dev (Populasi) : %f\n', std_);

% nomor 1 bagian c
jumlah_toko = 1:length(D);

figure;
hold on;

bar(jumlah_toko, D, 'FaceColor', [0.2 0.6 0.8], 'DisplayName', 'Penjualan per Toko');
yline(rata2, 'r--', 'LineWidth', 2, 'DisplayName', sprintf('Rata-rata (%f)', rata2));
xlabel('Toko');
ylabel('Jumlah Penjualan');
title('Penjualan per Toko (2510514014)');
legend('show');
hold off;
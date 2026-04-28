%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 5 — Konvergensi Customer Lifetime Value dan Kekontinuan Biaya 
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


% nomor 5 bagian b
disp('= soal 5b');
syms x

f1 = (x^2 - K^2) / (x - K);
f2 = (sqrt(x + (K+1)^2) - (K+1)) / x;
f3 = ((a+2)*x^3 + b*x + 7) / (x^3 - x + K);

L1 = limit(f1, x, K);
L2 = limit(f2, x, 0);
L3 = limit(f3, x, Inf);

fprintf('Nilai Limit L1    : %s\n\n', char(L1));
fprintf('Nilai Limit L2    : %s\n\n', char(L2));
fprintf('Nilai Limit L3    : %s\n', char(L3));


% nomor 5 bagian g
p = 2 * K;
q = (2 * K) - (a * K);

% Membuat deret angka untuk sumbu x
x_kiri = 0 : 0.1 : K;
y_kiri = (x_kiri.^2 - K^2) ./ (x_kiri - K);
x_kanan = K : 0.1 : (2*K);
y_kanan = a * x_kanan + q;

figure;
hold on;
grid on;

% Menggambar grafik bagian kiri
plot(x_kiri, y_kiri, 'b', 'LineWidth', 2);

% Menggambar titik sambung tepat di tengah
plot(K, p, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');

% Menggambar grafik bagian kanan
plot(x_kanan, y_kanan, 'g', 'LineWidth', 2);

plot([K K], [0 25], 'k--', 'LineWidth', 1);

title('Grafik Fungsi Kontinu C(x)');
xlabel('Volume Produk (x)');
ylabel('Biaya Distribusi C(x)');
legend('x < K (Kiri)', 'Titik Sambung x=K', 'x > K (Kanan)', 'Batas x=K', 'Location', 'northwest');

hold off;
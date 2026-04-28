%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 7 — Forecasting Penjualan dengan barisan, Deret, dan Notasi Sigma
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

% nomor 7 bagian c
t_waktu = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

S = 50 + (K .* t_waktu) + ((-1).^t_waktu) .* (a + 1);

T1 = sum(S);
T2 = sum(S.^2);

disp('= soal 7c');
fprintf('T1 (Total Penjualan Sigma S_n)  : %d\n', T1);
fprintf('T2 (Sum of Squares Sigma S_n^2) : %d\n\n', T2);

% nomor 7 bagian e
% menghitung garis linear polyfit 
koefisien = polyfit(t_waktu, S, 1);
kemiringan_slope = koefisien(1);
tipot_intercept = koefisien(2);

disp('= soal 7e');
fprintf('Persamaan Garis Tren : S = %.4f * t + %.4f\n\n', kemiringan_slope, tipot_intercept);

% predict bulan 13-18
t_prediksi = [13, 14, 15, 16, 17, 18];
S_prediksi = kemiringan_slope .* t_prediksi + tipot_intercept;

disp('Hasil Prediksi Penjualan 6 Bulan ke Depan:');
loop_prediksi = [1, 2, 3, 4, 5, 6];
for i = loop_prediksi
    fprintf('Bulan ke-%d : %.2f Juta Rupiah\n', t_prediksi(i), S_prediksi(i));
end
disp(' ');

%visualisasi
figure('Name', 'Forecasting Penjualan', 'Position', [100 100 800 450]);
hold on; grid on;

t_gabungan = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
S_garis_tren = kemiringan_slope .* t_gabungan + tipot_intercept;

plot(t_waktu, S, 'b.', 'MarkerSize', 20); % Data Historis
plot(t_gabungan, S_garis_tren, 'r--', 'LineWidth', 1.5); % Garis Tren
plot(t_prediksi, S_prediksi, 'g^', 'MarkerSize', 10, 'MarkerFaceColor', 'g'); % Prediksi

title('Forecasting Penjualan Toko (Model Linear)');
xlabel('Bulan ke- (t)'); ylabel('Penjualan S_n (Juta Rupiah)');
legend('Data Historis (1-12)', 'Garis Tren Linear', 'Prediksi (13-18)', 'Location', 'northwest');
xticks(t_gabungan); 
hold off;

% nomor 7 bagian f
S_trend_historis = kemiringan_slope .* t_waktu + tipot_intercept;
%selisih data asli & garis linear
selisih = S - S_trend_historis;
% mencari nilai mean absolute error (MAE)
MAE = sum(abs(selisih)) / 12;

disp('= soal 7f');
fprintf('Nilai MAE (Mean Absolute Error) : %.4f Juta Rupiah\n', MAE);

%visualisasi
figure('Name', 'Soal Analisis Residual', 'Position', [150 150 800 450]);
plot(t_waktu, selisih, 'm-o', 'LineWidth', 2, 'MarkerFaceColor', 'm');
hold on; grid on;
yline(0, 'k--', 'LineWidth', 1.5);
title('Grafik Data Asli dengan Tren Linear)');
xlabel('Bulan ke- (t)'); ylabel('Nilai Selisih');
xticks(t_waktu);
hold off;
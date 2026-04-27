%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 4 —  Bilangan Kompleks
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

% nomor 4 bagian b
z1 = (a + 2) + (b + 1)*1i; 
z2 = (b + 1) - (a + 2)*1i;

%operasi bilangan kompleks
z_tambah = z1 + z2;
z_kali = z1 * z2;
z_bagi = z1 / z2;
z_selisih_abs = abs(z1 - z2);

disp('= soal 4b');
fprintf('z1 + z2   = %.2f + %.2fi\n', real(z_tambah), imag(z_tambah));
fprintf('z1 * z2   = %.2f + %.2fi\n', real(z_kali), imag(z_kali));
fprintf('z1 / z2   = %.2f + %.2fi\n', real(z_bagi), imag(z_bagi));
fprintf('|z1 - z2| = %.2f\n', z_selisih_abs);

% nomor 4 bagian d
r_akar = 8^(1/3);

% menghitung tiga sudut
sudut_1 = (theta0 + 0 * 360) / 3;
sudut_2 = (theta0 + 1 * 360) / 3;
sudut_3 = (theta0 + 2 * 360) / 3;

% mengubah format polar menjadi bilangan kompleks
akar_1 = r_akar * (cosd(sudut_1) + 1i * sind(sudut_1));
akar_2 = r_akar * (cosd(sudut_2) + 1i * sind(sudut_2));
akar_3 = r_akar * (cosd(sudut_3) + 1i * sind(sudut_3));

figure;
hold on;
grid on;
axis equal;

% untuk sumbu x dan y + custom jadi warna putih
plot([-3 3], [0 0], 'w', 'LineWidth', 1);
plot([0 0], [-3 3], 'w', 'LineWidth', 1);

%membuat garis dari (0,0) ke tiap koordinat titik akar
plot([0 real(akar_1)], [0 imag(akar_1)], 'r-o', 'LineWidth', 2);
plot([0 real(akar_2)], [0 imag(akar_2)], 'g-o', 'LineWidth', 2);
plot([0 real(akar_3)], [0 imag(akar_3)], 'b-o', 'LineWidth', 2);

%membuat garis untuk menyambungkan tiap koordinat ititk akar
x_segitiga = [real(akar_1), real(akar_2), real(akar_3), real(akar_1)];
y_segitiga = [imag(akar_1), imag(akar_2), imag(akar_3), imag(akar_1)];
plot(x_segitiga, y_segitiga, 'm--', 'LineWidth', 1.5);

xlabel('Sumbu Real');
ylabel('Sumbu Imajiner');
title('Bukti untuk Akar Kubik membentuk segitiga sama sisi');
legend('Sumbu Real', 'Sumbu Imajiner', 'Akar 1', 'Akar 2', 'Akar 3', 'Segitiga Sama Sisi');

hold off;
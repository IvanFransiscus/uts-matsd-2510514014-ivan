%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 2 — Enkripsi Citra Logo Toko dengan Invers Matriks 3x3
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

% nomor 2 bagian d
disp('= soal 2d');
A = [a+1, b, 2; 
     1, a+2, 4; 
     4, 1, a+3];
n = size(A, 1);

Aug = [A, eye(n)]; %ngebaut matriks augmentasi

for i = 1:n
    % ngebuat nilai pivot jadi 1
    pivot = Aug(i, i);
    for j = 1:(2*n)
        Aug(i, j) = Aug(i, j) / pivot;
    end
    
    %bikin matriks identitasnya di bagian kiri matriks awal
    for k = 1:n
        if k ~= i
            faktor = Aug(k, i);
            for j = 1:(2*n)
                Aug(k, j) = Aug(k, j) - faktor * Aug(i, j);
            end
        end
    end
end

A_inv_manual = Aug(:, n+1:end); 
A_inv_matlab = inv(A); %invers fungsi lngsung dari matlab
error_frobenius = norm(A_inv_manual - A_inv_matlab, 'fro');

disp('Hasil invers manual:');
disp(A_inv_manual);

disp('Hasil invers MATLAB:');
disp(A_inv_matlab);

fprintf('Norma Error Frobenius : %e\n', error_frobenius); 

if error_frobenius < 1e-10
    disp('nilai error < 1e-10');
else
    disp('nilai error > 1e-10');
end

%nomor 2 bagian f

P = [120, 50+N, 200; 
     80, a+2, 10+N; 
     30+N, 90, 170];

E = A * P;

figure('Name', 'Visualisasi untuk enkripsi citra logo');

% Subplot kiri: Citra Asli P
subplot(1, 2, 1);
imshow(P, []);
title('Citra Grayscale P (Asli)');

% Subplot kanan: Citra Terenkripsi E
subplot(1, 2, 2);
imshow(E, []);
title('Citra Grayscale E (Enkripsi)');
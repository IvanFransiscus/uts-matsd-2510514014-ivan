%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 3 —  Segmentasi Pelanggan dan komposisi fungsi harga
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

% nomor 3 bagian b
U = [N, N+1, N+2, N+3, N+4, N+5, N+6, N+7, N+8, N+9, N+10, N+11, N+12, N+13, N+14, N+15, N+16, N+17, N+18, N+19, N+20, N+21];
A = [N, N+2, N+4, N+7, N+10, N+13, N+15]; 
B = [N+3, N+5, N+7, N+10, N+12, N+18]; 
C = [N+1, N+7, N+10, N+11, N+17, N+20];

% A U B U C
A_U_B = union(A, B);
A_U_B_U_C = union(A_U_B, C);

% A n B n C
A_n_B = intersect(A, B);
A_n_B_n_C = intersect(A_n_B, C);

% (A U B) n C'
C_c = setdiff(U, C); 
A_U_B_n_C_c = intersect(A_U_B, C_c);

% A ⊕ B
A_symdiff_B = setxor(A, B);

disp('= soal 3b');
fprintf('1. A U B U C       : [%s]\n', num2str(A_U_B_U_C));
fprintf('2. A ∩ B ∩ C       : [%s]\n', num2str(A_n_B_n_C));
fprintf('3. (A U B) ∩ C''    : [%s]\n', num2str(A_U_B_n_C_c));
fprintf('4. A ⊕ B          : [%s]\n', num2str(A_symdiff_B));

% nomor 3 bagian d
syms x y

f = K*x + (a+b);

f_invers = solve(y == f, x); %mecari nilai invers
pendapatan_total = K*100 + a + b;%mencari nilai pendapatan total

volume_subs = subs(f_invers, y, pendapatan_total);

volume_solve = solve(f == pendapatan_total, x);
disp('= soal 3d');
fprintf('Metode subs (dari invers)  : %s unit\n', char(volume_subs));
fprintf('Metode solve (dari f(x))   : %s unit\n', char(volume_solve));
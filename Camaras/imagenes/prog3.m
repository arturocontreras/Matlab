clc; clear all; close all;
database = load('data.txt')
A = database(:,2);
P = database(:,3);
R = (P.^2)./A;
DB_I = R;
DB_T = database(:,4:6);

%save DB_I.txt DB_I -ascii -tabs
%save DB_T.txt DB_T -ascii -tabs




% DBTng = database(1:2:end,:);
% DBTst = database(2:4:end,:);
% DBPrb = database(4:4:end,:);
% 
% A_Tng = DBTng(:,2);
% P_Tng = DBTng(:,3);
% I_Tng = [A_Tng P_Tng];
% T_Tng = DBTng(:,4);
% 
% save I_Tng.txt I_Tng -ascii -tabs
% save T_Tng.txt T_Tng -ascii -tabs
% 
% A_Tst = DBTst(:,2);
% P_Tst = DBTst(:,3);
% I_Tst = [A_Tst P_Tst];
% T_Tst = DBTst(:,4);
% 
% save I_Tst.txt I_Tst -ascii -tabs
% save T_Tst.txt T_Tst -ascii -tabs
% 
% A_Prb = DBPrb(:,2);
% P_Prb = DBPrb(:,3);
% I_Prb = [A_Prb P_Prb];
% T_Prb = DBPrb(:,4);
% 
% save I_Prb.txt I_Prb -ascii -tabs
% save T_Prb.txt T_Prb -ascii -tabs

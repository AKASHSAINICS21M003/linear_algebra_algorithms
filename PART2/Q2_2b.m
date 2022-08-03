%given mean  and covarriance of n=2
mean_v1=[0 0]';
covar_1=[0.025,0.0075;0.0075,0.0071];
%given mean and covarriance of n=3
mean_v2=[0 0 0]';
covar_2=[0.025,0.0075,0.00175;0.0075,0.007,0.00135;0.00175,0.00135,0.00043];
[A,B]=corrNRV(mean_v1,covar_1,2,1000);
[C,D]=corrNRV(mean_v2,covar_2,3,1000);
%plotting of correlated and uncorrelated vectors
%%% first plot
figure;scatter(A(1,:),A(2,:));grid on;
%%%second plot

figure;scatter(B(1,:),B(2,:));grid on;
%% third plot

figure;scatter3(C(1,:),C(2,:),C(3,:));grid on;
%% fourth plot

figure;scatter3(D(1,:),D(2,:),C(3,:));grid on;

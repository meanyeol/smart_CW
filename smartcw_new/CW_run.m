close all
clear
SAMPLE_SIZE = 1000000;
% initialise empty arrays
lolp_values = zeros(1, SAMPLE_SIZE);
cml_values = zeros(1, SAMPLE_SIZE);
DR_values=zeros(1, SAMPLE_SIZE);
num=zeros(1,SAMPLE_SIZE);
%% for question 6-10 using this block:
%for i=1:SAMPLE_SIZE
% generate samples and compute three measurements each time
% state = CW_sample6();
% [lolp_values(i),cml_values(i), num(i)] = CW_test7(state);
% end
%%%%%%%%%%%%%
%% for question 11-12, use this block:
% for i=1:SAMPLE_SIZE
% % generate samples and compute three measurements each time
% state = CW_sample6();
% [lolp_values(i),cml_values(i), num(i)] = CW_test11(state);
% end
%%%%%%%%%%%%%%
%% for question 13, use this block:
% for i=1:SAMPLE_SIZE
% % generate samples and compute three measurements each time
% state = CW_sample13();
% [lolp_values(i),cml_values(i), num(i)] = CW_test13(state);
% end
%%%%%%%%%%%%%%
% %% for question 14, use this block:
% for i=1:SAMPLE_SIZE
% % generate samples and compute three measurements each time
% state = CW_sample6();
% [lolp_values(i),cml_values(i),DR_values(i), num(i)] = CW_test14(state);
% end
% %%%%%%%%%%%%%%%%%%%
%% for question 15, use this block:
for i=1:SAMPLE_SIZE
% generate samples and compute three measurements each time
state = CW_sample6();
[lolp_values(i),cml_values(i),DR_values(i), num(i)] = CW_test15(state);
end
%%%%%%%%%%%%%%%%%%%
lolp_estimate = mean(lolp_values);
lolp_se = std(lolp_values)/sqrt(SAMPLE_SIZE);
% print the outcome in ± SE notation; 95% confidence notation; CoV notation
% (note multiplication by 100!)
fprintf('LOLP = %.5f ± %.5f\n',lolp_estimate, lolp_se);
fprintf('LOLP = [%.5f, %.5f] (95%% confidence)\n',lolp_estimate - 1.96*lolp_se, lolp_estimate + 1.96*lolp_se);
fprintf('LOLP = %.5f ± %.1f %%\n',lolp_estimate, 100*lolp_se/lolp_estimate);

%% compute the CML values for question 11-15
% %way1  using the disconnected customers to calculate CML
cml_estimate2 = mean(num*8760*60/9900/1.15);
cml_se2 = std(num*8760*60/9900/1.15)/sqrt(SAMPLE_SIZE);
fprintf('CML [using total number of disconnected customers]= %.5f ± %.5f\n',cml_estimate2, cml_se2);
fprintf('CML [using total number of disconnected customers]= [%.5f, %.5f] (95%% confidence)\n',cml_estimate2 - 1.96*cml_se2, cml_estimate2 + 1.96*cml_se2);
fprintf('CML [using total number of disconnected customers]= %.5f ± %.1f %%\n',cml_estimate2, 100*cml_se2/cml_estimate2);
% using the test_cml as verification for WAY2, which is not required.
cml_estimate = mean(cml_values);
cml_se = std(cml_values)/sqrt(SAMPLE_SIZE);
fprintf('CML = %.5f ± %.5f\n',cml_estimate, cml_se);
fprintf('CML = [%.5f, %.5f] (95%% confidence)\n',cml_estimate - 1.96*cml_se, cml_estimate + 1.96*cml_se);
fprintf('CML = %.5f ± %.1f %%\n',cml_estimate, 100*cml_se/cml_estimate);

%%demand response calculation
 Pr_DR=mean(DR_values);
 Se_DR=std(DR_values)/sqrt(SAMPLE_SIZE);
fprintf('Demand Response Probability = %.7f ± %.7f\n', Pr_DR, Se_DR);
fprintf('Demand Response Probability = [%.7f, %.7f] (95%% confidence)\n', Pr_DR - 1.96*Se_DR,  Pr_DR + 1.96*Se_DR);
fprintf('Demand Response Probability = %.7f ± %.1f %%\n', Pr_DR, 100*Se_DR/ Pr_DR);
%annual cost
fprintf('Annual cost of DR activation =£ %.5f\n', 9900*1.15*Pr_DR*365*24*1);
%%%%%%%%%%%%%%
%% WAY:  compute the CML values using num for question 7 before 
% cml_estimate7 = mean(num*8760*60/9900);
% cml_se7 = std(num*8760*60/9900)/sqrt(SAMPLE_SIZE);
% fprintf('CML [using total number of disconnected customers]= %.5f ± %.5f\n',cml_estimate7, cml_se7);
% fprintf('CML [using total number of disconnected customers]= [%.5f, %.5f] (95%% confidence)\n',cml_estimate7 - 1.96*cml_se7, cml_estimate7 + 1.96*cml_se7);
% fprintf('CML [using total number of disconnected customers]= %.5f ± %.1f %%\n',cml_estimate7, 100*cml_se7/cml_estimate7);

function [ state ] = CW_sample13( )
% This function samples a random state of the components and load according
% to their state probabilities.
 % randomly select load availabilities according to their availabilities
 % using availability = MTTF/MTBF
 T1 = rand < 5/(5+15/365);
 T2 = rand < 5/(5+15/365);
 F1=  rand < 1/0.04/(1/0.04+2/365);
 F2=  rand < 1/0.02/(1/0.02+2/365);
 F3=  rand < 1/0.01/(1/0.01+2/365);
 F4=  rand < 1/0.03/(1/0.03+2/365);
 F5=  rand < 1/0.24/(1/0.24+1/365);
 F6=  rand < 1/0.32/(1/0.32+1/365);
 T3 = rand < 5/(5+15/365);
 % randomly sample a load state (1=n,2=d,3=e) according to the computed
 % probabilities
 u=rand;
 load_state =0.15+0.85*(1-(1-u)^(1/2.8))^(1/1.6);
 % return the sampled state as an array with four elements
 state = [T1, T2, F1, F2, F3, F4, F5, F6, load_state, T3];
end

function[test_lolp, test_cml, num]=CW_test11(state)
%state 1 2 :transformer state:   3(a)      4(b)       5(c)     6(d)      7(e)     8(f)  feeder  state 9: load
%num: total number of disconnected customers
% a b c d e f =1/0 means the node is supplied or not. 
%Let the initial node value==0.
a=0; b=0; c=0; d=0; e=0; f=0;
if state(1)==1 || state(2)==1
    % at least one tranformer is working 
    if state(3)==1 && state(4)==1
        % a is connected
        a=1;
    end
    if state(4)==1
        % b is connected
        b=1;
    end
    if state(5)==1
        % c is connected
        c=1;
    end
    if state(5)==1 && state(6)==1
        % d is connected
        d=1;
    end
    if state(5)==1 && state(6)==1 && state(7)==1
        % e is connected
        e=1;
    end
    if state(5)==1 && state(6)==1 && state(8)==1
        % f is connected
        f=1;
    end
end
    %else  all transformers' broken. a b c d e f remains 0
%% check if single transformer and overload
%connected customers
connect=(a*1400+b*2000+c*3000+d*2000+e*500+f*1000)*1.15;
total_load=connect*state(9);
% only one transformer and overload, all disconnected
if total_load>10000 && ~(state(1)&&state(2))
    a=0; b=0; c=0; d=0; e=0; f=0;
end
 %% compute lolp and disconnected customers: num
 % only when all node loads are supplied, can lolp =0, otherwise lolp=1
test_lolp=~(a&&b&&c&&d&&e&&f);
num=(9900-a*1400-b*2000-c*3000-d*2000-e*500-f*1000)*1.15;
test_cml=num*8760*60/(9900*1.15);
end

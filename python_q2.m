%% Python questions           Question 2

%% Calculate and print out factorials
function [] = python_q2(m)
    
    m_f = factm(m);             %matrix of factorials    
    msg = 'Values are:';        %header message for data output
    msg = [msg, printm(m_f)];   %concat entire output to msg
    disp(msg) ;                 %display msg
end
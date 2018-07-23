%biased coin flip
p_coin = 0.25;    %set bias for heads

my_flip = rand;

if (my_flip >= 0.75) 
    disp("heads");
else
    disp("tails");
end
    
%birthday paradox
n = 24; %students 
p_not = 1;  %probability no one sharing a birthday

for i = 0:n-1
   p_not = p_not * (365-i)/365;
end

p_share = 1 - p_not; %probability of at least two people sharing a birthday 

disp( ['The probability of ', num2str(n) , ' people having at least two people sharing a birthday is '...
    , num2str(p_share) ] ) ;


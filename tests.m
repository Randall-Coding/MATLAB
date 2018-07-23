
t = clock;
x = 0:0.01:10; 
sin(x);
etime(clock, t)

t = clock;
for i = 0:0.01:10
   sin(i); 
end
etime(clock , t)

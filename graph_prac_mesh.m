start = clock;

clf

[x,y] = meshgrid(-4:0.1:4); 

z = x.^3 +- y.^3;

%%% mesh(x,y,z);
meshc(x,y,z);

elapse = etime(clock,start)
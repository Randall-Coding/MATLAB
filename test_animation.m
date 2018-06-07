Y = [1,2,3,4,5,6,7,8,9];
Mybar = bar(Y);

set(Mybar,'YDataSource','Y');

while(true)
    for i = 6:10

        Y(5) = i;
        pause(1);
        refreshdata;

    end

    for i = 10:-1:5
       Y(5) = i;
       pause(1);
       refreshdata;

    end
end
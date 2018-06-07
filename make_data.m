
    m1 = zeros(10,10,'single');
    count = 1;
    for r = 1:10 ;
        for c = 1:10 ;
            m1(r,c) = count;
            count = count + 1; 
        end
    end

    
    %cell dictionary sort

C = {'Adam';'Azu';'Abi';'Abu';'Aden';'Afa';'Afu';'Abbot'}

C2 = {'Adam';'A';'Ab';'Az';'Azzz';'Aqp';'Afu';'Abbot'}
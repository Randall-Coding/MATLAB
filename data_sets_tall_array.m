function [] = data_sets_tall_array

    ds = datastore('acetylene.csv');
    T = tall(ds);
    sig = std(T.Var1);
    avg = mean(T.Var1); 
    gather(sig,avg);
    
    sig
    avg
end%
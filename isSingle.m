function [bool] = isSingle(x)
            
        s = size(x);
        dim1 = s(1);
        dim2 = s(2);        
        bool = (dim1 == 1 && dim2 == 1);

end %end isSingle(x)
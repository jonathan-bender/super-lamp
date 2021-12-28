function Front = GetFront(mat)

%-- get total light
totalLight = GetTotalLight(mat);

%-- smooth over time
smoothed = medfilt3(mat, [1 1 7]);

matSize = size(mat);
result = zeros(matSize);

for i=1:matSize(1)
    for j=1:matSize(2)
        for k=1:matSize(3)
            if  totalLight(i,j) < 170 && smoothed(i,j,k) > 0.97 
                result(i,j,k) = 1;
            end

        end
    end
end
Front =  result;
end
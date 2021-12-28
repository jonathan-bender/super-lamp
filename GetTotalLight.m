function Total=GetTotalLight(mat)
matSize = size(mat);
Total = zeros(height(mat), width(mat));

for i=1:height(mat)
    for j=1:width(mat)
        for k=1:matSize(3)
            Total(i,j) = Total(i,j) + mat(i,j,k);
        end
    end
end
end
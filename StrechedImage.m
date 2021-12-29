function Streched=StrechedImage(mat, scale)

Streched = zeros(floor(size(mat,1)*scale), size(mat,2), size(mat,3));

for i=1:size(mat,1)*scale
    for j=1:size(mat,2)
        for k=1:size(mat,3)
            Streched(i,j,k) = mat(floor(i/scale)+1,j,k);
        end
    end
end

end
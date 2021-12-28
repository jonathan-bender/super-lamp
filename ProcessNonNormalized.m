%-- this is my attempt to transform the original non-normalized matrix into
%a consistent matrix that produces a stable image and a stable beta
function Processed = ProcessNonNormalized(mat)

%-- smooth over time and space
smoothed = medfilt3(mat, [3 3 5], 'symmetric');


matSize = size(mat);
result = zeros(matSize);

for i=1:matSize(1)
    for j=1:matSize(2)
        for k=1:matSize(3)
            if smoothed(i,j,k) > 0.98
                result(i,j,k) = 1;
            end
        end
    end
end

%-- smooth over time and space
Processed = medfilt3(result, [5 5 3], 'symmetric');

end
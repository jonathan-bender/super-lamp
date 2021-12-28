function Normalized=NormalizeInTime(mat)


matSize = size(mat);
result = zeros(matSize);

for i=1:matSize(1)
    for j=1:matSize(2)
        for k=1:matSize(3)
            minAmp = min(mat(i,j,:));
            maxAmp = max(mat(i,j,:));
            result(i,j,k) = (mat(i,j,k) - minAmp)/(maxAmp - minAmp);
        end
    end
end

%-- smooth over time and space
Normalized = medfilt3(result, [3 3 5], 'symmetric');

end

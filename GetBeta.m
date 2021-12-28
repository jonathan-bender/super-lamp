%-- returns beta=area/4*perimeter^2 of the of the part of the matrix that is 1
function Beta=GetBeta(mat)

area = sum(mat,'all');
perimeterPositions = bwboundaries(mat);
perimeter = 0;
for k = 1:length(perimeterPositions)
    f=find(perimeterPositions{k}(:,1)~=112 & perimeterPositions{k}(:,1)~=1);
    perimeter= perimeter+length(f);
end

Beta = area/(4*perimeter*perimeter);

end
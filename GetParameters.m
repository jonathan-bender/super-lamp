function [Area,Perimeter,Velocity,Beta] = GetParameters(mat,micronsPerPixel,fps)
%GETPARAMETERS gets parameters for the crack
Area = zeros(size(mat,3));
Perimeter = zeros(size(mat,3));
Velocity = zeros(size(mat,3));
Beta = zeros(size(mat,3));

Size = size(mat,1)*size(mat,2);

for t=1:size(mat,3)
    currentMat = mat(:,:,t);
    Area(t) = (Size - sum(currentMat,'all'))*micronsPerPixel*micronsPerPixel;
    Perimeter(t) = GetPerimeter(currentMat)*micronsPerPixel;
    Beta(t) = Perimeter(t)*Perimeter(t)/(4*Area(t));
    if t>1
        Velocity(t)=(sqrt(Area(t)) - sqrt(Area(t-1)))*fps;
    end
end


end

function Perimeter=GetPerimeter(mat)
Perimeter = 0;
perimeterPositions = bwboundaries(mat);
for k = 1:length(perimeterPositions)
    f=find(perimeterPositions{k}(:,1)~=112 & perimeterPositions{k}(:,1)~=1);
    Perimeter= Perimeter+length(f);
end

end
%-- returns all points that increase during the whole motion. mat is 3 d
%matrix (x,y,t) if d/dt of mat is always positive at a point p then f(p)=1
%otherwise 0
function IncreasingPoints=GetIncreasingPoints(mat)
IncreasingPoints= ones(length(mat(:,1,1)), length(mat(1,:,1)));
    for i=1:length(mat(:,1,1))
        for j=1:length(mat(1,:,1))
            for k=2:length(mat(1,1,:))
                if mat(i,j,k-1) > mat(i,j,k)
                    IncreasingPoints(i,j) = 0;
                    break
                end
            end
        end
    end

end


function PlotBeta(mat, threshold)
    figure;
    matSize = size(mat);
    matBeta = zeros(matSize(3));

    processedMat = ProcessNormalized(mat, threshold);
    for t=1:matSize(3)
        matBeta(t) = GetBeta(processedMat (:,:,t));
    end
    
    plot(matBeta);

end
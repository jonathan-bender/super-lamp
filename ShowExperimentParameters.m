function ShowExperimentParameters(mat, thresholds)

figure;
tiledlayout(2,2);


for i=1:size(thresholds)
    Processed = ProcessNormalized(mat,thresholds(i));
    Scaled = StrechedImage(Processed,3.7);

    [Area,Perimeter,Velocity,Beta]  = GetParameters(Scaled,1,1);
    
    nexttile;
    plot(Area);
    nexttile
    plot(Perimeter);
    nexttile
    plot(Velocity);
    nexttile
    plot(Beta);
end

end




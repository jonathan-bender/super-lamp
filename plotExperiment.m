function plotExperiment(experiment, colorLimits)

    %-- initiate graph
    PlotFigure = figure;
    plotForTime(experiment,1);

    %-- set controls
    Control = uicontrol('Parent',PlotFigure, 'Style','slider', 'Value',1,'Position',[81,54,419,23],'min',1, 'max',181, 'SliderStep',[1/181 1]);
    Control.Callback = @(es,ed) plotForTime(experiment, es.Value); 

    function plotForTime(experiment, time)
        imagesc(experiment(:,:,floor(time)));
        if length(colorLimits) > 1
            caxis(colorLimits); 
        end
    end
end
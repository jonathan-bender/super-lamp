

function Processed=ProcessNormalized(mat, threshold)

%-- smooth over space time for errors
smoothed = smooth3(mat, 'box', [3 3 7]);

%-- threshold
thresholdMat = smoothed > threshold;

%-- filter to get a clear boundry of the blob
Processed = medfilt3(thresholdMat, [27 27 1]);

end

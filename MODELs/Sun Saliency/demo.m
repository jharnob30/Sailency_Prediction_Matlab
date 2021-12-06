% Saliency estimation demo
% [HISTORY]
% Mar 19, 2013 : created by Aykut Erdem

% close all;
clear all;
clc;
    % options for saliency estiomation
    options.size = 512;                     % size of rescaled image
    options.quantile = 1/10;                % parameter specifying the most similar regions in the neighborhood
    options.centerBias = 1;                 % 1 for center bias and 0 for no center bias
    options.modeltype = 'CovariancesOnly';  % 'CovariancesOnly' and 'SigmaPoints' 
                                            % to denote whether first-order statistics
                                            % will be incorporated or not


imageDir = './BenchmarkIMAGES/'; % replace with you image directory
resultFolder = './result/'; % where to store images
imgList = dir([imageDir '*.png']);

for i = 1:numel(imgList)
    % Visual saliency estimation with covariances and means
    options.modeltype = 'SigmaPoints';
    salmap = uint8(saliencymap([imageDir imgList(i).name], options));

    % Display results
    figure= imagesc(salmap);colormap(gray);axis off;
    imwrite(getframe(gca).cdata, [resultFolder, imgList(i).name]);
%     imwrite(salmap, [resultFolder, imgList(i).name]);

end                       
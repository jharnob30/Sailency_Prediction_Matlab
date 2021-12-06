clear all;
close all;

imageDir = './BenchmarkIMAGES/'; % replace with you image directory
resultFolder = './result/'; % where to store images
imgList = dir([imageDir '*.png']);

for i = 1:numel(imgList)
    % Visual saliency estimation with covariances and means
    imageName = [imageDir imgList(i).name];
    [x, y, ~] = size(imageName);

    % Computing the saliency maps for evaluation
    % SDS_GM
    SalMap_GM = SDS_GM(imageName);
    
    % SDS_LC
    SalMap_LC = SDS_LC(imageName);
    
    % show the saliency map

%     figure('visible','off'),imagesc(SalMap_LC);
    figure,imagesc(SalMap_LC);colormap(gray);axis off;
%     imwrite(getframe(gca).cdata, [resultFolder, imgList(i).name]);
end

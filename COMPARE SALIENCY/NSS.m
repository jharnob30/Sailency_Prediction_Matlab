function score = NSS(saliencyMap, fixationMap)
% saliencyMap is the saliency map
% fixationMap is the human fixation map (binary matrix
total_score = double(0);
imageDir_sm = './OUTPUTS/MODEL 3 SDS/'; % replace with you image directory
imageDir_fm = './SILANCY4ASD/td_FixMaps/'; % replace with you image directory
imgList_sm = dir([imageDir_sm '*.png']);
imgList_fm = dir([imageDir_fm '*.png']);
for i = 1:numel(imgList_sm)
    saliencyMap = im2gray(imread([imageDir_sm imgList_sm(i).name]));
    fixationMap = imread([imageDir_fm imgList_fm(i).name]);

    map = double(imresize(saliencyMap,size(fixationMap)));
    
    % normalize saliency map
    map = (map - mean(map(:)))/std(map(:)); 
    
    % mean value at fixation locations
    score = mean(map(logical(fixationMap))); 
    disp(score);
    total_score = total_score+score;
end
disp(total_score);title('Total Score:');
avg = total_score/300;
disp(avg);title('Average Score:');
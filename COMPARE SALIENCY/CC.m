% created: Zoya Bylinskii, Aug 2014

% This finds the linear correlation coefficient between two different 
% saliency maps (also called Pearson's linear coefficient).
% score=1 or -1 means the maps are correlated
% score=0 means the maps are completely uncorrelated

function score = CC(saliencyMap1, saliencyMap2);
total_score = double(0);
imageDir_sm = './OUTPUTS/MODEL 3 SDS/'; % replace with you image directory
imageDir_fm = './SILANCY4ASD/td_FixMaps/'; % replace with you image directory

imgList_sm = dir([imageDir_sm '*.png']);
imgList_fm = dir([imageDir_fm '*.png']);
for i = 1:numel(imgList_sm)

    saliencyMap1 = rgb2gray(imread([imageDir_sm imgList_sm(i).name]));
    saliencyMap2 = imread([imageDir_fm imgList_fm(i).name]);

    % saliencyMap1 and saliencyMap2 are 2 real-valued matrices
    
    map1 = im2double(imresize(saliencyMap1, size(saliencyMap2)));
    map2 = im2double(saliencyMap2);
    
    % normalize both maps
    map1 = (map1 - mean(map1(:))) / std(map1(:)); 
    map2 = (map2 - mean(map2(:))) / std(map2(:)); 
    
    score = corr2(map2, map1);
    total_score = total_score + score;
    disp(score)
    
end
disp(total_score);title('Total Score:');
avg = total_score/300;
disp(avg);title('Average Score:');

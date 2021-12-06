% created: Zoya Bylinskii, Aug 2014

% This finds the KL-divergence between two different saliency maps when
% viewed as distributions: it is a non-symmetric measure of the information 
% lost when saliencyMap is used to estimate fixationMap.


function score = KLdiv(saliencyMap, fixationMap);
% saliencyMap is the saliency map
% fixationMap is the human fixation map
total_score = double(0);
imageDir_sm = './OUTPUTS/MODEL 3 SDS/'; % replace with you image directory
imageDir_fm = './SILANCY4ASD/ASD_FixMaps/'; % replace with you image directory
imgList_sm = dir([imageDir_sm '*.png']);
imgList_fm = dir([imageDir_fm '*.png']);
for i = 1:numel(imgList_sm)
    saliencyMap = rgb2gray(imread([imageDir_sm imgList_sm(i).name]));
    fixationMap = imread([imageDir_fm imgList_fm(i).name]);
    map1 = im2double(imresize(saliencyMap, size(fixationMap)));
    map2 = im2double(fixationMap);
    
    % make sure map1 and map2 sum to 1
    if any(map1(:))
        map1 = map1/sum(map1(:));
    end
    
    if any(map2(:))
        map2 = map2/sum(map2(:));
    end
    
    % compute KL-divergence
    score = sum(sum(map2 .* log(eps + map2./(map1+eps))));
    total_score = total_score+score;
    disp(score);
end
disp(total_score);title('Total Score:');
avg = total_score/300;
disp(avg);title('Average Score:');


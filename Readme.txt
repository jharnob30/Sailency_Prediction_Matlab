Software - Matlab2021

#Used code and models from: Models - http://saliency.mit.edu/results_mit300.html Evaluation metric - https://github.com/cvzoya/saliency/tree/master/code_forMetrics Dataset - https://drive.google.com/file/d/1Aomt2tor41-qHTdFfRaa7c2oAKUBQlUX/view?usp=sharing

#Download:

Download dataset and extract
Download prediction models from above given link. (Here I downloaded FES, Sun saliency, SDS model) or,
You can clone this repository by command line: 'git clone https://github.com/jharnob30/Sailency_Prediction_Matlab'
#Run Prediction Models:

go to "models" folder. there are three folders of three models. To run models:
FES Model: go to Sailency_Prediction_Matlab\MODELs\FES. Run runSaliency.m
SS Model: go to Sailency_Prediction_Matlab\MODELs\SS. Run demo.m
SDS Model: go to Sailency_Prediction_Matlab\MODELs\SDS. Run demo.m
For all the models in there corresponding run file set the dir for input images and output images. By default folder is created and you can set the input images dir to "Sailency_Prediction_Matlab\INPUT IMAGES"
or,
you can create folder "BenchmarkIMAGES" in the corrseponding models directories, copy the images from INPUT IMAGES and paste it in "BenchmarkIMAGES" folder. now run the models and output will be added to the result folder in corresponding models folder.
#Using evaluation metrics to compare and get score value:

Job is to Compare Prediction Models with td_FixMap and ASD_FixMap.
Default model generated results are already given in OUTPUTS folder inside COMPARE SALIENCY folder named as Model 1 output, model 2 out put and model 3 output. Or you can transfer your generated results to the corresponding outputs folder. DIR: Sailency_Prediction_Matlab\COMPARE SALIENCY\OUTPUTS.
RUN the evaluation metrics application.
for model 2 and model 3 in code set "saliencyMap1" = rgb2gray(imread([imageDir_sm imgList_sm(i).name])); and remove rbg2gray lib for model 1.
Run the tool and collect the 2nd last value in disp.
Thank you.

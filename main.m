close all;clear;
conf = [];
conf= Our_init(conf);
Fnum=8000; % large value for wide-baseline task
SiftThreshold= 0.8; 
imagename1='rushmore1.png';
imagename2='rushmore2.png';    
I1=imread(imagename1);
I2=imread(imagename2); 
%% extract feature
[f1,d1]=extract_features(I1,Fnum);  
[f2,d2]=extract_features(I2,Fnum); 
%% generate putative matches
[matches,matches_all]=generate_matches(d1,d2,SiftThreshold);
inliers=LAV(I1,I2,f1,f2,matches,matches_all,conf);
%% display results
display_match_new(uint8(I1), uint8(I2), inliers, f1(1:2,:),f2(1:2,:));
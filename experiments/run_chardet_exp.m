% This script runs all the experiments for the chardet_exp
[dPath,ch,ch1,chC,chClfNm,dfNP]=globals;
%% First experiments:
% Run Ferns character detections trained on synth against the icdar test
% dataset
clfPath=fullfile('data','fern_synth.mat');
fmodel=load(clfPath);
test_dataset = fullfile(dPath,'icdar','test','images');
output_path = fullfile(dPath,'icdar','test','det_results');
chardet_exp(fmodel,test_dataset,output_path);

%%
fprintf('The results are at %s\n',output_path);

%% Calculating the F-score for the characters
gtDir = fullfile(dPath,'icdar','test','charAnn');
fscores = zeros(length(ch),1);
ticId=ticStatus('Collecting Fscore',1,30,1);
for char_index = 1:length(ch)-1
    [gt0,~] = bbGt('loadAll',gtDir,[],{'lbls',ch(char_index)});
    dt0 = loadBB(output_path,char_index);
    current_char = ch(char_index);

    % filter out the groundtruth
    [gt,dt] = bbGt( 'evalRes', gt0, dt0);
    [xs,ys,sc]=bbGt('compRoc', gt, dt, 0);
    fs = Fscore(xs,ys);
    fscores(char_index) = fs;
    tocStatus(ticId,char_index/(length(ch)));
end

%% Second experiments:
% Run the current trained models for SVM against the icdar dataset

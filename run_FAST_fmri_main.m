seeds_rand = wgdata.seeds;
%% LAPTOP1 - Resting & Word Generation ====================================
%   fast_fmri_resting(0.01,'test');       % practice resting
    fast_fmri_word_generation('' ,'practice');   % recording test
    
    %% first time
    fast_fmri_resting(6,'biopac','eye');       % 6 min resting
%   fast_fmri_resting(0.2,'biopac');       % 6 min resting

        %% WORD GENERATION + 2m RESTING
        fast_fmri_word_generation(seeds_rand,'biopac','eye');
%       fast_fmri_word_generation(seeds_rand,'eye');
        
        %% THINKING AND RATING
        [ts, isi_iti] = fast_fmri_generate_ts;
        fast_fmri_task_main(ts, isi_iti,'biopac','eye');
%         fast_fmri_task_main(ts, isi_iti);
        
        
        
%% LAPTOP2 - Transcribe ===================================================
    fast_fmri_transcribe_responses('nosound') % while running fast_fmri_word_generation
    
    %%     
    fast_fmri_transcribe_responses('only_na') % after running fast_fmri_word_generation
    
    %%
    fast_fmri_transcribe_responses('response_n', [8]) % playing sound only a few specific trials
    
            %% if you want to revise already written items.
            savedir = fullfile(pwd, 'data');            
            SID = sprintf('F087');
            SessID = input('Session number? ', 's');  
            save(fullfile(savedir, ['b_responsedata_sub' SID '_sess' SessID '.mat']),'response');

            %%             
            N = input('수정할 행?    ','s');
            content = input('수정할 내용?    ','s');
            dat_file = fullfile(savedir, ['b_responsedata_sub' SID '_sess' SessID '.mat']);          
            load(dat_file);
            response{str2double(N),1} = content;            
            save(fullfile(savedir, ['b_responsedata_sub' SID '_sess' SessID '.mat']),'response');
            
%             save(fullfile(savedir, ['d_surveydata_subF073.mat']),'survey');

            
%% SURVEY 
    words = fast_fmri_wholewords;           % subjectID = F010

    fast_fmri_survey(words);


    
    
    
    
    
      
   

%% RUN ONCE for the experiment
rng('shuffle');
seeds = {'학대', '거울', '눈물','가족'};
seeds_rand = seeds(randperm(numel(seeds))) 
% seeds_rand = {'눈물','가족','학대','거울'};   

%% SEEDWORDS for 2ND PARTICIPATION
i = 21;



seeds_rand  = {'환상'    '아픔'    '마음'    '사랑'; %1
    '사랑'    '아픔'    '환상'    '마음'; 
    '사랑'    '환상'    '아픔'    '마음';
    '환상'    '아픔'    '마음'    '사랑';
    '마음'    '아픔'    '환상'    '사랑';
    '아픔'    '사랑'    '환상'    '마음'; % F058
    '사랑'    '마음'    '환상'    '아픔'; % F059
    '환상'    '아픔'    '사랑'    '마음'; % F061
    '사랑'    '마음'    '아픔'    '환상'; % F067
    '마음'    '환상'    '사랑'    '아픔'; % 69
    '환상'    '사랑'    '마음'    '아픔'; % 70
    '환상'    '사랑'    '아픔'    '마음'; % 74
    '마음'    '아픔'    '사랑'    '환상'; % 76
    '환상'    '마음'    '사랑'    '아픔'; % 78
    '아픔'    '마음'    '환상'    '사랑'; % 79
    '사랑'    '아픔'    '마음'    '환상'; % 80
    '마음'    '사랑'    '환상'    '아픔'; % 81
    '아픔'    '환상'    '사랑'    '마음'; % 84
    '아픔'    '사랑'    '마음'    '환상'; % 85
    '마음'    '환상'    '아픔'    '사랑'; % 86
    '사랑'    '환상'    '마음'    '아픔'; % 87
    '환상'    '마음'    '아픔'    '사랑';
    '마음'    '사랑'    '아픔'    '환상';
    '아픔'    '마음'    '사랑'    '환상';
    '사랑'    '마음'    '환상'    '아픔';
    '환상'    '마음'    '사랑'    '아픔';
    '마음'    '아픔'    '사랑'    '환상';
    '환상'    '아픔'    '사랑'    '마음';
    '사랑'    '환상'    '아픔'    '마음';
    '아픔'    '마음'    '환상'    '사랑';
    '아픔'    '환상'    '마음'    '사랑';
    '마음'    '아픔'    '환상'    '사랑';
    '아픔'    '환상'    '사랑'    '마음';
    '환상'    '사랑'    '마음'    '아픔';
    '마음'    '아픔'    '사랑'    '환상'; 
    '사랑'    '마음'    '아픔'    '환상'}; % 35
seeds_rand = seeds_rand(i,:)
clear ;
InitializePsychSound(1);

PsychDefaultSetup(2); %Loading default settings
Screen('Preference', 'SkipSyncTests', 1);
addpath(genpath('sounds'));

addpath(genpath('NeumannSound'));
prepsounds;
prepscreen;
preprect;
InstructionList;
cs_type =3;
cs.StimSz = p.StimSz;
cs.Freq = 2.1;
cs.Contrast = .75; %in decimal
cs.ppd = p.ppd; %from prepscreen
response= nan(6,2);
cs_type= 1;

    panhandle = PsychPortAudio('Open', [],[], 1,tone.freq, tone.nrchannels);
    PsychPortAudio('FillBuffer', panhandle,  cs.instructions{cs_type}); % Buffering Tone
    instdur = length(cs.instructions{cs_type})/cs.instructionsf{cs_type};
    
    PsychPortAudio('Start', panhandle, 1,0,1,length(cs.instructions{cs_type}/cs.instructionsf{cs_type})); 
    centerfixation(w, p.FixType, p.FixSz, 255, p.FixLineWidth);
    
    TrialOn = Screen('Flip',w);
    InstOn = Screen('Flip',w, TrialOn + 1.5 - slack); % First fixation
    PsychPortAudio('Start', panhandle, 1,0,1,InstOn+instdur); %Instruction play.
    
%% akh

  centerfixation(w, p.FixType, p.FixSz, 255, p.FixLineWidth); 
          centerfixation(w, p.FixType, p.FixSz/2, 0 , p.FixLineWidth); 

        TrialOn = Screen('Flip',w);
       
        PsychPortAudio('FillBuffer', panhandle,  InstData.noise); % Buffering Tone
        instdur = length(InstData.noise)/InstFreq.noise;
    
        PsychPortAudio('Start', panhandle, 1,0,1,length(InstData.noise/InstFreq.noise)); 
        centerfixation(w, p.FixType, p.FixSz, 255, p.FixLineWidth); 
        centerfixation(w, p.FixType, p.FixSz/2, 0 , p.FixLineWidth); 

       
        InstOn = Screen('Flip',w, TrialOn+ 5 - slack); % First fixation
        PsychPortAudio('Start', panhandle, 1,0,1,InstOn+instdur); %Instruction play.
   


        
        centerfixation(w, p.FixType, p.FixSz, 255, p.FixLineWidth); 
        centerfixation(w, p.FixType, p.FixSz/2, 0 , p.FixLineWidth); 
        Screen('Flip', w, InstOn + 0.2); 
   
        WaitSecs(3);       
         
% [response(1,1),response(1,2)] = likert_question(w,ScreenRect,Questions.one, 0, 1);

% problem with gabour and sounnd 
%   panhandle = PsychPortAudio('Open', [],[], 1,tone.freq, tone.nrchannels);
%     PsychPortAudio('FillBuffer', panhandle,  cs.instructions{cs_type}); % Buffering Tone
%     instdur = length(cs.instructions{cs_type})/cs.instructionsf{cs_type};
%     
%     PsychPortAudio('Start', panhandle, 1,0,1,length(cs.instructions{cs_type}/cs.instructionsf{cs_type})); 
%     centerfixation(w, p.FixType, p.FixSz, 255, p.FixLineWidth);
%     
%     TrialOn = Screen('Flip',w);
%     InstOn = Screen('Flip',w, TrialOn + 1.5 - slack); % First fixation
%     PsychPortAudio('Start', panhandle, 1,0,1,InstOn+instdur); %Instruction play.
%     
%     
% 
% PsychPortAudio('FillBuffer', panhandle,  InstData.noise); % Buffering Tone
%         instdur = length(InstData.noise)/InstFreq.noise;
%     
%         PsychPortAudio('Start', panhandle, 1,0,1,length(InstData.noise/InstFreq.noise)); 
%         gabor = DrawGabor(cs.StimSz,cs.Freq,cs.Contrast, cs.angle{cs_type} ,cs.ppd);
%         gabor =(gabor+1)/2*255;
%         gabor = round(gabor*inc+gray);
%         gabortex = Screen('MakeTexture', w, gabor);
%         Screen('DrawTexture',w,gabortex, [], p.CentRect);
% 
%         TrialOn = Screen('Flip',w);
%         InstOn = Screen('Flip',w, TrialOn+ 4 - slack); % First fixation
%         PsychPortAudio('Start', panhandle, 1,0,1,InstOn+instdur); %Instruction play.

%% fucking sound 


% 
% panhandle = PsychPortAudio('Open', [],[], 1,tone.freq, tone.nrchannels);
% PsychPortAudio('FillBuffer', panhandle,  InstData.noise); % Buffering Tone
% instdur = length(InstData.noise)/InstFreq.noise;
%     
% PsychPortAudio('Start', panhandle, 1,0,1,length(InstData.noise/InstFreq.noise)); 
% 
%     
%     
%     %% Instruction Audio play: 1.5 secs  %%%%%%%%%%
%     %total Epoch dur= 2s
%     centerfixation(w, p.FixType, p.FixSz, 255, p.FixLineWidth);
%     centerfixation(w, p.FixType, p.FixSz2, 0, p.FixLineWidth);
%     TrialOn = Screen('Flip',w);
%     InstOn = Screen('Flip',w, TrialOn+ 4 - slack); % First fixation
%     PsychPortAudio('Start', panhandle, 1,0,1,InstOn+instdur); %Instruction play.
% 

    
%% double centrefixaxtion

% centerfixation(w, p.FixType, p.FixSz, 255, p.FixLineWidth); 
% Screen('Flip', w); 
% WaitSecs(4);
% centerfixation(w, p.FixType, p.FixSz, 255, p.FixLineWidth); 
% centerfixation(w, p.FixType, p.FixSz/2, 0 , p.FixLineWidth); 
% 


%% gabour ? 
% cs.StimSz = p.StimSz;
% cs.Freq = 2.1;
% cs.Contrast = .75; %in decimal
% cs.ppd = p.ppd; %from prepscreen
% for i=1:4
%     orientation={0, 45,135,90}
%      gabor = DrawGabor(cs.StimSz,cs.Freq,cs.Contrast, orientation{i} ,cs.ppd);
%      gabor =(gabor+1)/2*255;
%      gabor = round(gabor*inc+gray);
%      gabortex = Screen('MakeTexture', w, gabor); Screen('DrawTexture',w,gabortex, [], p.CentRect);
%      Screen('Flip', w); 
%      KbStrokeWait();
% end

sca;
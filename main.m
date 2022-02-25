

% function IMG_ACQ = IMG_ACQ(subject)

% %preparing data logging 
% logfilename = sprintf('%s/%s-%s-run%s-log.txt',RESULT,EXP.Subj);
% logfile = fopen(logfilename,'a');
% fprintf(logfile,'Trial,Condition,ShockOn,CSorientation,TrialOn,GaborOn,ITIon');



PsychDefaultSetup(2);
Screen('Preference', 'SkipSyncTests', 1);% Otherwise, I receive syncronation error
InitializePsychSound(1); 

Exp.Dir = pwd;
addpath(genpath('sounds')); % instruction sounds
addpath(genpath('NeumannSound')); % the loud noise, replacement of the shock for now

%loading scripts 
prepscreen;
PrepKeys;
prepsounds;
preprect; 
InstructionList;


Screen('BlendFunction', w, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');
% variables needed for gabor 
cs.StimSz = p.StimSz;
cs.Freq = 2.1;
cs.Contrast = .75; %in decimal
cs.ppd = p.ppd; %from prepscreen


% instructions to begin

DrawFormattedText(w, Instruction1 , 'center','center', [100 100 100]);
Screen('Flip', w); 

WaitSecs(0.5);
KbWait(-1);


 
%% taks --> 1: IMG_CS+ , 2:IMG_CS- , 3:ACQ_CS+ , 4: ACQ_CS-

% The main instruction is just the same as exp 3, with minor alterations 

for Trial=1:2
    
    for CSNumber=1:4
    

        cs_type= CSNumber;

        panhandle = PsychPortAudio('Open', [],[], 1,tone.freq, tone.nrchannels);
        PsychPortAudio('FillBuffer', panhandle,  cs.instructions{cs_type}); % Buffering Tone
        instdur = length(cs.instructions{cs_type})/cs.instructionsf{cs_type};

        PsychPortAudio('Start', panhandle, 1,0,1,length(cs.instructions{cs_type}/cs.instructionsf{cs_type})); 
        centerfixation(w, p.FixType, p.FixSz, 255, p.FixLineWidth);

        TrialOn = Screen('Flip',w);
        InstOn = Screen('Flip',w, TrialOn + 1.5 - slack); % First fixation
        PsychPortAudio('Start', panhandle, 1,0,1,InstOn+instdur); %Instruction play.


        if cs_type== 1
             WaitSecs(2);


            centerfixation(w, p.FixType, p.FixSz, 255, p.FixLineWidth); 
            centerfixation(w, p.FixType, p.FixSz/2, 0 , p.FixLineWidth); 
            TrialOn = Screen('Flip',w);

            PsychPortAudio('FillBuffer', panhandle,  InstData.noise); % Buffering Tone
            instdur = length(InstData.noise)/InstFreq.noise;

            PsychPortAudio('Start', panhandle, 1,0,1,length(InstData.noise/InstFreq.noise)); 
            centerfixation(w, p.FixType, p.FixSz, 255, p.FixLineWidth); 
            centerfixation(w, p.FixType, p.FixSz/2, 0 , p.FixLineWidth); 


            InstOn = Screen('Flip',w, TrialOn+ 4 - slack); % First fixation
            PsychPortAudio('Start', panhandle, 1,0,1,InstOn+instdur); %Instruction play.




            centerfixation(w, p.FixType, p.FixSz, 255, p.FixLineWidth); 
            centerfixation(w, p.FixType, p.FixSz/2, 0 , p.FixLineWidth); 
            Screen('Flip', w, InstOn + 0.2); 

            WaitSecs(3);

        elseif cs_type== 2

            WaitSecs(2);
            centerfixation(w, p.FixType, p.FixSz, 255, p.FixLineWidth); 
            centerfixation(w, p.FixType, p.FixSz/2, 0 , p.FixLineWidth); 
            Screen('Flip', w); 


              WaitSecs(4);




        elseif cs_type== 3

            WaitSecs(2);
            PsychPortAudio('FillBuffer', panhandle,  InstData.noise); % Buffering Tone
            instdur = length(InstData.noise)/InstFreq.noise;

            PsychPortAudio('Start', panhandle, 1,0,1,length(InstData.noise/InstFreq.noise)); 
            gabor = DrawGabor(cs.StimSz,cs.Freq,cs.Contrast, cs.angle{cs_type} ,cs.ppd);
            gabor =(gabor+1)/2*255;
            gabor = round(gabor*inc+gray);
            gabortex = Screen('MakeTexture', w, gabor);
            Screen('DrawTexture',w,gabortex, [], p.CentRect);

            TrialOn = Screen('Flip',w);
            InstOn = Screen('Flip',w, TrialOn+ 5 - slack); % First fixation
            PsychPortAudio('Start', panhandle, 1,0,1,InstOn+instdur); %Instruction play.
            WaitSecs(3);


        elseif cs_type== 4

         WaitSecs(2);


         gabor = DrawGabor(cs.StimSz,cs.Freq,cs.Contrast, cs.angle{cs_type} ,cs.ppd);
         gabor =(gabor+1)/2*255;
         gabor = round(gabor*inc+gray);
         gabortex = Screen('MakeTexture', w, gabor); Screen('DrawTexture',w,gabortex, [], p.CentRect);
         TrialOn = Screen('Flip',w);
         InstOn = Screen('Flip',w, TrialOn+ 5 - slack);
         WaitSecs(3);

        end

        centerfixation(w, p.FixType, p.FixSz, 255, p.FixLineWidth); 
        Screen('Flip', w); 
        WaitSecs(5);

        response= nan(6,2);

        if CSNumber==1


             [response(CSNumber,1),response(CSNumber,2)] = likert_question(w,ScreenRect,Questions.one, 0, 1);
              WaitSecs(3);

             [response(CSNumber+1,1),response(CSNumber+1,2)] = likert_question(w,ScreenRect,Questions.two, 0, 1);
              WaitSecs(3);

             [response(CSNumber+2,1),response(CSNumber+2,2)] = likert_question(w,ScreenRect,Questions.three, 0, 1);

        elseif CSNumber == 2


             [response(CSNumber+2,1),response(CSNumber+2,2)] = likert_question(w,ScreenRect,Questions.four, 0, 1);
              WaitSecs(3);
             [response(CSNumber+3,1),response(CSNumber+3,2)] = likert_question(w,ScreenRect,Questions.five, 0, 1);

        elseif   CSNumber == 3

             [response(CSNumber+3,1),response(CSNumber+3,2)] = likert_question(w,ScreenRect,Questions.six, 0, 1);
        end



    end 






    

% saving data


save(FileDataAll,'EXP', 'Trial', 'response', 'Start','Stop');   % Save Data File
end
sca;

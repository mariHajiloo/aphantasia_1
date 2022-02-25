%% Instruction Sound Files

% Load Instructions, auditory data
% Stimulus types: 1 = CS+S; 2 = CS+, 3 = CS-, 4 = CS+i, 5 = CS-i
% CS+ = L
% CS- = O
    cs.instructions  = {InstData.ImL, InstData.ImV, InstData.AtR, InstData.AtH};
    cs.instructionsf = {InstFreq.ImL, InstFreq.ImV , InstFreq.AtR, InstFreq.AtH};
    cs.angle = {135,180, 45,90};

%% Instructions

Questions.one = sprintf('How much did you fear the loud noise on the IMAGINE LEFT trials?');

Questions.two = sprintf('How vivid was your mental images on IMAGINE LEFT trials?') ;

Questions.three = sprintf('How hard did you try to form the mental images on IMAGINE LEFT trials?');

Questions.four = sprintf('How vivid was your mental images on IMAGINE VERTICAL trials?') ;

Questions.five = sprintf('How hard did you try to form the mental images on IMAGINE VERTICAL trials?');
 
Questions.six = sprintf('How much did you fear the loud noise on the ATTEND RIGHT trials?');



 Instruction1 = sprintf('\n\nKeep your eyes fixated on the dot when it is present \n\n\n\n\nPress any key to continue');
% Instruction1 = strcat(Instruction1.line{1:length(Instruction1.line)});

% Instruction2.line{1} = sprintf('You will also be presented with probes');
% Instruction2.line{2} = sprintf('\n\nPress "1" if the probe is ON letter \n\nPress "2" if the probe is OFF letter') ;
% Instruction2.line{3} = sprintf('\n\n\n\n\nPress any key to continue');
% Instruction2 = strcat(Instruction2.line{1:length(Instruction2.line)});
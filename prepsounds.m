% Prep auditory names and files


% Attend Right and Horizontal

[InstData.AtH, InstFreq.AtH ] = audioread('AttendHorizontal.mp3');
InstData.AtH = InstData.AtH';

[InstData.AtR, InstFreq.AtR ] = audioread('AttendRight.mp3');
InstData.AtR = InstData.AtR';

% Imagine Left and Right
[InstData.ImL, InstFreq.ImL ] = audioread('ImagineLeft.mp3');
InstData.ImL = InstData.ImL';


[InstData.ImV, InstFreq.ImV ] = audioread('ImagineVertical.mp3');
InstData.ImV = InstData.ImV';

%lous noise

[InstData.noise, InstFreq.noise ] = audioread('sound.wav');
InstData.noise = InstData.noise';
%Other stuff
tone.freq = InstFreq.AtR;
tone.nrchannels = 1;
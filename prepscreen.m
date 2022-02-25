%% Screen Parameters
fontName = 'Calibri';
fontSize = 20;

%Which screen to display on
whichScr = max(Screen('screens'));

% Color 
p.white = WhiteIndex(whichScr);
p.black = BlackIndex(whichScr);
gray = round((p.white+p.black)/2);
inc = p.white/2;

% Set Window, w, info and screenrect
% FMRI screen: [0 0 1024 768]

[w, ScreenRect] = Screen('OpenWindow', whichScr, 0); %128 for greyscale
slack = Screen('GetFlipInterval', w)/2; %half of the flip time b/c that corresponds centre fixation
priorityLevel = MaxPriority(w);


% Scanner video monitor dist = 91cm; Monitor size = 17inchs
% BH monitor 47cm dist, 19 inch monitor
p.DistanceCm  = 85;
p.MonitorInch = 17;
res=Screen('Resolution',whichScr);


p.ppcm = sqrt(sum(ScreenRect.^2))/(p.MonitorInch*2.54); %pixels per cm
p.dpcm = atan(1./p.DistanceCm).*(180/pi); %degree per cm
p.ppd = p.ppcm/p.dpcm; %pixel per degree

% Size Parameter
p.StimDeg = 8;
p.StimSz = round(p.ppd * p.StimDeg); % size from edge to edge of stim

%Apply Gaussian filter
%p.Gaussian = 1; % Gaussian blur filter envelepe
%p.Gauss = fspecial('gaussian', [round(p.ppd * p.Gaussian) round(p.ppd * p.Gaussian)], 1.0); %Gaussian filter size



% Fixation 
% centerFixation(w, pattern, sz, color, lineWidth)
% Usage: centerFixation (windowPtr, patternOrStr, fixationOrTextSize, color, lineWidth)
% Draws a fixation point or text in the center of the screen.
% Inputs: Pattern - If pattern is a string, it will be displayed.
%                   Otherwise:
%                   1 - circle
%                   2 - square
%                   3 - + (default)
%                   4 - x
%         fixationOrTextSize - figure it out
%         color - index of CLUT, scalar or triplet.
%         lineWidth - use only if pattern is 3 or 4
 
p.FixType = 1;
p.FixDeg = 0.5;
p.FixSz = round(p.ppd * p.FixDeg);
p.FixSz2 = round(p.ppd * (p.FixDeg*3/4));
p.FixLineWidth = 2;

% centerFixation(w, p.FixType, p.FixSz, 0, p.FixLineWidth); 





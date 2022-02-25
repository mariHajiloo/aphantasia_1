%% Determine Rect Positions %%
%% Uses info from monitor size, and visual angle information %%

%% Find monitor center
s.screenWidth = ScreenRect(3);
s.screenHeight = ScreenRect(4);
s.screenCenterX = s.screenWidth/2;
s.screenCenterY = s.screenHeight/2;

l.Xcenter = s.screenWidth/2;  % l is for location
l.Ycenter = s.screenHeight/2;

%% Draw rect at the centre of the screen
rectLeft = l.Xcenter-p.StimSz/2;
rectTop = l.Ycenter-p.StimSz/2;
rectRight = l.Xcenter+p.StimSz/2;
rectBottom = l.Ycenter+p.StimSz/2;

p.CentRect = [rectLeft rectTop rectRight rectBottom];

%% Draw a full screen rect with a small border


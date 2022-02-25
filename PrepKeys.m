% This is for Key Assign what will be used in Study
% Response
% 11/17/11

FlushEvents;% initialize mex functions
KbName('UnifyKeyNames');% Setting key code to Mac

% fMRI Keys
KB.One1   = KbName('1'); KB.One2   = KbName('1!');
KB.Two1   = KbName('2'); KB.Two2   = KbName('2@');
KB.Three1 = KbName('3'); KB.Three2 = KbName('3#');
KB.Four1  = KbName('4'); KB.Four2  = KbName('4$');

KB.TR1   = KbName('5'); KB.TR2  = KbName('5%');
KB.Start  = KbName('s');KB.Q    = KbName('q'); 

% General keys
KB.SpaceBar = KbName('space');       KB.Shift   = KbName('LeftShift');
KB.Control  = KbName('LeftControl'); KB.Alt     = KbName('LeftAlt');
KB.Left     = KbName('LeftArrow');   KB.N       = KbName('n');
KB.Right    = KbName('RightArrow');  KB.M       = KbName('m');
KB.Q        = KbName('q');           KB.Down    = KbName('DownArrow');

KB.Resp1 =  [KB.Left KB.One1 KB.One2]; 
KB.Resp2 =  [KB.Down KB.Two1 KB.Two2]; 
KB.Resp3 =  [KB.Right KB.Three1 KB.Three2];
KB.ALL   =  [KB.Resp1 KB.Resp2 KB.Resp3];
KB.TR    =  [KB.TR1 KB.TR2]; 
KB.Quit  =  [KB.Shift KB.Q]; % To quit, press Shift+Q


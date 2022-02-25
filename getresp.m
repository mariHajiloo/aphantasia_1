function [UserResp, RT, keyCode] = getresp(KB, varargin)
startSecs = GetSecs;
go = true;

%FlushEvents('keyDown');

if strcmpi(varargin, 'SpaceBar')
    
    while go
        % FlushEvents('keyDown');
        [keyIsDown, endSecs, keyCode] = KbCheck(-1);
        TimeOut = endSecs - startSecs;
        if keyIsDown
            respSecs = GetSecs;
            if keyCode(KB.SpaceBar)
                UserResp = 0;
                go = false;
            end % end if keyCode
        end % end if keyIsDown
    end %end while go
    
else
    
    while go;
        tFinish = GetSecs;
        TimeOut = tFinish - startSecs;
        [keyIsDown, endSecs, keyCode] = KbCheck(-1);
        if keyIsDown,
            if any(keyCode(KB.Resp1))
                UserResp = 1 
                go = false;
             elseif any(keyCode(KB.Resp2))
                UserResp = 2;
                go = false;
                
             elseif any(keyCode(KB.Resp3))
                UserResp = 3;
                go = false;
                
             elseif any(keyCode(KB.Four1))
                UserResp = 4;
                go = false;
             elseif any(keyCode(KB.Four2))
                UserResp = 4;
                go = false;
            
             elseif TimeOut > 10.0; %time in seconds that you gather responses
            UserResp = 99;
            go = false;
            display(' ');
            display('No Response, Miss!');
        end %end if keyIsDown
    end % end while go
    
    
    end
end

RT = round((endSecs - startSecs)*1000);
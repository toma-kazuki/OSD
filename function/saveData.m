%% Save Simulation Data
%/*************************************************************************
%* Programmer    : Kazuki TOMA
%* Title         : saveData.m
%* Affiliation   : NAKASUKA/FUNASE LAB
%* Creation Date : 2022/9/19
%* Recent Update : 2022/9/19
%* Language      : Matlab
%* Version       : 1.0.0
%**************************************************************************
function saveData(basepath)
    prompt = '[Input:save data? type 1(YES) or 0(NO)\n>>>';
    str = input(prompt);
    if str == 1
        dt = datetime('now');
        disp(dt);
        DateString = datestr(dt,'yymmdd/HHMM');
        prompt = '[Input:Identify the results(Do not use space)]\n>>>';
        str = input(prompt,'s');
        dirname = append('./out/',DateString,'_',str);
        dirname = fullfile(basepath,dirname);
        mkdir(dirname);

        % save figure
        saveFig(dirname);

        % save command window
        diary off;
        movefile('commandlog.txt',dirname);
        
        % save workspace
        %movefile('setting_simulation.mat',dirname);
        
    end
end
%% save FIgure as png & fig file to output folder
%/*************************************************************************
%* Programmer    : Kazuki TOMA
%* Title         : saveFig.m
%* Affiliation   : NAKASUKA/FUNASE LAB
%* Creation Date : 2022/7/15
%* Recent Update : 2022/7/15
%* Language      : Matlab
%* Version       : 1.0.0
%**************************************************************************
function saveFig(dirname)
    %% Save figure
    fobj = gcf;
    for figurenumber = 1:fobj.Number
            pngname = append('image',num2str(figurenumber),'.png');
            saveas(figure(figurenumber),pngname);
            movefile(pngname,dirname);               
            figname = append('matfig',num2str(figurenumber),'.fig');
            saveas(figure(figurenumber),figname);
            movefile(figname,dirname);
    end
end


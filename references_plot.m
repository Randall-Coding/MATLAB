%annotation textbox, the dimensions and position are from 0 to 1.  
% [Pos,Pos, Dim,Dim] 
tbox = annotation('textbox',[.45,.39,.15,.15],'String','Is this omega??  \omega  \omega \omega','FontSize',20);
tbox = annotation('textbox',[.25,.70,.30,.15],'String','Is this omega??  ^{\omega}  \omega _{\omega}','FontSize',16);

%saving a plot as a .fig with an .m file to call it
saveas(plot1,'plottt','m');
%or
saveas(gcf(),'plottt','m');  %saving the entire figure

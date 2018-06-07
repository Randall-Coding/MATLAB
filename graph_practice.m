close(gcf)

salesTable = readtable('monthly_sales.xlsx');

axis_labels = salesTable.Properties.VariableNames

salesData = salesTable{1:12,3};
salesDates = salesTable{1:12,1} 

XSource = datenum( salesDates(1:5,1) ) ;
YSource = salesData(1:5,1)

 

bar(XSource,YSource);   

set(gca,'XTick',XSource);

%turns date nums back into dates
datetick('x','mmm dd','keeplimits','keepticks')

% annotation('Textbox',[0.2,0.5,.25,.1],'String','Is this the text?');

my_title = "Monthly Sales Data"
%%%my_title = input('Give your figure a title','s');

title(my_title);
set(gcf,'Name',"Cassavant");
set(gcf,'NumberTitle','off');

xlabel(axis_labels{3}) ;
ylabel(axis_labels{1});
%%% legend();
%Feb 20, 2017, Created by Lili
%for plotting the data to compare our RRT and traditional RRT
data=load('data.txt')

y1=mean(data(:,1));
y11=mean(data(:,5));
y2=mean(data(:,2));
y22=mean(data(:,6))
y3=mean(data(:,3));
y33=mean(data(:,7));
y4=mean(data(:,4));
y44=mean(data(:,8))
e1 = std(data(:,1));
e11= std(data(:,5));
e2 = std(data(:,2));
e22= std(data(:,6));
e3 = std(data(:,3));
e33= std(data(:,7));
e4 = std(data(:,4));
e44= std(data(:,8));

model_series = [y1, y11; y2, y22; y3, y33; y4, y44];
model_error = [e1, e11; e2, e22; e3, e33; e4, e44];
h = bar(model_series);
set(h,'BarWidth',1);    % The bars will now touch each other
set(gca,'YGrid','on')
set(get(gca,'XLabel'),'String','Task')
set(get(gca,'YLabel'),'String','Time (s)')
lh = legend('RRT','Variant size RRT');
set(gca, 'FontSize', 14);
%set(lh,'Location','BestOutside','Orientation','horizontal')
hold on;
numgroups = size(model_series, 1); 
numbars = size(model_series, 2); 
groupwidth = min(0.8, numbars/(numbars+1.5));
for i = 1:numbars
      % Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
      x = (1:numgroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*numbars);  % Aligning error bar with individual bar
      errorbar(x, model_series(:,i), model_error(:,i), 'k', 'linestyle', 'none');
end

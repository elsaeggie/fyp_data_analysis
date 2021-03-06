% data analysis final

clear all; clc;
txtfiles = dir('*.txt') ; 
N = length(txtfiles) ;
data = cell(11,7);
%arraning data s.t. each col = one subject 
%each subject has 11 rows
for i = 1:N
    if i <12 %1-11
    data{i} = readtable(txtfiles(i).name) ;
    end
    if i>11 && i<23 %12-22
    data{i-11,2} = readtable(txtfiles(i).name);
    end 
    if i>22 && i<34 %23-33
    data{i-22,3} = readtable(txtfiles(i).name) ;
    end 
    if i>33 && i<45 %34-44
    data{i-33,4} = readtable(txtfiles(i).name) ;
    end 
    if i>44 && i<56 %45-55
    data{i-44,5} = readtable(txtfiles(i).name) ;
    end 
    if i>55 && i<67 %56-66
    data{i-55,6} = readtable(txtfiles(i).name) ;
    end 
    if i>66 && i<78 %67-77
    data{i-66,7} = readtable(txtfiles(i).name) ;
    end 
%     if i>77 && i<89
%     data{i-77,7} = readtable(txtfiles(i).name) ;
%     end 
    
end
%%
clc;
[red_c, green_c, blue_c, red_green_c, red_blue_c, green_blue_c, location_first, colourFirst, first_locations, first_colours]= time_cal_cell(data);

%%
%close all;
figure;
bar(mean(red_c,2)/30);
title('Mean time left hand (red) moved','Fontsize',20);
% legend('first','second','third');
%ylim([0 150]);

figure;
boxplot(mean(red_c,2)/30);
%%
Y = [(mean(red_c(3:end,:),2)/30),(mean(green_c(3:end,:),2)/30),(mean(blue_c(3:end,:),2)/30), (mean(red_blue_c(3:end,:),2)/30),(mean(red_green_c(3:end,:),2)/30), (mean(green_blue_c(3:end,:),2)/30)];
X = {'Red', 'Green', 'Blue', 'Red+Blue', 'Red+Green', 'Green+Blue'};
figure;
boxchart(Y);
title('Mean time moved across all tasks','Fontsize',20);
ylabel('Time(s)');
xlabel('Limbs')
%legend('Red', 'Green', 'Blue', 'Red+Blue', 'Red+Green', 'Green+Blue');
%%
dist_1 = [(mean(red_c(3:5,:),2)/30),(mean(green_c(3:5,:),2)/30),(mean(blue_c(3:5,:),2)/30), (mean(red_blue_c(3:5,:),2)/30),(mean(red_green_c(3:5,:),2)/30), (mean(green_blue_c(3:5,:),2)/30)];
X = {'Red', 'Green', 'Blue', 'Red+Blue', 'Red+Green', 'Green+Blue'};
figure;
subplot(3,1,1);
boxchart(dist_1);
title('Mean time moved for Task 1','Fontsize',20);
ylabel('Time(s)');
xlabel('Limbs')
ylim([40 180]);
grid on;
grid minor;

Y_2 = [(mean(red_c(6:8,:),2)/30),(mean(green_c(6:8,:),2)/30),(mean(blue_c(6:8,:),2)/30), (mean(red_blue_c(6:8,:),2)/30),(mean(red_green_c(6:8,:),2)/30), (mean(green_blue_c(6:8,:),2)/30)];
X = {'Red', 'Green', 'Blue', 'Red+Blue', 'Red+Green', 'Green+Blue'};
subplot(3,1,2);
boxchart(Y_2);
title('Mean time moved for Task 2','Fontsize',20);
ylabel('Time(s)');
xlabel('Limbs')
ylim([40 180]);
grid on;
grid minor;

Y_3 = [(mean(red_c(9:11,:),2)/30),(mean(green_c(9:11,:),2)/30),(mean(blue_c(9:11,:),2)/30), (mean(red_blue_c(9:11,:),2)/30),(mean(red_green_c(9:11,:),2)/30), (mean(green_blue_c(9:11,:),2)/30)];
X = {'Red', 'Green', 'Blue', 'Red+Blue', 'Red+Green', 'Green+Blue'};
subplot(3,1,3);
boxchart(Y_3);
title('Mean time moved for Task 3','Fontsize',20);
ylabel('Time(s)');
xlabel('Limbs')
ylim([40 180]);
grid on;
grid minor;
%%
figure;
bar(mean(green_c,2)/30);
title('Mean time foot (green) moved','Fontsize',20);
%legend('first','second','third');
%ylim([0 150]);

figure;
bar(mean(blue_c,2)/30);
title('Mean time right hand (blue) moved','Fontsize',20);
% legend('first','second','third');
%ylim([0 150]);
%%
figure;
bar(mean(red_green_c,2)/30);
title('Mean time left hand and foot (red and green) moved together','Fontsize',20);
% legend('first','second','third');
%ylim([0 150]);

figure;
bar(mean(red_blue_c,2)/30);
title('Mean time both hands (red and blue) moved together','Fontsize',20);
% legend('first','second','third');
%ylim([0 150]);

figure;
bar(mean(green_blue_c,2)/30);
title('Mean time right hand and foot (blue and green) moved together','Fontsize',20);
% legend('first','second','third');
%ylim([0 150]);


[fail, total_no, correct, percentage, avg_time] = accuracy_cal(data);


%%
%clc;
[location_first, colourFirst, first_locations, first_colours] = coord(data);
%first_locations{3,1}
%first_colours{3,1}

%%
%distance
blue_x = zeros(size(data));
blue_y = zeros(size(data));
green_x = zeros(size(data));
green_y = zeros(size(data));
red_x = zeros(size(data));
red_y = zeros(size(data));
blue_dist = 1.0e+03 * [

         0         0         0         0         0         0         0;
         0         0         0         0         0         0         0;
    0.4046    0.4310    0.2314    0.2857    0.5134    0.4653    0.7255;
    0.5300    0.6306    0.3010    0.3767    0.5413    0.4624    0.7985;
    0.5175    0.6663    0.3010    0.3001    0.5131    0.5110    0.7978;
    0.6007    0.7741    0.3201    0.2878       NaN    0.6702    0.9874;
    0.6860       NaN    0.4737    0.3191    0.5166    0.6305    1.2475;
    0.7285    0.8213    0.4872    0.3341    0.5511    0.7265    1.0081;
    0.6609    0.6183       NaN    0.3276    0.5794    0.6393    0.8555;
    0.6583    0.7393    0.5996    0.3324    0.5821    0.7055    1.0285;
    0.5693    0.6767    0.4465    0.3787    0.6191    0.7473    1.0680];
%%
for j=3:size(data,1)
    for i=1:size(data,2)
        %         for k=1:length(data{j,i}(1))-1
        %             if isnan(data(j,i).(1)(k))
        %                 data{j,i}.(9)(k) = data{j,i}.(9)(k+1);
        %                 data{j,i}.(10)(k) = data{j,i}.(10)(k+1);
        %                 data{j,i}.(13)(k) = data{j,i}.(13)(k+1);
        %                 data{j,i}.(12)(k) = data{j,i}.(12)(k+1);
        %                 data{j,i}.(15)(k) = data{j,i}.(15)(k+1);
        %                 data{j,i}.(16)(k) = data{j,i}.(16)(k+1);
        %
        %             end
        %         end
        %or use d=sqrt((x1-x2)^2+(y1-y2)^2);
        
        
        blue_x (j,i)= sum(abs(diff(data{j,i}.(9))));
        blue_y (j,i)= sum(abs(diff(data{j,i}.(10))));
        green_x (j,i)= sum(abs(diff(data{j,i}.(12))));
        green_y (j,i)= sum(abs(diff(data{j,i}.(13))));
        red_x (j,i)= sum(abs(diff(data{j,i}.(15))));
        red_y (j,i)= sum(abs(diff(data{j,i}.(16))));
        
    end
end
%%
for j=3:size(data,1)
    for i=1:size(data,2)
%         for k=1:length(data{j,i}(1))-1
%             if isnan(data(j,i).(1)(k))
%                 data{j,i}.(9)(k) = data{j,i}.(9)(k+1);
%                 data{j,i}.(10)(k) = data{j,i}.(10)(k+1);
%                 data{j,i}.(13)(k) = data{j,i}.(13)(k+1);
%                 data{j,i}.(12)(k) = data{j,i}.(12)(k+1);
%                 data{j,i}.(15)(k) = data{j,i}.(15)(k+1);
%                 data{j,i}.(16)(k) = data{j,i}.(16)(k+1);
%                 
%             end
%         end
        %or use d=sqrt((x1-x2)^2+(y1-y2)^2);
        for k=1:length(data{j,i}.(9))-1
            diff_x= diff(data{j,i}.(9)(k:k+1))
            diff_y= diff(data{j,i}.(10)(k:k+1))
            blue_dist(j,i) = sqrt(diff_x^2 + diff_y^2) + blue_dist(j,i)
            %         blue_x (j,i)= sum(abs(diff(data{j,i}.(9))));
            %         blue_y (j,i)= sum(abs(diff(data{j,i}.(10))));
            %         green_x (j,i)= sum(abs(diff(data{j,i}.(12))));
            %         green_y (j,i)= sum(abs(diff(data{j,i}.(13))));
            %         red_x (j,i)= sum(abs(diff(data{j,i}.(15))));
            %         red_y (j,i)= sum(abs(diff(data{j,i}.(16))));
        end
    end
end
%%
green_dist= zeros(size(data));
red_dist= zeros(size(data));
for j=1:size(data,1)
    for i=1:size(data,2)
%         for k=1:length(data{j,i}(1))-1
%             if isnan(data(j,i).(1)(k))
%                 data{j,i}.(9)(k) = data{j,i}.(9)(k+1);
%                 data{j,i}.(10)(k) = data{j,i}.(10)(k+1);
%                 data{j,i}.(13)(k) = data{j,i}.(13)(k+1);
%                 data{j,i}.(12)(k) = data{j,i}.(12)(k+1);
%                 data{j,i}.(15)(k) = data{j,i}.(15)(k+1);
%                 data{j,i}.(16)(k) = data{j,i}.(16)(k+1);
%                 
%             end
%         end
        %or use d=sqrt((x1-x2)^2+(y1-y2)^2);
        for k=1:length(data{j,i}.(9))-1
            diff_g_x= diff(data{j,i}.(12)(k:k+1));
            diff_g_y= diff(data{j,i}.(13)(k:k+1));
            diff_r_x= diff(data{j,i}.(15)(k:k+1));
            diff_r_y= diff(data{j,i}.(16)(k:k+1));
            green_dist(j,i) = sqrt(diff_g_x^2 + diff_g_y^2) + green_dist(j,i)
            red_dist(j,i) = sqrt(diff_r_x^2 + diff_r_y^2) + red_dist(j,i)
            
            %         blue_x (j,i)= sum(abs(diff(data{j,i}.(9))));
            %         blue_y (j,i)= sum(abs(diff(data{j,i}.(10))));
            %         green_x (j,i)= sum(abs(diff(data{j,i}.(12))));
            %         green_y (j,i)= sum(abs(diff(data{j,i}.(13))));
            %         red_x (j,i)= sum(abs(diff(data{j,i}.(15))));
            %         red_y (j,i)= sum(abs(diff(data{j,i}.(16))));
        end
    end
end
%%
figure;
boxchart(blue_dist(3:end,:)');
title('Distance travelled blue','Fontsize',20);
ylabel('Time(s)');
xlabel('Tasks');
grid on;
grid minor;
%%
figure;
boxchart(blue_x(3:end,:)');
title('Distance travelled blue x','Fontsize',20);
ylabel('Time(s)');
xlabel('Tasks');
grid on;
grid minor;

figure;
boxchart(blue_y(3:end,:)');
title('Distance travelled blue y','Fontsize',20);
ylabel('Time(s)');
xlabel('Tasks');
grid on;
grid minor;

figure;
blue_D = sqrt((blue_x).^2+(blue_y).^2);
boxchart(blue_D(3:end,:)');
title('Distance travelled blue','Fontsize',20);
ylabel('Time(s)');
xlabel('Tasks');
grid on;
grid minor;
%%
%green
figure;
boxchart(green_dist(1:end,:)');
title('Distance travelled green','Fontsize',20);
ylabel('Time(s)');
xlabel('Tasks');
grid on;
grid minor;

figure;
boxchart(green_x(1:end,:)');
title('Distance travelled green x','Fontsize',20);
ylabel('Time(s)');
xlabel('Tasks');
grid on;
grid minor;

figure;
boxchart(green_y(1:end,:)');
title('Distance travelled green y','Fontsize',20);
ylabel('Time(s)');
xlabel('Tasks');
grid on;
grid minor;

figure;
green_D = sqrt((green_x).^2+(green_y).^2);
boxchart(green_D(1:end,:)');
title('Distance travelled green','Fontsize',20);
ylabel('Time(s)');
xlabel('Tasks');
grid on;
grid minor;


%% 
%red
figure;
boxchart(red_dist(1:end,:)');
title('Distance travelled red','Fontsize',20);
ylabel('Time(s)');
xlabel('Tasks');
grid on;
grid minor;

figure;
boxchart(red_x(1:end,:)');
title('Distance travelled red x','Fontsize',20);
ylabel('Time(s)');
xlabel('Tasks');
grid on;
grid minor;

figure;
boxchart(red_y(1:end,:)');
title('Distance travelled red y','Fontsize',20);
ylabel('Time(s)');
xlabel('Tasks');
grid on;
grid minor;

figure;
red_D = sqrt((red_x).^2+(red_y).^2);
boxchart(red_D(1:end,:)');
title('Distance travelled red','Fontsize',20);
ylabel('Time(s)');
xlabel('Tasks');
grid on;
grid minor;

%%
[fail_no, total_no, correct_no, percentage_completed, avg_time] = accuracy_cal(data)

matching_location_first = zeros(size(data));

for j=3:size(data,1)
    for i=1:size(data,2)
        matching_location_first(j,i) =(location_first(j,i)/total_no(j,i))*100;
    end
end
figure;
plot(matching_location_first);
%%
figure;
boxchart(matching_location_first(3:end,:));
%%
%t1
dist_1 = [(mean(red_c(3:5,:),2)/30),(mean(green_c(3:5,:),2)/30), ...
    (mean(blue_c(3:5,:),2)/30), (mean(red_blue_c(3:5,:),2)/30),...
    (mean(red_green_c(3:5,:),2)/30), (mean(green_blue_c(3:5,:),2)/30)];
figure;
subplot(3,1,1);
boxchart(dist_1);
title('Mean time moved for Task 1','Fontsize',20);
ylabel('Time(s)');
xlabel('Limbs')
ylim([40 180]);
grid on;
grid minor;
%%
clc;
[footFirst]  = foot_first(data);

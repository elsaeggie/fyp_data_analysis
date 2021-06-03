function [fail_no, total_no, correct_no, percentage_completed, avg_time] = accuracy_cal(total)
% accuracy
fail_no(:,:) = zeros;
wrong_seq(:,:) = zeros;

for i=1:size(total,2) %col
    for j=3:size(total,1) %row
        fail_no(j,i) = max(total{j,i}.(30));
        total_no(j,i) = max(total{j,i}.(5));
        correct_no(j,i) = total_no(j,i)- fail_no(j,i);
        percentage_completed(j,i) = correct_no(j,i)/total_no(j,i)*100;
        avg_time(j,i) = (180 - 15*fail_no(j,i))/correct_no(j,i);
        
        
    end
    
end
%task_1 only
% for i=
%     wrong_seq(1,i)= max(total(1,i).table.(31));
% end
end
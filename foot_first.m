function [footFirst]  = foot_first(total)

footFirst = zeros(size(total));

for j=3:size(total,1)
    for i=1:size(total,2)
        n_matched(j,i) = max(total{j,i}.(5));
        
        %time that foot in range ie: row(7) >0 consecutively for 10
        %rows
        
        %mean time (row) the foot moved first
        %foot moved while red and blue = 0
        for matching = 1:n_matched(j,i)
            matching
            %idxs = total{j,i}.(5) == matching;
            idxs = find(total{j,i}.(5) == matching);
            %subtable = total{j,i}.(12)(idxs,:);
            flagFirst = 0;
            for k=1:length(idxs) %no of rows
                current_idx = idxs(k);
                %b = ((abs((total{j,i}.(12)(current_idx) - (mean(total{j,i}.(12)(current_idx+10))))))> 0.1)
                if (((abs((total{j,i}.(12)(current_idx) - (mean(total{j,i}.(12)(current_idx))))))> 0.1) ...
                    || (abs((total{j,i}.(13)(current_idx) - (mean(total{j,i}.(13)(current_idx)))))> 0.1) ...
                    && (abs((total{j,i}.(9)(current_idx) - (mean(total{j,i}.(9)(current_idx)))))< 0.1) ...
                    && (abs((total{j,i}.(10)(current_idx) - (mean(total{j,i}.(10)(current_idx)))))< 0.1) ...
                    && (abs((total{j,i}.(15)(current_idx) - (mean(total{j,i}.(15)(current_idx)))))< 0.1) ...
                    && (abs((total{j,i}.(16)(current_idx) - (mean(total{j,i}.(16)(current_idx)))))< 0.1) ...
                    && flagFirst == 0)
                    
                    disp('In if statement')
                    myIdx = k
                    flagFirst = 1;
                else
                    disp('None')
                end
                
                if(matching>1)
                    prevIndex = max(find(total{j,i}.(5) == (matching-1)));
                else
                    prevIndex = 0;
                end
                
                myIdx = myIdx + prevIndex;
                
                a = total{j,i}.(2)(myIdx)
                footFirst(matching) = total{j,i}.(2)(myIdx);
                
                
            end
            %end
        end
    end
    
    
end
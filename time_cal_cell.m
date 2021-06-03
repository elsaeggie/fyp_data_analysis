function [red, green, blue, red_green, red_blue, green_blue, location_first, colourFirst, first_locations, first_colours] = time_cal(total)


red = zeros(size(total));
blue = zeros(size(total));
green = zeros(size(total));
red_green  = zeros(size(total));
red_blue = zeros(size(total));
green_blue  = zeros(size(total));
location_first = zeros(size(total));
n_matched  = zeros(size(total));
location_first = zeros(size(total));
location_first_percentage = zeros(size(total));
first_locations = cell(size(total));
first_colours = cell(size(total));

for j=3:size(total,1) %11
% for j=3:3 %11
    for i=1:size(total,2) %4
%     for i=1:1 %4
        
        n_matched(j,i) = max(total{j,i}.(5));
        
        %move inside or match colour first
        colourFirst = 0;
        %for skipped targets
        firstConsec_inCircle = -1*ones(1,n_matched(j,i));
        firstConsec_colourRight = -1*ones(1,n_matched(j,i));
        for matching = 1:n_matched(j,i)
        %for matching = 19:19
            idxs = total{j,i}.(5) == matching;
            inCircle = find(total{j,i}.(4)(idxs,:));
            colourRight = find(total{j,i}.(3)(idxs,:));
            
            if(matching>1)
                prevIndex = max(find(total{j,i}.(5) == (matching-1)));
            else
                prevIndex = 0;
            end
            
            if(isempty(colourRight))
                colourRight = 999;
            end
            
            if(isempty(inCircle))
                inCircle = 999;
            end
            
            % which one first, counter
            if(inCircle(1)>colourRight(1))
                colourFirst = colourFirst + 1;
            end
            
%             % finding 10 consecutive values for inCircle
%             if(inCircle~=999)
%                 nonConsec = [1;find((diff(inCircle))>1);max(colourRight)];
%                 consec = diff(nonConsec);
%                 firstConsec_inCircle(matching) = total{j,i}.(2)(prevIndex+inCircle(nonConsec(find(consec>9,1))));
%             else
%                 firstConsec_inCircle(matching) = -1;
%             end
%             
%             
%             % finding 10 consecutive values for colourRight
%             if(colourRight~=999)
%                 % When there are two ones, the index shifts and get wrong
%                 % time. Or when numbers in isolation
%                 nonConsec = [1;find((diff(colourRight))>1);max(colourRight)];
%                 consec = diff(nonConsec);
%                 firstConsec_colourRight(matching) = total{j,i}.(2)(prevIndex+colourRight(nonConsec(find(consec>9,1))));
%             else
%                 firstConsec_colourRight(matching) = -1;
%             end

        end
        
        location_first(j,i) = n_matched(j,i) - colourFirst;
        location_first_percentage(j,i) = 100*(n_matched(j,i) - colourFirst)/n_matched(j,i);
        
        first_locations{j,i} = firstConsec_inCircle;
        first_colours{j,i} = firstConsec_colourRight;
            
        for k=1:(length(total{j,i}.(6))-10) %no of rows
            %blue_moving
            if (abs((total{j,i}.(9)(k) - (mean(total{j,i}.(9)(k:k+10)))))> 0.1) ...
                    || (abs((total{j,i}.(10)(k) - (mean(total{j,i}.(10)(k:k+10)))))> 0.1)
                blue(j,i)= blue(j,i)+1;
            end
            %green_moving
            if (abs((total{j,i}.(12)(k) - (mean(total{j,i}.(12)(k:k+10)))))> 0.1) ...
                    || (abs((total{j,i}.(13)(k) - (mean(total{j,i}.(13)(k:k+10)))))> 0.1)
                green(j,i)= green(j,i)+1;
            end
            %red_moving
            if (abs((total{j,i}.(15)(k) - (mean(total{j,i}.(15)(k:k+10)))))> 0.1) ...
                    || (abs((total{j,i}.(16)(k) - (mean(total{j,i}.(16)(k:k+10)))))> 0.1)
                red(j,i)= red(j,i)+1;
            end
            %red and green
            if ((abs((total{j,i}.(15)(k) - (mean(total{j,i}.(15)(k:k+10)))))> 0.1) ...
                    || (abs((total{j,i}.(16)(k) - (mean(total{j,i}.(16)(k:k+10)))))> 0.1)) ...
                    && ((abs((total{j,i}.(12)(k) - (mean(total{j,i}.(12)(k:k+10)))))> 0.1) ...
                    || (abs((total{j,i}.(13)(k) - (mean(total{j,i}.(13)(k:k+10)))))> 0.1))
                red_green(j,i)= red_green(j,i)+1;
            end
            %red and blue
            if ((abs((total{j,i}.(9)(k) - (mean(total{j,i}.(9)(k:k+10)))))> 0.1) ...
                    || (abs((total{j,i}.(10)(k) - (mean(total{j,i}.(10)(k:k+10)))))> 0.1)) ...
                    && ((abs((total{j,i}.(15)(k) - (mean(total{j,i}.(15)(k:k+10)))))> 0.1) ...
                    || (abs((total{j,i}.(16)(k) - (mean(total{j,i}.(16)(k:k+10)))))> 0.1))
                red_blue(j,i)= red_blue(j,i)+1;
            end
            %green and blue
            if ((abs((total{j,i}.(9)(k) - (mean(total{j,i}.(9)(k:k+10)))))> 0.1) ...
                    || (abs((total{j,i}.(10)(k) - (mean(total{j,i}.(10)(k:k+10)))))> 0.1)) ...
                    && ((abs((total{j,i}.(12)(k) - (mean(total{j,i}.(12)(k:k+10)))))> 0.1) ...
                    || (abs((total{j,i}.(13)(k) - (mean(total{j,i}.(13)(k:k+10)))))> 0.1))
                green_blue(j,i)= green_blue(j,i)+1;
            end
            
            
%                if total(j,i).(4)(k)>0
%                    location_first (j+i,(matching+1)) = location_first(1,(matching+1))+1
%                end
%                 colour_first(1,n_matched+1) = n_matched - location_first(1,n_matched+1);
%                 
%             end
            
        end
    end
end

% first_locations{3,1}
% first_colours{3,1}

end
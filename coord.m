function [location_first, colourFirst, first_locations, first_colours] = coord(total)

location_first = zeros(size(total));
n_matched  = zeros(size(total));
location_first = zeros(size(total));
location_first_percentage = zeros(size(total));
first_locations = cell(size(total));
first_colours = cell(size(total));

%for j=1:size(total,1) %11
for j=3:3 %11
    %for i=1:size(total,2) %4
    for i=1:1 %4
        
        n_matched(j,i) = max(total{j,i}.(5));
        
        %move inside or match colour first
        colourFirst = 0;
        %for skipped targets
        firstConsec_inCircle = -1*ones(1,n_matched(j,i));
        firstConsec_colourRight = -1*ones(1,n_matched(j,i));
        for matching = 1:n_matched(j,i)
        %for matching = 3:3
            matching
            idxs = total{j,i}.(5) == matching;
            inCircle = find(total{j,i}.(4)(idxs,:));
            colourRight = find(total{j,i}.(3)(idxs,:));
            
            if(length(inCircle)>1 || length(colourRight)>1)
                % Put all the code here
            elseif(length(inCircle)==1)
                firstConsec_inCircle(matching) = total{j,i}.(2)(prevIndex+inCircle);
            elseif(length(colourRight)==1)
                firstConsec_colourRight(matching) = total{j,i}.(2)(prevIndex+colourRight);
            end
            
            if(matching>1)
                prevIndex = max(find(total{j,i}.(5) == (matching-1)))
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
            
            % finding 10 consecutive values for inCircle
            if(inCircle~=999)
                nonConsec = [1;find((diff(inCircle))>1);max(inCircle)];
                if(nonConsec(2)==1)
                    nonConsec = nonConsec(2:end);
                end
                consec = diff(nonConsec);
                firstConsec_inCircle(matching) = total{j,i}.(2)(prevIndex+inCircle(1+nonConsec(find(consec>9,1))));
                
%                 if(nonConsec(2)==1)
%                     nonConsec = nonConsec(2:end)
%                     consec = diff(nonConsec)
%                     find(consec>9,1)
%                     nonConsec(find(consec>9,1))
%                     firstConsec_inCircle(matching) = total{j,i}.(2)(1+prevIndex+inCircle(nonConsec(find(consec>9,1))));
%                 else
%                     nonConsec
%                     consec = diff(nonConsec)
%                     find(consec>9,1)
%                     nonConsec(find(consec>9,1))
%                     firstConsec_inCircle(matching) = total{j,i}.(2)(prevIndex+inCircle(nonConsec(find(consec>9,1))));
%                 end
                
            else
                firstConsec_inCircle(matching) = -1;
            end
            
            
            % finding 10 consecutive values for colourRight
            if(colourRight~=999)
                % When there are two ones, the index shifts and get wrong
                % time. Or when numbers in isolation
                nonConsec = [1;find((diff(colourRight))>1);max(colourRight)];
                if(nonConsec(2)==1)
                    nonConsec = nonConsec(2:end);
                end
                consec = diff(nonConsec);
                firstConsec_colourRight(matching) = total{j,i}.(2)(prevIndex+colourRight(1+nonConsec(find(consec>9,1))));
                
            else
                firstConsec_colourRight(matching) = -1;
            end

        end
        
        location_first(j,i) = n_matched(j,i) - colourFirst;
        location_first_percentage(j,i) = 100*(n_matched(j,i) - colourFirst)/n_matched(j,i);
        
        first_locations{j,i} = firstConsec_inCircle;
        first_colours{j,i} = firstConsec_colourRight;
            
    end
end

% first_locations{3,1}
% first_colours{3,1}

end
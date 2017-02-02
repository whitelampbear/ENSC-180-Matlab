%output = AUTO_PLOT (e...   *** finish the help comments ***
% ... The figure
% handle is returned.

% Student Name 1: student1

% Student 1 #: 123456781

% Student 1 userid (email): stu1 (stu1@sfu.ca)

% Student Name 2: student2

% Student 2 #: 123456782

% Student 2 userid (email): stu2 (stu2@sfu.ca)

% Below, edit to list any people who helped you with the assignment, 
%      or put ‘none’ if nobody helped (the two of) you.

% Helpers: _everybody helped us/me with the assignment (list names or put ‘none’)__


function output = auto_plotnew(equation)
    syms x
    dy = diff(equation);
    ddy = diff(equation, 2);
    dddy = diff(equation, 3);
    [~,denomKeep] = numden(equation);
    
    %grabbing critcal points, keeping only the real solution
    critPoints = double(solve(dy==0,x));
    critPoints = double(critPoints(imag(critPoints)==0));
    
    %sort real critical points into either locMax or locMin
    critArray = double(subs(ddy,'x',critPoints));
    minP = critPoints(critArray>0);
    maxP = critPoints(critArray<0);

    inflectionP = double((solve(ddy==0,x)));  
    inflectionP = double(inflectionP(imag(inflectionP)==0));
    
    %Vertical Asymptote
    if mod(denomKeep,1) == 0
        vertAsym = [];
    else
        vertAsym = unique(double(solve(denomKeep==0)));
    end
    
    %Horizontal Asymptote
    horzAsym = limit(equation, inf);
    
    % Beginning of a long journey
    interestingPoints = unique([maxP; minP; inflectionP;]);
    nInterestingPoints = length(interestingPoints);
    largestIntP = max(interestingPoints);
    smallestIntP = min(interestingPoints);
    defaultLimits = 20*pi;
    
    if nInterestingPoints == 0
        ezplot(equation)
        hold on;
%         xlim([-defaultLimits defaultLimits]);
        xlim auto;
        ylim auto;
        
    elseif nInterestingPoints == 1
        ezplot(equation)
        hold on;
%         xlim([smallestIntP-defaultLimits largestIntP+defaultLimits]);
        xlim auto;
        ylim auto;
        
    elseif nInterestingPoints > 1
        ezplot(equation)
        hold on;
        lengthoflimits = abs(smallestIntP) + abs(largestIntP);
        newLength = ((lengthoflimits/0.7) - lengthoflimits)/2;
        xlimminimum = smallestIntP - newLength;
        xlimMaximum = largestIntP + newLength;
%         xlim([xlimminimum xlimMaximum])
        xlim auto;
        ylim auto;
        
    else
    end
        plotLocMax = plot(maxP, double(subs(equation,maxP)),'or');
        plotLocMin = plot(minP, double(subs(equation,minP)),'bo');
        plotInflP = plot(inflectionP, double(subs(equation,inflectionP)),'go');
        plotVertAsym = plot(vertAsym, double(subs(equation,vertAsym)),'kx');
        plotHorzAsym = plot(0, horzAsym, 'rx');
        hold off;

%       PLOTS: INTERESTING POINTS
%     ezplot(equation);   hold on;
%     plotLocMax = plot(maxP, double(subs(equation,maxP)),'or');
%     plotLocMin = plot(minP, double(subs(equation,minP)),'bo');
%     plotInflP = plot(inflectionP, double(subs(equation,inflectionP)),'go');
%     plotVertAsym = plot(vertAsym, double(subs(equation,vertAsym)),'kx');
%     plotHorzAsym = plot(0, horzAsym, 'rx');
%       /PLOTS: INTERESTING POINTS
%     
%     
%       CATEGORIZING INTERESTING POINTS
%     interestingPoints = unique([maxP; minP; inflectionP;]);
%     largestIntP = max(interestingPoints);
%     smallestIntP = min(interestingPoints);
%     
%       /CATEGORIZING INTERESTING POINTS
%     
%     
%       LIMITS
%     if numel(interestingPoints) == 0
%         xlim([-20*pi 20*pi])
%     else %numel(interestingPoints) >= 1
%         naturalLength = abs(largestIntP) + abs(smallestIntP);
%         additiveLength = (naturalLength/0.7)/2;
%         lowerxlim = smallestIntP - additiveLength;
%         upperxlim = largestIntP - additiveLength;
%         if lowerxlim == upperxlim
%            xlim auto
%         else 
%         end
%         
%     elseif numel(interestingPoints) > 1
%         xlim([-20*pi-smallestIntP 20*pi+largestIntP])
%     end
%     ylim auto
%     title(char(equation))
%     xlabel('x value')
%     ylabel('y value')
%       /LIMITS    
%     
%       LEGEND
%     
%       /LEGEND
%     output = gcf;
end
%output = Q2 
%   Plot the required equation with its first and second derivatives, 
%   local maxima, local minima, inflection points, and vertical asymptotes.  
%   The figure handle is returned.

% Student Name 1: student1

% Student 1 #: Minji Ju

% Student 1 userid (email): stu1 (stu1@sfu.ca)

% Student Name 2: Jia Jun Li

% Student 2 #: 301238737

% Student 2 userid (email): jjl39@sfu.ca

% Below, edit to list any people who helped you with the assignment, 
%      or put �none� if nobody helped (the two of) you.

% Helpers:

function output = Q2
%equations
syms x;
y = (2*x^4-x^2+x-1)/(x^2-2);
dy = diff(y);
ddy = diff(y,2);

ph1 = ezplot(y); hold on;
ph2 = ezplot(dy);
ph3 = ezplot(ddy);

%grab all the critical points
critPoints = double((solve(dy==0,x)));
critPoints2 = double((solve(ddy==0,x)));

critPoints = [critPoints; critPoints2];
realSolutions = double(critPoints(imag(critPoints)==0));

%from realSolutions sort them into categorize
for idx = 1:numel(realSolutions)
    element = realSolutions(idx);
    denom = x^2-2;
    
    syms x
    y = (2*x^4-x^2+x-1)/(x^2-2); 
    ddy = diff(y,2);
    
    y = subs(y,x,element);
    ddy = subs(ddy,x,element);

        if ddy <= 1.00E-5 && ddy >= -1.00E-5 %inflection: congruent with the certainty of realSolutions array
            ph4 = plot(element,y,'go') %inflectionP = [inflectionP; element]
            continue
        elseif ddy > 0 %minima
            ph5 = plot(element,y,'bo')
            continue
        elseif ddy < 0 %maxima
            ph6 = plot(element,y,'ro')
            continue
        else
        end
end


ph7 = plot(unique(double(solve(denom))),0,'kx'); %vert. asym.


xlim([-3 3]);
ylim([-200 200]); 
% title({char(y)})
xlabel('x value')
ylabel('y value')
grid on;

legend([ph1(1), ph2(1), ph3(1), ph6(1), ph5(1), ph4(1), ph7(1)], ...
        'y', 'dy', 'ddy', 'Maxima', 'Minima', 'Infelction Point', 'Vert. Asymptotes');

output = gcf;
end


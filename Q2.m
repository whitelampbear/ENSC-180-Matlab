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
%plots of y, dy, ddy
syms x;
y = (2*x^4-x^2+x-1)/(x^2-2);
dy = diff(y);
ddy = diff(y,2);

ph0 = ezplot(y); hold on;
ezplot(dy);
ezplot(ddy);

xlim([-3 3]);
ylim([-200 200]); 
grid on;
legend('y', 'dy', 'ddy');

%grab all the critical points
critPoints = double((solve(dy==0,x)));
critPoints2 = double((solve(ddy==0,x)));

critPoints = [critPoints; critPoints2];
realSolutions = double(critPoints(imag(critPoints)==0));
inflectionP = [];
maximaP = [];
minimaP = [];

%from realSolutions sort crical points
for idx = 1:numel(realSolutions)
    element = realSolutions(idx);
    denom = x^2-2;
    
    syms x
    y = (2*x^4-x^2+x-1)/(x^2-2); 
    ddy = diff(y,2);
    
    y = subs(y,x,element);
    ddy = subs(ddy,x,element);

        if ddy <= 1.00E-5 && ddy >= -1.00E-5 %inflection: congruent with the certainty of realSolutions array
            inflectionP = [inflectionP; element];
            continue
        elseif ddy > 0 %minima
            minimaP = [minimaP; element];
            continue
        elseif ddy < 0 %maxima
            maximaP = [maximaP; element];
            continue
        else
            hold off;
        end
end

%plotting time baby
ph1 = plot(inflectionP,y,'go');
ph2 = plot(maximaP,y,'ro');
plot(minimaP,y,'bo');
plot(unique(double(solve(denom))),0,'kx');

legend([ph0(1), ph1(1), ph2(1)], 'y', 'Inflection Point', 'Maxima');

output = gcf;
end
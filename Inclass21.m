%In class 21
clear all; close all
% 1. Consider the system we discussed in class for a gene which is produced
% and degraded: dx/dt = k - d*x. Now consider that this gene turns on a
% second gene y, which also degrades so that its equation is 
% dy/dt = k2*x - d2*y. Choose some values for k,d,k2, and d2 and run a
% numerical simulation of this system for the case where both genes start
% out off ( x(0) = 0 and y(0) = 0). Plot the value of x and y in time and 
% explain your results. 
k = 2;
d = 2;
k2 = 20; 
d2 = 20;
rhs1 = @(t,x) [k-d*x(1); k2*x(1) - d2*x(2)];
sol = ode23(rhs1, [0 10], [0, 0]);
figure(1)
plot(sol.x, sol.y(1, :)); 
hold on;
plot(sol.x, sol.y(2, :));
legend("k - d*x", "k2*x - d2*y");
hold off;
%both approach 1 as an asymptote, with k-dx being slightly ahead

% 2. Consider the following model: 
% dx/dt = y
% dy/dt = (1-x^2)*y - x
% write code that simulates this system for several different starting
% values of x and y. Plot the results and comment on them. 

rhs2 = @(t,x) [x(2); (1-x(1)^2)*x(2) - x(1)];
figure(2)
for ii = 1:10
    x1 = randi(25);
    y1 = randi(25);
    sol = ode23(rhs2, [0 100], [x1, y1]);
    plot(sol.x, sol.y(1,:)); 
    hold on;
    plot(sol.x, sol.y(2,:));
end
hold off;
%each curve eventually reaches zero and then oscillates around zero, but
%how fast it takes for the line to reach zero initially varies (based on if
%x is larger than y?)
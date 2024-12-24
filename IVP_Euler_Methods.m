% Initial Value Problem (IVP): Solving Using Euler's and Improved Euler's Methods
% Author: Mani Majd
% Source: ESC103 2021 Exam
% Date: November 2024
% Description:
%   This script solves a second-order IVP using Euler's Method (EM) and Improved Euler's Method (IEM).
%   It also compares the numerical results with the analytical solution.

%% Parameters
y0 = -9; % Initial value of y
y_prime0 = 0; % Initial value of y'
A = [0, 1; -19/4, -10]; % State-space representation matrix
T = 10; % Total time
N_values = [45, 55, 75, 100, 250]; % Different values of N

%% Solve and Plot for Different N
for i = 1:length(N_values)
    N = N_values(i);
    
    % Solve using EM, IEM, and Analytical solution
    [t_EM, y_EM] = EMsolver(A, y0, y_prime0, T, N);
    [t_IEM, y_IEM] = IEMsolver(A, y0, y_prime0, T, N);
    [t_anal, y_anal] = analytical(T, N);
    
    % Plot results
    figure(i);
    hold on;
    plot(t_EM, y_EM, '-', 'LineWidth', 1.25, 'DisplayName', ['EM solution, N = ' num2str(N)]);
    plot(t_IEM, y_IEM, '-', 'LineWidth', 1.25, 'DisplayName', ['IEM solution, N = ' num2str(N)]);
    plot(t_anal, y_anal, '-', 'LineWidth', 1.25, 'DisplayName', 'Analytical solution');
    title(['Solution to y(t), EM vs IEM (N = ' num2str(N) ')']);
    xlabel('Time');
    ylabel('y(t)');
    legend('Location', 'best');
    hold off;
end

%% Functions

% Euler's Method Solver
function [t, y] = EMsolver(A, y0, y_prime0, T, N)
    dt = T / N;
    t = 0:dt:T;
    SOL = nan(2, length(t));
    SOL(:, 1) = [y0; y_prime0];
    
    for i = 2:length(t)
        SOL(:, i) = SOL(:, i-1) + dt * A * SOL(:, i-1);
    end
    
    y = SOL(1, :);
end

% Improved Euler's Method Solver
function [t, y] = IEMsolver(A, y0, y_prime0, T, N)
    dt = T / N;
    t = 0:dt:T;
    SOL = nan(2, length(t));
    SOL(:, 1) = [y0; y_prime0];
    
    for i = 2:length(t)
        k1 = dt * A * SOL(:, i-1);
        k2 = dt * A * (SOL(:, i-1) + k1);
        SOL(:, i) = SOL(:, i-1) + 0.5 * (k1 + k2);
    end
    
    y = SOL(1, :);
end

% Analytical Solution
function [t, y] = analytical(T, N)
    dt = T / N;
    t = 0:dt:T;
    y = (-19/2) * exp(-t / 2) + (1/2) * exp(-19/2 * t);
end
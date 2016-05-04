%PLOT_EXAMPLE   Example script of plot generation for ERCOFTAC report.

%% Data to plot: change as needed.
x = linspace(0, 1, 1000);
y = randn(numel(x), 1);
z = 2 * rand(numel(x), 1) - 1;

%% Plotting commands as usual: change as needed.
figure
plot(x, y, x, z)
grid on

%% Add-ons.
fontsize = 10; % To match the report font, approximately.

% Use LaTeX font whenever possible.
xlabel('$t$', 'Interpreter', 'Latex')
ylabel('$x$', 'Interpreter', 'Latex')

% Title and legend if needed.
title('Random time series: $x_n$ and $x_u$', ...
    'Interpreter', 'Latex', 'FontSize', fontsize);
l = legend('Random normal: $x_n$', 'Uniform random: $x_u$');
set(l, 'Interpreter', 'Latex', 'Location', 'Best', 'FontSize', fontsize - 1)

%% Set options and print.
set(gca, 'FontSize', fontsize) % Set axis label font size.
set(gcf, 'PaperPositionMode', 'auto') % Print as it appears on the screen.

% The 3rd value is the width, and the 4th is the height.  A width of 265 is
% about perfect for having two figures side-by-side in the report.
set(gcf, 'Position', [100, 100, 265, 200])

print -depsc test % Print as color EPS.  Be sure to print to figures/.
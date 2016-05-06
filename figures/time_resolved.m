%TIME_RESOLVED  Create time-resolved simulation plots.

%% Parallel equation.
load ../../codes/ModelProblems/parallel/data/mu0_pi2_gamma_0.28.mat

w = w(:, 1:1200);
ks_plotxt(x, w, dt)
axis([-1, 1, 0, 0.6, -200, 200])
set(gca, 'CameraPosition', [0 0.3 3464.10161513775])

fontsize = 10; % To match the report font, approximately.
colorbar
colormap(zeroed_colormap(min(w(:)), max(w(:))))

% Use LaTeX font whenever possible.
xlabel('$x$', 'Interpreter', 'Latex')
ylabel('$t$', 'Interpreter', 'Latex')

set(gca, 'FontSize', fontsize) % Set axis label font size.
set(gca, 'Position', [0.14, 0.14, 0.64, 0.84])
set(gcf, 'PaperPositionMode', 'auto') % Print as it appears on the screen.

% The 3rd value is the width, and the 4th is the height.  A width of 265 is
% about perfect for having two figures side-by-side in the report.
set(gcf, 'Position', [100, 100, 239, 200])

xl = xlim;
yl = ylim;

text(xl(1) - 0.2 * (xl(2) - xl(1)), ...
    yl(2) - 0.01 * (yl(2) - yl(1)), ...
    '(a)', ...
    'Interpreter', 'Latex')

print -dpng -r600 xt_parallel

%% Nonparallel equation.
load ../../codes/ModelProblems/nonparallel/data/gamma1_mu3.95.mat

clf
w = w_fem(:, 1:1500);
ks_plotxt(x_fem, w, dt_fem)
axis([-20, 100, 0, 150, -200, 200])
set(gca, 'CameraPosition', [40 75 3464.10161513775])
colorbar
colormap(zeroed_colormap(min(w(:)), max(w(:))))

% Use LaTeX font whenever possible.
xlabel('$x$', 'Interpreter', 'Latex')
ylabel('$t$', 'Interpreter', 'Latex')

set(gca, 'FontSize', fontsize) % Set axis label font size.
set(gca, 'Position', [0.15, 0.14, 0.63, 0.84])
set(gcf, 'PaperPositionMode', 'auto') % Print as it appears on the screen.
set(gcf, 'Position', [100, 100, 239, 200])

xl = xlim;
yl = ylim;
text(xl(1) - 0.22 * (xl(2) - xl(1)), ...
    yl(2) - 0.01 * (yl(2) - yl(1)), ...
    '(b)', ...
    'Interpreter', 'Latex')

print -dpng -r600 xt_nonparallel
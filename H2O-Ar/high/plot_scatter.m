clc;
clear;

tbl = readtable('H2O-Ar-high-results.csv');
tbl

tbl.V_err = tbl.V - tbl.V_pred;

hold on;

scatter(tbl.V, tbl.V_err * 1.0e+03, 10, 'blue', 'filled', 'o');
set(gca, 'LineWidth', 1.5, 'FontSize', 15, 'FontName', 'Times', ...
    'FontWeight', 'bold');
xlim([-0.1, 1.1]);   % eV
ylim([-2.5, 2.5])
yticks(-2.5:0.5:2.5);
xlabel('Ab Initio Energy (eV)', 'FontSize', 18);
ylabel('Fitting Error (meV)', 'FontSize', 18);

xtickformat('%.1f');
ytickformat('%.1f');

text(0.7, 1.5, '(e) high-level', 'FontSize', 18, 'FontName', 'Times', ...
    'FontWeight', 'bold');

ax = gca;
exportgraphics(ax, 'H2O-Ar-high-scatter.png', 'Resolution', 600);

hold off;

close all;

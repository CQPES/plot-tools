clc;
clear;

tbl = readtable('CH3CN-cqpes-results.csv');
tbl

tbl.V_err = tbl.V - tbl.V_pred;

hold on;

scatter(tbl.V, tbl.V_err * 1.0e+03, 10, 'blue', 'filled', 'o');
set(gca, 'LineWidth', 1.5, 'FontSize', 15, 'FontName', 'Times', ...
    'FontWeight', 'bold');
xlim([-0.5, 16.0]);   % eV
ylim([-150.0, 150.0]);  % meV
xticks(0: 2.5: 15);
yticks(-150: 50: 150.0);
xlabel('Ab Initio Energy (eV)', 'FontSize', 18);
ylabel('Fitting Error (meV)', 'FontSize', 18);

xtickformat('%.1f');
ytickformat('%.1f');

text(9.8, 100, '(c) CH_3CN', 'FontSize', 18, 'FontName', 'Times', ...
    'FontWeight', 'bold');

ax = gca;
exportgraphics(ax, 'CH3CN-scatter.png', 'Resolution', 600);

hold off;

close all;

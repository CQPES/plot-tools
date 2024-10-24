clc;
clear;


tbl = readtable('OH-CH3OH-cqpes-results.csv');
tbl

tbl.V_err = tbl.V - tbl.V_pred;

hold on;

scatter(tbl.V, tbl.V_err * 1.0e+03, 10, 'blue', 'filled', 'o');
set(gca, 'LineWidth', 1.5, 'FontSize', 15, 'FontName', 'Times', ...
    'FontWeight', 'bold');
xlim([-2.0, 6.0]);   % eV
ylim([-1000.0, 1000.0]); % meV
yticks(-1000:250:1000.0);
xlabel('Ab Initio Energy (eV)', 'FontSize', 18);
ylabel('Fitting Error (meV)', 'FontSize', 18);

xtickformat('%.1f');
ytickformat('%.1f');

text(3.0, 650, '(e) OH + CH_3OH', 'FontSize', 18, 'FontName', 'Times', ...
    'FontWeight', 'bold');

ax = gca;
exportgraphics(ax, 'OH-CH3OH-scatter.png', 'Resolution', 600);

hold off;

close all;

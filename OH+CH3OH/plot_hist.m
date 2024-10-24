clc;
clear;


tbl = readtable('OH-CH3OH-cqpes-results.csv');
tbl

tbl.V_err = tbl.V - tbl.V_pred;

hold on;

edges = 0.0:10.0:100.0;
histogram(abs(tbl.V_err) * 1.0e+03, edges, 'Normalization', 'probability');
set(gca, 'LineWidth', 1.5, 'FontSize', 15, 'FontName', 'Times', ...
    'FontWeight', 'bold');
xlabel('Fitting Error (meV)', 'FontSize', 18);
ylabel('Distribution', 'FontSize', 18);
xlim([0, 100.0])
ylim([0, 1.0])

ytickformat('%.1f')

text(60.0, 0.85, '(f) OH + CH_3OH', 'FontSize', 18, 'FontName', 'Times', ...
    'FontWeight', 'bold');

hold off;

ax = gca;
exportgraphics(ax, 'OH-CH3OH-PIP-NN-dist.png', 'Resolution', 600);

close all;

clc;
clear;

tbl = readtable('CH4-cqpes-results.csv');
tbl

tbl.V_err = tbl.V - tbl.V_pred;

hold on;

edges = 0.0: 0.5: 5.0;
histogram(abs(tbl.V_err) * 1.0e+03, edges, 'Normalization', 'probability');
set(gca, 'LineWidth', 1.5, 'FontSize', 15, 'FontName', 'Times', ...
    'FontWeight', 'bold');
xlabel('Fitting Error (meV)', 'FontSize', 18);
ylabel('Distribution', 'FontSize', 18);
xlim([0, 5.0])
ylim([0, 1.0])

text(3.2, 0.85, '(b) CH_4', 'FontSize', 18, 'FontName', 'Times', ...
    'FontWeight', 'bold');

hold off;

ax = gca;
exportgraphics(ax, 'CH4-PIP-NN-dist.png', 'Resolution', 600);

close all;

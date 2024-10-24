clc;
clear;


tbl = readtable('H2O-Ar-low-results.csv');
tbl

tbl.V_err = tbl.V - tbl.V_pred;

hold on;

edges = [0.0:0.01:0.1];
histogram(abs(tbl.V_err) * 1.0e+03, edges, 'Normalization', 'probability');
set(gca, 'LineWidth', 1.5, 'FontSize', 15, 'FontName', 'Times', ...
    'FontWeight', 'bold');
xlabel('Fitting Error (meV)', 'FontSize', 18);
ylabel('Distribution', 'FontSize', 18);
xlim([0, 0.1])
ylim([0, 1.0])

text(0.07, 0.85, '(b) low-level', 'FontSize', 18, 'FontName', 'Times', ...
    'FontWeight', 'bold');

hold off;

ax = gca;
exportgraphics(ax, ['H2O-Ar-low-dist.png'], 'Resolution', 600);

close all;

clc;
clear;
close all;


tbl = readtable('high-low.csv');
tbl


hold on;

scatter(tbl.high_low, tbl.low, 10, 'red', 'filled', 'o');
set(gca, 'LineWidth', 1.5, 'FontSize', 15, 'FontName', 'Times', ...
    'FontWeight', 'bold');

xlim([-0.08, 0.08]);  % eV
ylim([-0.05, 1.2]);

xtickformat('%.2f');
ytickformat('%.1f');

xlabel('V_{high} - V_{low} (eV)', 'FontSize', 18);
ylabel('V_{low} (eV)', 'FontSize', 18);

text(0.04, 1.1, '(a)', 'FontSize', 18, 'FontName', 'Times', ...
    'FontWeight', 'bold');

ax = gca;
exportgraphics(ax, 'H2O-Ar-low-scatter.png', 'Resolution', 600);

hold off;

close all;

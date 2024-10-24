clc;
clear;

tbl = readtable("CH4-cqpes-results.csv");
tbl

tbl.V_err = tbl.V - tbl.V_pred;

hold on;

scatter(tbl.V, tbl.V_err * 1.0e+03, 10, 'blue', 'filled', 'o');
set(gca, 'LineWidth', 1.5, 'FontSize', 15, 'FontName', 'Times', ...
    'FontWeight', 'bold');
xlim([-0.5, 7.0]);   % eV
ylim([-100.0, 100.0]);  % meV
yticks(-100: 25: 100.0);
xlabel('Ab Initio Energy (eV)', 'FontSize', 18);
ylabel('Fitting Error (meV)', 'FontSize', 18);

xtickformat("%.1f");
ytickformat("%.1f");

text(4.5, 75, '(a) CH_4', "FontSize", 18, "FontName", "Times", ...
    "FontWeight", "bold");

ax = gca;
exportgraphics(ax, 'CH4-scatter.png', 'Resolution', 600);

hold off;

close all;

clear;
clc;
close all;

tbl_all = readtable('Ar_O.csv');
tbl_selected = readtable('Ar_O_selected.csv');

tbl_all
tbl_selected

hold on;

scatter(tbl_all.Ar_O, tbl_all.low, 10, 'blue', 'filled', 'o');
scatter(tbl_selected.Ar_O, tbl_selected.low, 10, 'red', 'filled', 'o');
set(gca, 'LineWidth', 1.5, 'FontSize', 15, 'FontName', 'Times', ...
    'FontWeight', 'bold');

xlim([1.5, 11.5]);
ylim([-0.1, 1.2]);

xlabel('r(Ar–O) (Å)', 'FontSize', 18);
ylabel('V_{low} (eV)', 'FontSize', 18);

xtickformat('%.1f');
ytickformat('%.1f');

legend(['All', 'Selected'], 'Location', 'northeast', 'FontSize', 18);
legend('boxoff');

text(8.5, 1.1, '(b)', 'FontSize', 18, 'FontName', 'Times', ...
    'FontWeight', 'bold');

ax = gca;
exportgraphics(ax, 'H2O-Ar-bondlength.png', 'Resolution', 600);

hold off;

close all;
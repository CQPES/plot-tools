clc;
clear;
close all;


tbl = readtable('active_learning.csv');
tbl


hold on;

plot(tbl.N_data, tbl.RMSE_mean .* 1.0e+03, 'ro-', LineWidth=2);
plot(tbl.N_data, tbl.RMSE_min .* 1.0e+03, 'bo-', LineWidth=2);
set(gca, 'LineWidth', 1.5, 'FontSize', 15, 'FontName', 'Times', ...
    'FontWeight', 'bold');

xlim([0, 2100]);
ylim([-0.05, 2.75]);

xtickformat('%.2f');
ytickformat('%.1f');

xlabel('N_{data}', 'FontSize', 18);
ylabel('RMSE (meV)', 'FontSize', 18);

text(1450, 2.5, '(c)', 'FontSize', 18, 'FontName', 'Times', ...
    'FontWeight', 'bold');

legend('Mean', 'Min', 'FontSize', 18);
legend('boxoff');

ax = gca;
exportgraphics(ax, 'active-learning.png', 'Resolution', 600);

hold off;

close all;

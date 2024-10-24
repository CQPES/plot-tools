clear;
clc;
close all;

t_cqpes = [0.33, 1.23, 3.67];  % h
t_matlab = [1.08, 6.06, 27.66];  % h

epoch_cqpes = [1000, 211, 486];
epoch_matlab = [1000, 117, 607];

hold on;

X = categorical({'CH_4', 'CH_3CN', 'OH + CH_3OH'});
X = reordercats(X, {'CH_4', 'CH_3CN', 'OH + CH_3OH'});

b = bar(X, [t_matlab; t_cqpes]');

xtips1 = b(2).XEndPoints;
ytips1 = b(2).YEndPoints;
acc = t_matlab ./ t_cqpes;
labels1 = [];
for a = acc
    labels1 = [labels1, string(sprintf('%.1fx', a))];
end

text(xtips1, ytips1, labels1, 'HorizontalAlignment', 'center', ...
    'VerticalAlignment', 'bottom', 'FontSize', 15, 'FontName', 'Times', ...
    'FontWeight', 'bold', 'Color', 'r')

ylabel('Fitting Time (h)', 'FontSize', 18);
ylim([0, 30.0]);

legend(['MATLAB', 'CQPES'], Location='northwest');
legend('boxoff');

set(gca, 'LineWidth', 1.5, 'FontSize', 15, 'FontName', 'Times', ...
    'FontWeight', 'bold');

ax = gca;
exportgraphics(ax, 'time.png', 'Resolution', 600);

hold off;

close all;

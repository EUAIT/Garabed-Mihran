% MATLAB script to create a chart with two y-axes

t = linspace(0, 10, 100);
y1 = sin(t);
y2 = cos(t);

figure;
ax1 = axes;
h1 = plot(t, y1, 'g-');
ax1.XColor = 'k';
ax1.YColor = 'g';
hold on;

ax2 = axes;
h2 = plot(t, y2, 'b-');
ax2.Position = ax1.Position;
ax2.Color = 'none';
ax2.XColor = 'none';
ax2.YColor = 'b';
ax2.YAxisLocation = 'right';

xlabel('Time (s)');
ylabel(ax1, 'Sin');
ylabel(ax2, 'Cos');
title('Dual Y-Axis Chart');

legend([h1, h2], {'Sin Wave', 'Cos Wave'});

saveas(gcf, 'dual_y_axis_chart.png');

% Setting up the random seed for reproducibility
rng(0);

% Generating random data
x = rand(1000, 1) * 0.3; % Scientific Benefit
y = rand(1000, 1) * 25000; % Lifecycle cost (scaled to match the image)
z = rand(1000, 1) * 2; % The color scale for 'interference' level

% Creating the scatter plot
figure;
scatter(x, y, 15, z, 'filled'); % The '15' here is the size of the markers
colormap('hot'); % Using the 'hot' colormap
caxis([min(z), max(z)]); % Setting the limits of the color axis to match the data range

% Adding the colorbar on the right
colorbar;
c = colorbar;
c.Label.String = 'Interference level';

% Adding labels and title
xlabel('Scientific Benefit');
ylabel('Lifecycle cost ($FY10M)');
title('Interfering instrument pairs');

% MATLAB automatically displays the plot, so no need for a show command
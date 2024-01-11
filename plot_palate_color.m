function plot_palate_color(x,y,z,label_x,label_y,label_color,label_title)
    disp("start plot_palate_color")
    % Generating random data
    %x = rand(1000, 1) * 0.3; % Scientific Benefit
    %y = rand(1000, 1) * 25000; % Lifecycle cost (scaled to match the image)
    %z = rand(1000, 1) * 2; % The color scale for 'interference' level
    hold off;
    % Creating the scatter plot
    figure;
    hold on;
    scatter(x, y, 15, z, 'filled'); % The '15' here is the size of the markers
    colormap('hot'); % Using the 'hot' colormap
    caxis([min(z), max(z)]); % Setting the limits of the color axis to match the data range

    % Adding the colorbar on the right
    colorbar;
    c = colorbar;
    c.Label.String = label_color;

    % Adding labels and title
    xlabel(label_x);
    ylabel(label_y);
    title(label_title);
    hold off;

    % MATLAB automatically displays the plot, so no need for a show command
end
function Gamestate = snake_ui

    % loads in the snake menu_image and puts it in a figure
    menu_screen = imread('snakegame.png');
    figure('Name','Menu: Snake','NumberTitle','off');
    present = image(xlim, ylim, menu_screen);
    axis off;
    Gamestate = "START";

    % test bounds for x and y, the start button
    % tl = 0.2983, 0.8179
    % tr = 0.6694, 0.8238
    % bl = 0.2959, 0.9582
    % br = 0.6719, 0.9613

    % test bounds for x and y, the x button
    % tl = 0.8262, 0.0391
    % tr = 0.9760, 0.0887
    % bl = 0.9046, 0.0158
    % br = 0.8931, 0.1646
    
    while (1)
        click = ginput(1);
        x = click(1);
        y = click(2);

        % if the start button is clicked continue
        if (x <= 0.6719 && x >= 0.2983 && y <= 0.9613 && y >= 0.8179)
            break;
        % if the x is clicked, send the signal to end the game
        elseif (x <= 0.9760 && x >= 0.8262 && y <= 0.1646 && y >= 0.0158)
            close all;
            Gamestate = "OFF";
            break;
        end
    end

    close all;
 end
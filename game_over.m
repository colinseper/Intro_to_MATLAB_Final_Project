function  Gamestate = game_over(Gamestate)
    if Gamestate ~= "OFF"
        % edit endscreen depending on the user result
        if Gamestate ~= "GAMEOVER(W)"
            end_screen = imread('Game_Over(L).png');
        else
            end_screen = imread('Game_Over(W).png');
        end
    
        %test bounds for x and y, yes
        % tl = 0.2384, 0.7608
        % tr = 0.4650, 0.7608
        % bl = 0.2420, 0.9081
        % br = 0.4631, 0.9104
        
        % test bounds for x and y, no
        % tl = 0.5774, 0.7608
        % tr = 0.7395, 0.7608
        % bl = 0.5792, 0.9128
        % br = 0.7359, 0.9128
    
        % same ideas as snake_ui
        figure('Name','End Screen: Snake','NumberTitle','off');
        present = image(xlim, ylim, end_screen);
        axis off;
    
        while (1)
            click = ginput(1);
            x = click(1);
            y = click(2);
    
            if (x <= 0.4650 && x >= 0.2384 && y <= 0.9104 && y >= 0.7608)
                break;
            elseif (x <= 0.7395 && x >= 0.5774 && y <= 0.9128 && y >= 0.7068)
                Gamestate = "OFF";
                break;
            end
        end
    
        close all;
    end
end
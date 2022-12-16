function [Gamestate, snake, apple] = board_setup(Gamestate)
    % sets default parameters for snake and apple so function returns 
    % properly
    snake = 0;
    apple = 0;

    % if the user didn't click the x
    if Gamestate ~= "OFF"

        % set the axis bounds
        ub = 20;
        lb = 1;
        
        % 1 = green, 2 = blue, 3 = red
        colormap([144/255 238/255 144/255; 0 0 1; 1 0 0]);
        
        % plot a random starting point for the snake
        snake = randi([lb, ub], [1,2]);
        
        % ensures the point isn't the same as the start of the snake
        while(1)
            apple = randi([lb, ub], [1,2]);

            if ~isequal(snake, apple)
                break;
            end
        end
    end   
end
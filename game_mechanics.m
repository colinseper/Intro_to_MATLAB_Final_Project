function Gamestate = game_mechanics(Gamestate, snake, apple)

    if Gamestate ~= "OFF"

        % initializes variables
        global key;
        dir = "";
        key = "";

        % sets click function to run when the current figure is up 
        % and a key is pressed
        set(gcf, 'KeyPressFcn', @click, 'color', 'w');

        % sets length of the snake and of the board
        snake_len = 1;
        len = 20;
        replace = 0;
        
        % starts the game
        while (1)

            % clears the board and plots the apple
            map = ones(len, len);
            map(apple(1), apple(2)) = 3;

            % plot snake
            for i = 1:snake_len
                map(snake(i,1), snake(i,2)) = 2;
            end 

            % update the board and score
            image(map);
            title('Score: ', num2str(snake_len - 1));
            axis off;
            pause(0.075);

            % if the snake eats the apple add to its length 
            % and check if game is won
            if snake(1,:) == apple
                 snake_len = snake_len + 1;
                 replace = 1;

                 if snake_len == 400
                     Gamestate = "GAME OVER(W)";
                 end
            end

            % sets the direction of the snakes movement
            if key == "uparrow" && dir ~= "DOWN"
                dir = "UP";
            elseif key == "downarrow" && dir ~= "UP"
                dir = "DOWN";
            elseif key == "rightarrow" && dir ~= "LEFT"
                dir = "RIGHT";
            elseif key == "leftarrow" && dir ~= "RIGHT"
                dir = "LEFT";
            end

            % replaces snake block with the block before it, with the 
            % exception of the first block
            snake(2:snake_len, :) = snake(1:snake_len - 1, :);

            % adjusts head based on direction of movement
            if dir == "UP"  
                snake(1, 1) = snake(1, 1) - 1;
            elseif dir == "DOWN" 
                snake(1, 1) = snake(1, 1) + 1;
            elseif dir == "LEFT" 
                snake(1, 2) = snake(1, 2) - 1;
            elseif dir == "RIGHT"
                snake(1, 2) = snake (1, 2) + 1;
            end

            % checks if snake is outside of border or hits itself
            if (snake(1,1) < 1 || snake(1,1) > len) || ...
                    (snake(1,2) < 1 || snake(1,2) > len) ...
                    || ismember(snake(1,:), snake(2:end,:), 'rows')
                Gamestate = "GAME OVER(L)";
            end
            
            % if the apple is the same as a snake position, reposition 
            % until it isn't
            while(replace)
                apple = randi([1, len], [1,2]);
                dup = find(apple == snake(:,:), 1);
            
                if isempty(dup) == 1 || snake_len == 400
                    replace = 0;
                    break;
                end
            end

            % if the game is over exit the game
            if Gamestate ~= "START"
                close all;
                break;
            end
        end
    end
end
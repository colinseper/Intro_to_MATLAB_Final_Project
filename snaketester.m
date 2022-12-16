% initializes Gamestate to be used in the while loop
Gamestate = "";

% allows the game to be played as much as the user wants
while Gamestate ~= "OFF"
    state = snake_ui;
    [Gamestate, snake, apple] = board_setup(state);
    Gamestate = game_mechanics(Gamestate, snake, apple);
    Gamestate = game_over(Gamestate);
end
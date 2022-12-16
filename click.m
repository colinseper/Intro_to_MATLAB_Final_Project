% registers keypresses from the computer
function click(src, event)

    % defines global variable
    global key;

    % event.Key is key pressed down on the keyboard
    key = event.Key;
end
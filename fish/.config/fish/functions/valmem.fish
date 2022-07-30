function valmem -d "Use Valgrind to check for memory leaks"
    valgrind --leak-check=yes --track-origins=yes $argv
end

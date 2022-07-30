function playmovie -d "Play a video file with ffplay. Includes a timestamp box in HH:MM::SS"
    # format.
    set expected_argc 1
    set actual_argc (count $argv)
    if test $actual_argc -ne $expected_argc
        echo "error, playmovie requires $expected_argc arguments only $actual_argc given."
        echo "usage: playmovie INPUT_FILE"
        echo "Play a video file with ffplay."
        echo -e "\tINPUT_FILE\n\t\tInput video file name (extension included)."
    else
        ffplay -vf "drawtext=text='%{pts\:hms}':box=1:x=(w-tw)/2:y=h-(2*lh)" $argv
    end
end

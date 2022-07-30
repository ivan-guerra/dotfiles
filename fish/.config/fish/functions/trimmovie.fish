function trimmovie -d "Crop the input video file"
    set expected_argc 4
    set actual_argc (count $argv)
    if test $actual_argc -ne $expected_argc
        echo "error, trimmovie requires $expected_argc arguments only $actual_argc given."
        echo "usage: trimmovie INPUT_FILE OUTPUT_FILE START_TIME END_TIME"
        echo "Crop the input video file."
        echo -e "\tINPUT_FILE\n\t\tInput video file name (extension included)."
        echo -e "\tOUTPUT_FILE\n\t\tOutput video file name (extension included)."
        echo -e "\tSTART_TIME\n\t\tSnippet start time in HH:MM:SS format."
        echo -e "\tEND_TIME\n\t\tSnippet end time in HH:MM:SS format."
    else
        ffmpeg -i $argv[1] -ss $argv[3] -to $argv[4] -c:v copy -c:a copy $argv[2]
    end
end

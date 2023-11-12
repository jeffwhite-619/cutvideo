# cutvideo

Quick and (very) dirty ffmpeg utility to slice video files

## DO NOT USE THIS UTILITY!! YOU ARE SUPER DERP IF YOU DO!!!!

By default, this script will replace the input video file with the sliced output video. If a different output file path is provided, the original is still deleted. This works great for my current needs but may be devastating for you. Hence, the disclaimer.

Implementing a `delete` or `keep` optional argument has many consequences of its own, so I'm not dealing with that right now. In this initial commit, please keep in mind that the script was written for use in the current working directory. It has not been tested with full paths, and will probably break until I get around to that.

This script is also biased towards cutting off the end of a video. It supports specifying a starting position, but the start is an optional argument, while the ending position is not. In the future, I could see handling an either/or requirement, but just know that it's super hacky right now.

Also know that the script arguments are not yet "actually" required. However, defaults have only been set for start position and video format, so if you omit these "required" flags below, you're gonna have a bad time, mmkay? I promise I'll get that crap worked in later.

Required arguments:
    - `-i|--in`       INPUT FILE      The input video filename
    - `-t|--to`       END POSITION    The position in the video to end the cut, format=hh:mm:ss

Optional arguments:
    - `-s|--start`    START POSITION  The position in the video to start the cut
    - `-f|--format`   VIDEO FORMAT    Video format for conversion, default=00:00:00
    - `-o|--out`      OUTPUT FILE     The output video filename, default=INPUT FILE

## TODOs

- validate required/optional arguments
- fix support for full paths (and all the fun that goes with checking for beginning and trailing slashes)
- auto-escape filename arguments (so you don't have to manually add slashes which is super annoying)
- implement & restrict format types (ffmpeg does a crap job of figuring out that a video is mp4 just from the extension, so for right now I'm passing it the video format separately and I haven't tested it with anything but mp4 yet)
- figure out some kind of delete or keep option so you plebes don't have to backup your video file before maiming yourself with this footgun of a script
- make either start or end position required (which requires a solution for a default end position)
- help flag
- exit trap?
- less dirty/stupid tempfile name

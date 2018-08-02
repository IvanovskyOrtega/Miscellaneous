# Video2Gif Converter
A simple video to GIF converter using OpenCV (for video capture) and imageio (for GIF creation). 

## Usage
You can instatiate an object of the Video2Gif class with the following format:
```
v2g = Video2Gif(video_file,output_gif,num_frames,duration,frame_step,start_time)
```
Where
* *video_file*: The path to the video file (supported formats are described in the OpenCV documentation).
* *output_gif*: The name of the GIF that'll be generated
* *num_frames*: The number of frames to be read.
* *duration*: The duration of each frame in the GIF (in seconds).
* *frame_step*: The number of miliseconds in which the next frame  will be taken.
* *start_time*: The start position to begin capturing frames (in miliseconds).

Then use 
```
v2g.create_gif()
```
And (if success) the GIF will be created :)

import cv2
import imageio
import sys
import os

class Video2Gif:
    
    def __init__(self, video_file, output_gif, num_frames, duration, frame_step, start_time):
        self.video_file = video_file
        self.output_gif = output_gif
        self.num_frames = num_frames
        self.frames = []
        self.frame_step = frame_step
        self.start_time = start_time
        self.duration = duration

    def get_frames(self):
        count = 0
        video = cv2.VideoCapture(self.video_file)
        success = True
        for i in range(0, self.num_frames):
            video.set(cv2.CAP_PROP_POS_MSEC,(self.start_time+(count*self.frame_step)))
            success, frame = video.read()
            cv2.imwrite("frames\\frame%d.jpg" % count, frame)
            if success:
                self.frames.append("frames\\frame%d.jpg" % count)
                count = count + 1
        print(count, ' frames were successfully read.')

    def create_gif(self):
        if not  os.path.exists("frames"):
            os.mkdir("frames")
        self.get_frames()
        images = []
        for frame in self.frames:
            images.append(imageio.imread(frame))
        imageio.mimsave(self.output_gif, images, duration=self.duration)

if __name__ == '__main__':
    video_file = sys.argv[1]
    output_gif = sys.argv[2]
    num_frames = int(sys.argv[3])
    duration = float(sys.argv[4])
    frame_step = int(sys.argv[5])
    start_time = int(sys.argv[6])
    v2g = Video2Gif(video_file,output_gif,num_frames,duration,frame_step,start_time)
    v2g.create_gif()
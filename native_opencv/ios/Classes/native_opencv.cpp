#include <string>
#include <vector>
#include <opencv2/core.hpp>
#include <opencv2/videoio.hpp>
#include <opencv2/imgproc.hpp>  // cv::Canny()
#include  <stdint.h>
//Unable to locate header
#include <opencv2/dlib/image_processing/frontal_face_detector.h>
// #include <pytracker/gaze_tracking.hpp>

using namespace std;
using namespace cv;

//using namespace pytracker;

extern "C"
  __attribute__((visibility("default"))) __attribute__((used))
  int32_t * process (const char * filename) {

    //dlib::frontal_face_detector _face_detector=dlib::get_frontal_face_detector();
    vector<int> result;
    cv::String f = filename;
    VideoCapture video(f);

    //gaze_tracking gaze;
    Mat frame;
    int count = 0;
    while (true) {
      bool ret = video.read(frame);
      if (count < 6) {
        result.push_back(count);
        //ptr[count] = count;
        count++;
      } else {

      //if (!ret || count >10) {
        //int [] blah = {1,2,3,4,5,6,7,8,9,0};
        //return blah;
        //memcpy(ptr, result.data(), result.size() * sizeof(int));
        int * ptr = new int[result.size()];
        for (int i = 0; i < result.size(); i++) {
            ptr[i] = result[i];
        }
        return ptr;
      }
    }
  }
      //count++;

      //result.push_back(count);
      // We send this frame to GazeTracking to analyze it
      // gaze.refresh(frame);
    //}
  //}

  //int main (int argc, char * * argv) {
    //string s = "filename.mov";
   // int * result = process(s.c_str());
  //}



/*
extern "C" __attribute__((visibility("default"))) __attribute__((used))
int32_t native_add(int32_t x, int32_t y) {
    return x + y;
}
*/
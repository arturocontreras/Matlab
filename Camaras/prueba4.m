vid1 = videoinput('winvideo', 1);
vid2 = videoinput('winvideo', 2);
start([vid1 vid2]);
handles.axes1 = subplot(1,2,1);
axes(handles.axes1);
handleToImageInAxes1 = image(zeros(800,600));
preview(vid1, handleToImageInAxes1);
handles.axes2 = subplot(1,2,2);
axes(handles.axes2);
handleToImageInAxes2 = image(zeros(800,600));
preview(vid2, handleToImageInAxes2);
D = disparity(vid1,vid2)
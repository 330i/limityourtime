import cv2 as cv
from datetime import datetime
from tkinter import *
window = Tk()
video =cv.VideoCapture(0)
window.wm_title("Limit Your Time")
frontalFaceDetector=cv.CascadeClassifier('haarcascade_frontalface_default.xml')
keepGoing=True
totalSeconds=0
startTime=[]
endTime=[]
activeStatus = [True]
def startLoop():
    l1.config(text='Session Started')
    global keepGoing
    keepGoing=True
    startTime.append(datetime.now())
def main():
    if keepGoing:
        active=activeStatus[len(activeStatus)-1]
        ImageRead, image = video.read()
        grayImage=cv.cvtColor(image, cv.COLOR_BGR2GRAY)
        faces = frontalFaceDetector.detectMultiScale(grayImage)
        facePresent = len(faces)>0
        if active and facePresent:
            pass
        elif (not active) and (not facePresent):
            pass
        elif active and (not facePresent):
            activeStatus.append(False)
            endTime.append(datetime.now())
        elif (not active) and facePresent:
            activeStatus.append(True)
            startTime.append(datetime.now())
    window.after(1000, main)
def endLoop():
    l1.config(text='Session ended')
    window.destroy()
    global keepGoing
    keepGoing=False
    endTime.append(datetime.now())
    totalSeconds=0
    for (start, end) in zip(startTime, endTime):
        difference=end-start
        totalSeconds+=difference.total_seconds()
    video.release()
    cv.destroyAllWindows()
    print(totalSeconds)
startButton=Button(window, text="Start", width=20, command=startLoop)
startButton.grid(row=0, column=0)
endButton=Button(window, text="End", width=20, command=endLoop)
endButton.grid(row=0, column=1)
l1=Label(window, text="")
l1.grid(row=1, column=0, columnspan=2)
window.after(1000, main)
window.mainloop()

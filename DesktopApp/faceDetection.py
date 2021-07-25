import cv2 as cv
from datetime import datetime
from datetime import timedelta
from tkinter import *
window = Tk()
video =cv.VideoCapture(0)
window.wm_title("Limit Your Time")
faceDetector=cv.CascadeClassifier('haarcascade_frontalface_default.xml')
keepGoing=False
totalSeconds=0
startTime=[]
endTime=[]
activeStatus = [True]
def startLoop():
    l1.config(text='Session Started')
    global keepGoing
    keepGoing=True
    startTime.append(datetime.now())
def pauseLoop():
    global sessionStoped
    sessionStoped= False
    l1.config(text='Session paused')
    endTime.append(datetime.now())
    breaks.append(True)
def main():
    if keepGoing:
        active=activeStatus[len(activeStatus)-1]
        ret, frame = video.read()
        convertGrey = cv.cvtColor(frame, cv.COLOR_BGR2GRAY)
        face = faceDetector.detectMultiScale(convertGrey, 1.2, 5)
        facePresent = len(face)>0
        for (x, y, w, h) in face:
            cv.rectangle(frame, (x, y), (x+w, y+h), (0, 255, 0), 2)
        cv.imshow('Face Detection', frame)
        if active and facePresent:
            pass
        elif (not active) and (not facePresent):
            pass
        elif active and (not facePresent):
            activeStatus.append(False)
            if len(startTime)!=0:
                if datetime.now()-startTime[-1]>timedelta(minutes=5):
                    endTime.append(datetime.now())
        elif (not active) and facePresent:
            activeStatus.append(True)
            if len(endTime)!=0:
                if startTime[-1]<endTime[-1]:
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
    print('Start Time: ' + str(startTime))
    print('End Time: ' + str(endTime))
    print('Breaks: ' + str(len(endTime)-1))
    print(str(totalSeconds)+' seconds')
startButton=Button(window, text="Start", width=20, command=startLoop)
startButton.grid(row=0, column=0)
pauseButton = Button(window, text='Pause', width=15, command=pauseLoop)
pauseButton.grid(row=0, column=1)
endButton=Button(window, text="End", width=20, command=endLoop)
endButton.grid(row=0, column=2)
l1=Label(window, text="")
l1.grid(row=1, column=0, columnspan=3)
window.after(1000, main)
window.mainloop()
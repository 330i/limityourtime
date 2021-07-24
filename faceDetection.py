import cv2 as cv
from datetime import datetime
from tkinter import *
window = Tk()
video =cv.VideoCapture(0)
window.wm_title("Limit Your Time")
frontalFaceDetector=cv.CascadeClassifier('haarcascade_frontalface_default.xml')
keepGoing=True
sessionStoped=False
totalSeconds=0
startTime=[]
endTime=[]
breaks =[]
activeStatus = [True]
def startLoop():
    l1.config(text='Session Started')
    global keepGoing
    keepGoing=True
    global sessionStoped
    sessionStoped=False
    startTime.append(datetime.now())
def pauseLoop():
    global sessionStoped
    sessionStoped= False
    l1.config(text='Session paused')
    endTime.append(datetime.now())
    breaks.append(True)
def main():
    if keepGoing:
        if not sessionStoped:
            active=activeStatus[len(activeStatus)-1]
            ImageRead, image = video.read()
            grayImage=cv.cvtColor(image, cv.COLOR_BGR2GRAY)
            faces = frontalFaceDetector.detectMultiScale(grayImage)
            facePresent = len(faces)>0
            rightNow=datetime.now()
            if active and facePresent:
                pass
            elif (not active) and (not facePresent):
                pass
            elif active and (not facePresent) and (rightNow-startTime[-1])>timedelta(seconds=10):
                activeStatus.append(False)
                endTime.append(datetime.now())
            elif (not active) and facePresent and (rightNow-endTime[-1])>timedelta(seconds=5):
                activeStatus.append(True)
                startTime.append(datetime.now())
    window.after(2000, main)
def endLoop():
    l1.config(text='Session ended')
    window.destroy()
    global keepGoing
    keepGoing=False
    if sessionStoped==False:
        endTime.append(datetime.now())
    totalSeconds=0
    for (start, end) in zip(startTime, endTime):
        difference=end-start
        totalSeconds+=difference.total_seconds()
    video.release()
    cv.destroyAllWindows()
    print('Total Time: '+str(totalSeconds))
    print('Number of breaks: '+str(len(breaks)))
startButton=Button(window, text="Start", width=15, command=startLoop)
startButton.grid(row=0, column=0)
pauseButton = Button(window, text='Pause', width=15, command=pauseLoop)
pauseButton.grid(row=0, column=1)
endButton=Button(window, text="End", width=15, command=endLoop)
endButton.grid(row=0, column=2)
l1=Label(window, text="")
l1.grid(row=1, column=0, columnspan=3)
window.after(1000, main)
window.mainloop()

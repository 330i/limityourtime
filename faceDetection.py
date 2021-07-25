import cv2 as cv
from datetime import datetime
from datetime import timedelta
from tkinter import *
import tkinter.simpledialog
import tkinter.messagebox
window = Tk()
video =cv.VideoCapture(0)
window.wm_title("Limit Your Time")
frontalFaceDetector=cv.CascadeClassifier('haarcascade_frontalface_default.xml')
minBreakTime=5#in minutes
keepGoing=True
sessionStoped=False
totalSeconds=0
startTime=[]
endTime=[]
breaks =[]
activeStatus = [True]
def displayTime(seconds):
    hours=int(seconds/3600)
    minutes=int((seconds-hours*3600)/60)
    if seconds-hours*3600-minutes*60>=30:
        minutes+=1
    return str(hours)+" "+str(minutes)
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
            elif len(startTime)==0:
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
    for i in range(0, len(endTime)-2):
        if startTime[i+1]-startTime[i]>timedelta(minutes=minBreakTime):
            breaks.append(True)
    video.release()
    cv.destroyAllWindows()
    breaksNumber=len(breaks)
    timeOutput=displayTime(totalSeconds)
    spaceIndex=timeOutput.find(' ')
    hoursNumber=timeOutput[0:spaceIndex]
    minutesNumber=timeOutput[(spaceIndex+1):len(timeOutput)]
    infoStatement='Hours: '+str(hoursNumber)+' Minutes: '+str(minutesNumber)+ ' Breaks: '+str(len(breaks))
    print(infoStatement)
startButton=Button(window, text="Start", width=15, command=startLoop)
startButton.grid(row=0, column=0)
pauseButton = Button(window, text='Pause', width=15, command=pauseLoop)
pauseButton.grid(row=0, column=1)
endButton=Button(window, text="End", width=15, command=endLoop)
endButton.grid(row=0, column=2)
l1=Label(window, text="Press Start")
l1.grid(row=1, column=0, columnspan=3)
window.after(1000, main)
window.mainloop()

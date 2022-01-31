
#Add seconds to your time
def CalculateTimeAdd(timeOriginal,seconds):
   result = TimeToSeconds(timeOriginal) + int(seconds)
   result = SecondsToTime(result)
   print("当前时间戳为:", result)
   return result

#Subtract seconds to your time
def CalculateTimeSub(timeOriginal,seconds):
   result = TimeToSeconds(timeOriginal) - int(seconds)
   result = SecondsToTime(result)
   print("当前时间戳为:", result)
   return result

#Translate time to seconds
def TimeToSeconds(timeOriginal):
   if timeOriginal != '0':
      timeArry= timeOriginal.strip().split(":")

      #If time doesn't have hour attribute 
      if len(timeArry) == 2:
         timeOriginal = "0:" + timeOriginal

      h,m,s = timeOriginal.strip().split(":")
      result= int(h) * 3600 + int(m) * 60 + int(s)
      return result
   else:
      return 0

#Translate seconds to time      
def SecondsToTime(timeOriginal):   
   h = timeOriginal // 3600;
   m = timeOriginal % 3600 // 60;
   s = timeOriginal % 60;   
   
   if h < 10:
      if h != 0:
         h =  "0" + str(h)
   if m < 10:
      m =  "0" + str(m)
   if s < 10:
      s =  "0" + str(s)
   if h == 0:
      result= str(m) + ":" + str(s)
   else:
      result= str(h) +":" + str(m) + ":" + str(s)
   print(result)
   return result

#Wether the two strings are equal
def TwoStringEqual(str1, str2):
   if str1.strip  == str2.strip :
      return True
   return False

#Return the num of the string
def GetNumOfString(data, num):
   if len(data) < int(num):
      return data
   else:
      return data[0 : int(num)]

#GetNumOfString("Aelius Maximus Decimus Meridius was a high ranking Roman general",10)
#SecondsToTime(32501)
#CalculateTime("1:1:20","59")
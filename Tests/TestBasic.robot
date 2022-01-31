*** Settings ***
Library  AppiumLibrary
Library  BuiltIn
Library  Process
Library  ../Extension/GTVLibrary.py



*** Variables ***
${data}    Aelius Maximus Decimus Meridius was a high ranking Roman general
${timeAdd}    00:50
*** Test Cases ***
Example
    #${result}  CalculateTimeAdd     ${timeAdd}    10
    #${result}  CalculateTimeSub     ${timeAdd}    10
    #t2s   ${timeAdd}
    #TwoStringEqual    240p    240p
    #Get Num Of String    ${data}     10
    #Aelius Maximus Decimus Meridius was a high ranking Roman general







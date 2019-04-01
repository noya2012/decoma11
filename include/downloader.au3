#NoTrayIcon
#include-once

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <FontConstants.au3>
#include <TrayConstants.au3>
#include <MsgBoxConstants.au3>
#include <Process.au3>
#include <Misc.au3>
#include <Timers.au3>
#include <FileConstants.au3>
#include <WinAPIFiles.au3>
#include "GIFAnimation.au3"
#include <WinAPI.au3>
#include <Sound.au3>
#include <MetroGUI_UDF.au3>
#include <file.au3>
#include <AutoItConstants.au3>
#include <DateTimeConstants.au3>
#include <Date.au3>
#include <String.au3>

#pragma compile(Out, Apagado y Reinicio Automatico RC.exe)
#pragma compile(Icon, C:\Users\manue\Downloads\Capture10.ico)
#pragma compile(Compatibility, Windows 7 / 8/ 8.1/ 10)
#pragma compile(CompanyName, 'Next Generation Technologies of Phoenix.')
#pragma compile(FileVersion, 3.0.2.0, 11.15.2017)
#pragma compile(FileDescription, Este Programa es Gratuito y NO Tiene Garantias.)

$Spanish = False

If _Singleton("Por Manuel Hernandez", 1) = 0 Then


    Exit
EndIf

If Not StringRight(@OSLang, 2) = "09" Or Not StringRight(@OSLang, 2) = "0a" Then

    MsgBox(0, "Warning", "Sorry!" & @CRLF & "Your System's Languaje is not supported by this application!!", 0)
    Exit

EndIf

$laguage = StringRight(@OSLang, 2)

If $laguage = "0a" Then $Spanish = True

Select

    Case (@OSVersion = "WIN_10")

    Case (@OSVersion = "WIN_8")

    Case (@OSVersion = "WIN_81")

    Case (@OSVersion = "WIN_7")

    Case (@OSVersion = "WIN_VISTA")

    Case Else

        If $Spanish = True Then
            MsgBox($MB_TOPMOST, "Aviso!", "Tu OS es: " & @OSVersion & " el cual no es compatible con esta version del programa :(", 0)
            Exit

        Else

            MsgBox($MB_TOPMOST, "Warning!", "Your OS is: " & @OSVersion & " which is not compatible with this version of the program :(", 0)
            Exit
        EndIf

        ;Else

EndSelect



Global $Abort
Global $Restart
Global $Shutdown
Global $Month = @MON
Global $TimeSplit2[7] = ["cero", "uno", "dos", "tres", "cuatro", "cinco", "seis"]
Global $MonthNumberInDP = ""
Global $InputTime = ""
Global $AlarmTime = ""
Global $Tiempo = ""
Global $timer = ""
Global $Form1 = ""
Global $Form2 = ""
Global $Check1 = ""
Global $Checked = False
Global $Update = False
Global $aAlarmTime = ""
Global $idComboBox = ""
Global $Dia = ""
Global $Hora = ""
Global $Hora2 = ""
Global $ExactDay = ""
Global $ExactYear = ""
Global $ExactMonth = ""
Global $iDateCalc = ""
Global $anosdiff = ""
Global $MesesDff = ""
Global $DiasDiff = ""
Global $Ditails = False
Global $DitailsLabel = ""
Global $Ditailslabel2 = ""
Global $AlarmLabel = ""
Global $Name = ""
Global $Yearslabel = ""
Global $Monthslabel = ""
Global $Dayslabel = ""
Global $Datelabel = ""
Global $aboutLabel = ""
Global $Contactlabel = ""
Global $Updatelabel = ""
Global $Exitlabel = ""
Global $ProductNamelabel = ""
Global $VersionLabel = ""
Global $Label3label = ""
Global $Label4label = ""
Global $Label5label = ""
Global $Label6label = ""
Global $VersionLabellabel = ""
Global $YesNoContactlabel = ""
Global $Warninglabel = ""
Global $Decidedlabel = ""
Global $formulario3label1 = ""
Global $formulario3label2 = ""
Global $formulario3label3 = ""
Global $formulario3label4 = ""
Global $formulario3label5 = ""
Global $formulario3botonlabel = ""
Global $formulario3botonlabel2 = ""
Global $Sendingmessage = ""
Global $messagesent = ""
Global $Utility = ""
Global $EmailError = ""
Global $error = ""
Global $errorCode = ""
Global $Description = ""
Global $Menulabel = ""
Global $select = ""
Global $selecttime = ""
Global $AlarmTimeminutes = ""
Global $selectalarmtime = ""
Global $advertencia = ""
Global $thesystem = ""
Global $thesystem2
Global $Thetimeyouinput = ""
Global $whichisless = ""
Global $youinput = ""
Global $TimeSplit = ""
Global $time = ""
Global $youinput = ""
Global $Which = ""
Global $and = ""
Global $with = ""
Global $Hoursand = ""
Global $minutesand = ""
Global $secondsof = ""
Global $theEstimated = ""
Global $anoo = ""
Global $Mes = ""
Global $Diaa = ""
Global $msgbox = ""
Global $HoraSplit[4]

; Setting Time Variables
$15s = 15000
$30s = 30000
$45s = 45000
$1m = 60000
$1mm = 90000
$2m = 120000
$3m = 180000
$5m = 300000
$10m = 600000
$15m = 900250
$30m = 1800500
$45m = 2700750
$1h = 3601000
$1hm = 5401500
$2h = 7202000
$2hm = 9002500
$3h = 10803000
$3hm = 12603500
$4h = 14404000
$4hm = 16204500
$5h = 18005000
$5hm = 19805500
$6h = 21606000
$6hm = 23406500
$7h = 25207000
$8h = 28808000
$9h = 32409000
$12h = 43212000
$15h = 54015000
$18h = 64818000
$24h = 86424000





If $Spanish = True Then Spanish()


Func Spanish()



    If @MON = 01 Then $Month = "Enero"

    If @MON = 02 Then $Month = "Febrero"

    If @MON = 03 Then $Month = "Marzo"

    If @MON = 04 Then $Month = "Abril"

    If @MON = 05 Then $Month = "Mayo"

    If @MON = 06 Then $Month = "Junio"

    If @MON = 07 Then $Month = "Julio"

    If @MON = 08 Then $Month = "Agosto"

    If @MON = 09 Then $Month = "Septiembre"

    If @MON = 10 Then $Month = "Octubre"

    If @MON = 11 Then $Month = "Noviembre"

    If @MON = 12 Then $Month = "Deciembre"

    Global $Months[12] = ["01 Enero", "02 Febrero", "03 Marzo", "04 Abril", "05 Mayo", "06 Junio", "07 Julio", "08 Agosto", "09 Septiembre", "10 Octubre", "11 Noviembre", "12 Diciembre"]

    $InputTime = "Ingrese el Tiempo  ==>"

    $AlarmTime = "Tiempo de Alarma   =>"

    $Abort = "Abortar"

    $Restart = "Reiniciar"

    $Shutdown = "Apagar"

    $Ditailslabel2 = "Detalles"

    $AlarmLabel = "Alarma"

    $DitailsLabel = "? Detalles ?"

    $Name = "Apagado y Reinicio Automatico"

    $VersionLabellabel = "Versi車n RC"

    $Yearslabel = "A?os"

    $Monthslabel = "Meses"

    $Dayslabel = "Dias"

    $Datelabel = "Horas, Minutos y Segundos: "

    $aboutLabel = "Acerca de"
    $Contactlabel = "Contacto"
    $Updatelabel = "Actualizar"
    $Exitlabel = "Salir"

    $ProductNamelabel = "Producto: Utilidad de Apagado y Reinicio Automatico RC"
    $VersionLabel = "Versi車n 3.0.2.0, 11.15.2017"
    $Label3label = "Comentarios: Este Programa es Gratuito, Si Pag車 Alguna Cantidad de Dinero Exija su Devolucion"
    $Label4label = "Sugerencias: Mande sus Sugerecias a: manuelcipote31@gmail.com"
    $Label5label = "Derechos Reservados: Todos los derechos Reservados 2017 - 2021"
    $Label6label = "Autor: Manuel Hern芍ndez"

    $YesNoContactlabel = "Mande sus Sugerecias o Inquietudes a: manuelcipote31@gmail.com" & @LF & "Le Gustaria Mandarme un Email Ahora?" & @LF & "Presione 'Yes' para Mandarlo Ahora Mismo."
    $Warninglabel = "Aviso"
    $Decidedlabel = "Desidio no mandar E-mail"

    $formulario3label1 = "Llene el formulario"
    $formulario3label2 = "Presione 'Cancelar' para anular o  Presione 'Listo!' para enviar"
    $formulario3label3 = "Escriba su Nombre"
    $formulario3label4 = "Escriba su E-mail"
    $formulario3label5 = "Escriba un Mensaje"
    $formulario3botonlabel = "Listo!"
    $formulario3botonlabel2 = "Cancelar"
    $Utility = "Utilidad"
    $Sendingmessage = "Enviando tu Mensaje!..."
    $messagesent = "Mensaje Enviado!"
    $EmailError = "Error mandando el mensaje!"
    $errorCode = "Codigo de Error:"
    $Description = "Descripci車n"

    $Menulabel = "men迆"
    $select = "Seleccione"
    $selecttime = "Seleccione el Tiempo"
    $AlarmTimeminutes = "15 Segundos|30 Segundos|45 Segundos|1 Minuto|1 Minuto y Medio|2 Minutos|3 Minutos"
    $selectalarmtime = "No ha Seleccionado Tiempo de Alarma!" & @LF & "Seleccione Tiempo de Alarma o Apague El Switch (Alarma)"

    $advertencia = "Advertencia"
    $thesystem = "El Sistema Reiniciara en:"
    $thesystem2 = "El Sistema se Apagara en:"

    $Thetimeyouinput = "El tiempo que ingreso es invalido!" & @LF & "Usted ingreso: "
    $whichisless = " el cual es menor que: "

    $youinput = "Usted ingreso:  "
    $Which = " el cual es  "
    $and = " y "
    $with = " con "
    $Hoursand = " horas y "
    $minutesand = " minutos y "
    $secondsof = " segundos de diferencia de "
    $theEstimated = "El tiempo estimado es: "

    $anoo = " a?o, "
    $Mes = " mes "
    $Diaa = " dia "
EndFunc   ;==>Spanish


If $Spanish = False Then English()


Func English()


    If @MON = 01 Then $Month = "January"

    If @MON = 02 Then $Month = "February"

    If @MON = 03 Then $Month = "March"

    If @MON = 04 Then $Month = "April"

    If @MON = 05 Then $Month = "May"

    If @MON = 06 Then $Month = "June"

    If @MON = 07 Then $Month = "July"

    If @MON = 08 Then $Month = "August"

    If @MON = 09 Then $Month = "September"

    If @MON = 10 Then $Month = "October"

    If @MON = 11 Then $Month = "November"

    If @MON = 12 Then $Month = "December"

    Global $Months[12] = ["01 January", "02 February", "03 March", "04 April", "05 May", "06 June", "07 July", "08 August", "09 September", "10 October", "11 November", "12 December"]

    $Abort = "Abort"

    $Restart = "Restart"

    $Shutdown = "Shutdown"

    $Ditailslabel2 = "Details"

    $AlarmLabel = "Alarm"

    $InputTime = "Input Time  ==> ==>"

    $AlarmTime = "Alarm Time   ==> ==>"

    $DitailsLabel = "? Details ?"

    $Name = "Automatic Shutdown and Restart"

    $VersionLabellabel = "RC Version"

    $Yearslabel = "Years"

    $Monthslabel = "Months"

    $Dayslabel = "Days"

    $Datelabel = "Hours, Minutes and Seconds: "

    $aboutLabel = "About"
    $Contactlabel = "Contact"
    $Updatelabel = "Update"
    $Exitlabel = "Exit"

    $ProductNamelabel = "Product Name: Automatic Shutdown and Restart Utility RC"
    $VersionLabel = "Version 3.0.2.0, 11.15.2017"
    $Label3label = "Comments: This Software is totally free, If You Paid Any Money Ask For A Refund"
    $Label4label = "Suggestions: Send Your Suggestions to: manuelcipote31@gmail.com"
    $Label5label = "Copyrights: All Rights Reserved 2017 - 2021"
    $Label6label = "Author: Manuel Hern芍ndez"

    $YesNoContactlabel = "Send Your Suggestions or Concerns to: manuelcipote31@gmail.com" & @LF & "Would You Like to Send us an Email Right Now?" & @LF & "Press 'Yes' to Send it Right Now."
    $Warninglabel = "Warning"
    $Decidedlabel = "You've Decided not to send an E-mail"

    $formulario3label1 = "Fill the form"
    $formulario3label2 = "Press 'Cancel' to cancel or  Press 'Ready!' to send"
    $formulario3label3 = "Write Your Name"
    $formulario3label4 = "Write your E-mail"
    $formulario3label5 = "Write a Menssaje"
    $formulario3botonlabel = "Ready!"
    $formulario3botonlabel2 = "Cancel"
    $Utility = "Utility"
    $Sendingmessage = "Sending Your Message!..."
    $messagesent = "Menssage Sent!"
    $EmailError = "Error sending message!"
    $errorCode = "Error Code:"
    $Description = "Description"

    $Menulabel = "menu"
    $select = "Select"
    $selecttime = "Select Time"
    $AlarmTimeminutes = "15 Seconds|30 Seconds|45 Seconds|1 Minute|1 Minute and 1/2|2 Minutes|3 Minutes"
    $selectalarmtime = "You haven't selected the alarm time!" & @LF & "Select the alarm time or turn off the switch (Alarm)"

    $advertencia = "Warning"
    $thesystem = "The System will Restart in:"
    $thesystem2 = "The System will Shutdown in:"

    $Thetimeyouinput = "The Time you input is invalid!" & @LF & "You input: "
    $whichisless = " which is less than: "

    $youinput = "You input:  "
    $Which = " which is   "
    $and = " and "
    $with = " with "
    $Hoursand = " hours and "
    $minutesand = " minutes with "
    $secondsof = " seconds of difference of "
    $theEstimated = "The estimated time is: "

    $anoo = " year, "
    $Mes = " month "
    $Diaa = " day "

EndFunc   ;==>English


$WorkingPath = @TempDir & "\Mannyfresh" & Random(100000, 999999, 1) ; Unique directory.

$creardir = DirCreate($WorkingPath)



If $creardir = 1 Then


Else

    MsgBox(0, "Aviso", "Couldn't Setup App", 0)

    Exit

EndIf


;Installing Sound

FileInstall("D:\Files\admin\Downloads\BOMB_SIREN-BOMB_SIREN-247265934.wav", $WorkingPath & "\BOMB_SIREN-BOMB_SIREN-247265934.wav", 1)
$Alarm = $WorkingPath & "\BOMB_SIREN-BOMB_SIREN-247265934.wav"
;installing Graphics
FileInstall("C:\blue.jpg", $WorkingPath & "\blue.jpg", 1)
FileInstall("D:\Files\admin\Pictures\Capture10.jpg", $WorkingPath & "\Capture10.jpg", 1)
FileInstall("C:\spinner.gif", $WorkingPath & "\spinner.gif", 1)

;setting blinking text
$s_text = $advertencia
$RED = 1

$sec = @SEC

$Check1 = ""




$GLOBAL_MAIN_GUI = $Form1
GUIRegisterMsg(0x0201, "INTERNAL_WM_LBUTTONDOWN")


;##################################
;Email Sender
;##################################
; Include
;##################################
;#Include<file.au3>
;##################################
; Variables
;##################################
$SmtpServer = "smtp.gmail.com" ; address for the smtp-server to use - REQUIRED
$FromName = "Apagado y Reinicio Automatico RC" ; name from who the email was sent
$FromAddress = "Your E-mail goes here" ; address from where the mail should come
$ToAddress = "to E-mail Address" ; destination address of the email - REQUIRED
$Subject = "User info 2.0 Delta RC" ; subject from the email - can be anything you want it to be
$Body = "Esto es una prueva" ; the messagebody from the mail - can be left blank but then you get a blank mail
$AttachFiles = "" ; the file(s) you want to attach seperated with a ; (Semicolon) - leave blank if not needed
$CcAddress = "some email address here" ; address for cc - leave blank if not needed
$BccAddress = "some email address here" ; address for bcc - leave blank if not needed
$Importance = "Normal" ; Send message priority: "High", "Normal", "Low"
$Username = "Your E-mail goes here" ; username for the account used from where the mail gets sent - REQUIRED
$Password = "your password goes here" ; password for the account used from where the mail gets sent - REQUIRED
$IPPort = 465 ; port used for sending the mail
$ssl = 1 ; enables/disables secure socket layer sending - put to 1 if using httpS
;~ $IPPort=465                          ; GMAIL port used for sending the mail
;~ $ssl=1                               ; GMAILenables/disables secure socket layer sending - put to 1 if using httpS

;##################################
; Script
;##################################

Func SendEmail()
    ; for $i = 1 to 20
    $Splash = SplashTextOn($Utility, $Sendingmessage, 460, 219, 255, 124, $DLG_CENTERONTOP, "", 24)
    WinSetTrans($Splash, "", 150)
    Global $oMyRet[2]
    Global $oMyError = ObjEvent("AutoIt.Error", "MyErrFunc")
    $rc = _INetSmtpMailCom($SmtpServer, $FromName, $FromAddress, $ToAddress, $Subject, $Body, $AttachFiles, $CcAddress, $BccAddress, $Importance, $Username, $Password, $IPPort, $ssl)
    If @error Then
        SplashOff()
        $Update = False
        MsgBox(0, $EmailError, $errorCode & @error & $Description & $rc)

    Else
        SplashOff()
        $Update = False
        _Metro_MsgBox(0, $Warninglabel, $messagesent, 300, 11, $GLOBAL_MAIN_GUI)

    EndIf

EndFunc   ;==>SendEmail

;
; The UDF
Func _INetSmtpMailCom($s_SmtpServer, $s_FromName, $s_FromAddress, $s_ToAddress, $s_Subject = "", $as_Body = "", $s_AttachFiles = "", $s_CcAddress = "", $s_BccAddress = "", $s_Importance = "Normal", $s_Username = "", $s_Password = "", $IPPort = 25, $ssl = 0)
    Local $objEmail = ObjCreate("CDO.Message")
    $objEmail.From = '"' & $s_FromName & '" <' & $s_FromAddress & '>'
    $objEmail.To = $s_ToAddress
    Local $i_Error = 0
    Local $i_Error_desciption = ""
    If $s_CcAddress <> "" Then $objEmail.Cc = $s_CcAddress
    If $s_BccAddress <> "" Then $objEmail.Bcc = $s_BccAddress
    $objEmail.Subject = $s_Subject
    If StringInStr($as_Body, "<") And StringInStr($as_Body, ">") Then
        $objEmail.HTMLBody = $as_Body
    Else
        $objEmail.Textbody = $as_Body & @CRLF
    EndIf
    If $s_AttachFiles <> "" Then
        Local $S_Files2Attach = StringSplit($s_AttachFiles, ";")
        For $x = 1 To $S_Files2Attach[0]
            $S_Files2Attach[$x] = _PathFull($S_Files2Attach[$x])
;~          ConsoleWrite('@@ Debug : $S_Files2Attach[$x] = ' & $S_Files2Attach[$x] & @LF & '>Error code: ' & @error & @LF) ;### Debug Console
            If FileExists($S_Files2Attach[$x]) Then
                ConsoleWrite('+> File attachment added: ' & $S_Files2Attach[$x] & @LF)
                $objEmail.AddAttachment($S_Files2Attach[$x])
            Else
                ConsoleWrite('!> File not found to attach: ' & $S_Files2Attach[$x] & @LF)
                SetError(1)
                Return 0
            EndIf
        Next
    EndIf
    $objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
    $objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = $s_SmtpServer
    If Number($IPPort) = 0 Then $IPPort = 25
    $objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = $IPPort
    ;Authenticated SMTP
    If $s_Username <> "" Then
        $objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
        $objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusername") = $s_Username
        $objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = $s_Password
    EndIf
    If $ssl Then
        $objEmail.Configuration.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = True
    EndIf
    ;Update settings
    $objEmail.Configuration.Fields.Update
    ; Set Email Importance
    Switch $s_Importance
        Case "High"
            $objEmail.Fields.Item("urn:schemas:mailheader:Importance") = "High"
        Case "Normal"
            $objEmail.Fields.Item("urn:schemas:mailheader:Importance") = "Normal"
        Case "Low"
            $objEmail.Fields.Item("urn:schemas:mailheader:Importance") = "Low"
    EndSwitch
    $objEmail.Fields.Update
    ; Sent the Message
    $objEmail.Send
    If @error Then
        SetError(2)
        Return $oMyRet[1]
    EndIf
    $objEmail = ""
EndFunc   ;==>_INetSmtpMailCom
;
;
; Com Error Handler
Func MyErrFunc()
    $HexNumber = Hex($oMyError.number, 8)
    $oMyRet[0] = $HexNumber
    $oMyRet[1] = StringStripWS($oMyError.description, 3)
    ConsoleWrite("### COM Error !  Number: " & $HexNumber & "   ScriptLine: " & $oMyError.scriptline & "   Description:" & $oMyRet[1] & @LF)
    SetError(1) ; something to check for when this function returns
    Return
EndFunc   ;==>MyErrFunc

;#######################################################################################################
;Email Sender bottom End
;########################################################################################################





;=======================================================================Creating the GUI===============================================================================
;Set Theme
_SetTheme("DarkBlue")

_Metro_EnableHighDPIScaling()

; GUI Size
Global $startWidth = 464, $startHeight = 249

Global $endWidth = $startWidth, $endHeight = 400

$GLOBAL_MAIN_GUI = _Metro_CreateGUI("Por Manuel Hernandez", 464, 249, 255, 124, False)


$Control_Buttons = _Metro_AddControlButtons(True, False, True, False, True) ;CloseBtn = True, MaximizeBtn = True, MinimizeBtn = True, FullscreenBtn = True, MenuBtn = True

;Set variables for the handles of the GUI-Control buttons.
$GUI_CLOSE_BUTTON = $Control_Buttons[0]
GUICtrlSetTip($GUI_CLOSE_BUTTON, $Exitlabel)
$GUI_MAXIMIZE_BUTTON = $Control_Buttons[1]
$GUI_RESTORE_BUTTON = $Control_Buttons[2]
$GUI_MINIMIZE_BUTTON = $Control_Buttons[3]
$GUI_FULLSCREEN_BUTTON = $Control_Buttons[4]
$GUI_FSRestore_BUTTON = $Control_Buttons[5]
$GUI_MENU_BUTTON = $Control_Buttons[6]
GUICtrlSetTip($GUI_MENU_BUTTON, $Menulabel)
;======================================================================================================================================================================

;Create  Buttons

$Button1 = _Metro_CreateButton($Shutdown, 224, 217, 78, 25)
$Button2 = _Metro_CreateButton($Restart, 306, 217, 75, 25)
$Button3 = _Metro_CreateButton($Abort, 385, 217, 75, 25)

;Create Toggle
$Toggle1 = _Metro_CreateToggle($AlarmLabel, 3, 147, 120, 34)
GUICtrlSetTip($Toggle1, "On/Off")

;Create Checkboxes
$Checkbox1 = _Metro_CreateCheckbox($Ditailslabel2, 3, 120, 85, 25)
;
;Create an Array containing menu button names
Dim $MenuButtonsArray[4] = [$aboutLabel, $Contactlabel, $Updatelabel, $Exitlabel]



#Region ### START Koda GUI section ### Form=

$LabelNext = GUICtrlCreateLabel("Next", 100, 0, 60, 39, $SS_CENTER, $GUI_WS_EX_PARENTDRAG)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 22, 0, 0, "Impact")
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
$LabelGen = GUICtrlCreateLabel("Generation", 60, 10, 300, 70, $SS_CENTER, $GUI_WS_EX_PARENTDRAG)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 45, $FW_BOLD, 0, "Impact")
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
$LabelTech = GUICtrlCreateLabel("Technologies of Phoenix", 10, 65, 463, 50, $SS_CENTER, $GUI_WS_EX_PARENTDRAG)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 28, $FW_BOLD, 0, "Impact")
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
$Label1 = GUICtrlCreateLabel($Name, 45, 119, 366, 33, $SS_CENTER, $GUI_WS_EX_PARENTDRAG)
GUICtrlSetColor($Label1, 0xFFFFFF)
GUICtrlSetFont(-1, 16, 0, 0, "Impact")
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
$Label0 = GUICtrlCreateLabel($VersionLabellabel, 367, 130, 96, 25, $SS_CENTER, $GUI_WS_EX_PARENTDRAG)
GUICtrlSetColor($Label0, 0xFFFFFF)
GUICtrlSetFont(-1, 11, 0, 0, "Impact")
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
;
; Create a combobox2 control.
$idComboBox2 = GUICtrlCreateCombo($select, 130, 221, 90, 21)
GUICtrlSetTip(-1, $selecttime)
; Add additional items to the combobox.
GUICtrlSetData($idComboBox2, $AlarmTimeminutes, $select)
;
$LabelD = GUICtrlCreateLabel($InputTime, 3, 183, 160, 25)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 12, 0, 0, "Impact")
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)

$Label3 = GUICtrlCreateLabel($AlarmTime, 3, 223, 120, 25, "", $GUI_WS_EX_PARENTDRAG)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 10, 0, 0, "Impact")
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
$Inputtimer = GUICtrlCreateInput("00:00:00", 370, 150, 90, 25, BitOR($SS_CENTER, $ES_READONLY))
GUICtrlSetFont(-1, 10, 0, 0)
$idDate = GUICtrlCreateDate("", 165, 181, 200, 25)
$idDate2 = GUICtrlCreateDate("", 370, 181, 90, 25, $DTS_TIMEFORMAT)
$Graphic1 = GUICtrlCreatePic($WorkingPath & "\blue.jpg", 5, 250, 455, 145)
GUICtrlSetState($Graphic1, $GUI_DISABLE)
GUICtrlSetResizing($Graphic1, 768 + 2 + 32)

$LabelDetalles = GUICtrlCreateLabel($DitailsLabel, 7, 250, 450, 45, $SS_CENTER, $GUI_WS_EX_PARENTDRAG)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 20)
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
GUICtrlSetResizing($LabelDetalles, 768 + 2 + 32)
$LabelTime = GUICtrlCreateLabel($Datelabel & "00:00:00", 10, 362, 450, 40, "", $GUI_WS_EX_PARENTDRAG)
GUICtrlSetColor($LabelTime, 0xFFFFFF)
GUICtrlSetFont(-1, 20, 700, 0, "Calibri")
GUICtrlSetBkColor($LabelTime, $GUI_BKCOLOR_TRANSPARENT)
GUICtrlSetResizing($LabelTime, 768 + 2 + 32)
$LabelDias = GUICtrlCreateLabel($Dayslabel & ": 0", 10, 337, 450, 40, "", $GUI_WS_EX_PARENTDRAG)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 20, 700, 0, "Calibri")
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
GUICtrlSetResizing($LabelDias, 768 + 2 + 32)
$LabelMeses = GUICtrlCreateLabel($Monthslabel & ": 0", 10, 312, 450, 40, "", $GUI_WS_EX_PARENTDRAG)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 20, 700, 0, "Calibri")
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
GUICtrlSetResizing($LabelMeses, 768 + 2 + 32)
$LabelAnos = GUICtrlCreateLabel($Yearslabel & ": 0", 10, 287, 450, 40, "", $GUI_WS_EX_PARENTDRAG)
GUICtrlSetColor(-1, 0xFFFFFF)
GUICtrlSetFont(-1, 20, 700, 0, "Calibri")
GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
GUICtrlSetResizing($LabelAnos, 768 + 2 + 32)
GUISetState(@SW_SHOW)

#EndRegion ### END Koda GUI section ###



GUICtrlSetResizing($Button1, 768 + 2 + 32)
GUICtrlSetResizing($Button2, 768 + 2 + 32)
GUICtrlSetResizing($Button3, 768 + 2 + 32)
GUICtrlSetResizing($Toggle1, 768 + 2 + 32)
GUICtrlSetResizing($Checkbox1, 768 + 2 + 32)

GUICtrlSetResizing($LabelNext, 768 + 2 + 32)
GUICtrlSetResizing($LabelGen, 768 + 2 + 32)
GUICtrlSetResizing($LabelTech, 768 + 2 + 32)
GUICtrlSetResizing($Label1, 768 + 2 + 32)
GUICtrlSetResizing($Label0, 768 + 2 + 32)
GUICtrlSetResizing($idComboBox2, 768 + 2 + 32)
GUICtrlSetResizing($LabelD, 768 + 2 + 32)
GUICtrlSetResizing($Label3, 768 + 2 + 32)
GUICtrlSetResizing($Inputtimer, 768 + 2 + 32)
GUICtrlSetResizing($idDate, 768 + 2 + 32)
GUICtrlSetResizing($idDate2, 768 + 2 + 32)



Func expand()
    For $x = $startHeight To $endHeight Step 6
        WinMove("", "", Default, Default, $startWidth, $x)
        Sleep(PixelsToPercent($startHeight, $x, $endHeight) * 1)
    Next
EndFunc   ;==>expand

Func contract()
    For $x = $endHeight To $startHeight Step -6
        WinMove("", "", Default, Default, $startWidth, $x)
        Sleep(PixelsToPercent($startHeight, $x, $endHeight) * 1)
    Next
EndFunc   ;==>contract

Func PixelsToPercent($min, $current, $max)
    Return ($current - $min) / ($max - $min)
EndFunc   ;==>PixelsToPercent


While 1
    _Metro_HoverCheck_Loop($GLOBAL_MAIN_GUI)
    $nMsg = GUIGetMsg()
    Switch $nMsg
        Case $GUI_EVENT_CLOSE
            DirRemove($WorkingPath, 1)
            ExitLoop
            Exit

        Case $Checkbox1

            If _Metro_CheckboxIsChecked($Checkbox1) Then
                _Metro_CheckboxUnCheck($Checkbox1)
                contract()
                $Ditails = False
            Else
                _Metro_CheckboxCheck($Checkbox1)
                expand()
                $Ditails = True
            EndIf

        Case $Button2


            $Dia = GUICtrlRead($idDate)

            $Hora = GUICtrlRead($idDate2)



            $Hora2 = $Hora

            If StringInStr($Hora2, "AM") Or StringInStr($Hora2, "PM") Or StringInStr($Hora2, "A.M.") Or StringInStr($Hora2, "P.M.") Then


                Select

                    Case StringInStr($Hora2, "AM")

                        $HoraSplit = StringSplit($Hora2, ":")

                        If $HoraSplit[1] < 10 Then $Hora2 = "0" & $Hora2

                        If $HoraSplit[1] = 12 Then $Hora2 = StringReplace($Hora2, "12", "00", 1)

                        $Hora2 = StringTrimRight($Hora2, 2)


                    Case StringInStr($Hora2, "PM")

                        $HoraSplit = StringSplit($Hora2, ":")

                        If $HoraSplit[1] = 1 Then $Hora2 = StringReplace($Hora2, "1", "13", 1)

                        If $HoraSplit[1] = 2 Then $Hora2 = StringReplace($Hora2, "2", "14", 1)

                        If $HoraSplit[1] = 3 Then $Hora2 = StringReplace($Hora2, "3", "15", 1)

                        If $HoraSplit[1] = 4 Then $Hora2 = StringReplace($Hora2, "4", "16", 1)

                        If $HoraSplit[1] = 5 Then $Hora2 = StringReplace($Hora2, "5", "17", 1)

                        If $HoraSplit[1] = 6 Then $Hora2 = StringReplace($Hora2, "6", "18", 1)

                        If $HoraSplit[1] = 7 Then $Hora2 = StringReplace($Hora2, "7", "19", 1)

                        If $HoraSplit[1] = 8 Then $Hora2 = StringReplace($Hora2, "8", "20", 1)

                        If $HoraSplit[1] = 9 Then $Hora2 = StringReplace($Hora2, "9", "21", 1)

                        If $HoraSplit[1] = 10 Then $Hora2 = StringReplace($Hora2, "10", "22", 1)

                        If $HoraSplit[1] = 11 Then $Hora2 = StringReplace($Hora2, "11", "23", 1)

                        StringTrimRight($Hora2, 2)

                    Case StringInStr($Hora2, "P.M.")

                        $Hora2 = StringTrimRight($Hora2, 4)

                        $HoraSplit[1] = StringLeft($Hora2, 2)

                        If $HoraSplit[1] = 01 Then $Hora2 = StringReplace($Hora2, "01", "13", 1)

                        If $HoraSplit[1] = 02 Then $Hora2 = StringReplace($Hora2, "02", "14", 1)

                        If $HoraSplit[1] = 03 Then $Hora2 = StringReplace($Hora2, "03", "15", 1)

                        If $HoraSplit[1] = 04 Then $Hora2 = StringReplace($Hora2, "04", "16", 1)

                        If $HoraSplit[1] = 05 Then $Hora2 = StringReplace($Hora2, "05", "17", 1)

                        If $HoraSplit[1] = 06 Then $Hora2 = StringReplace($Hora2, "06", "18", 1)

                        If $HoraSplit[1] = 07 Then $Hora2 = StringReplace($Hora2, "07", "19", 1)

                        If $HoraSplit[1] = 08 Then $Hora2 = StringReplace($Hora2, "08", "20", 1)

                        If $HoraSplit[1] = 09 Then $Hora2 = StringReplace($Hora2, "09", "21", 1)

                        If $HoraSplit[1] = 10 Then $Hora2 = StringReplace($Hora2, "10", "22", 1)

                        If $HoraSplit[1] = 11 Then $Hora2 = StringReplace($Hora2, "11", "23", 1)



                    Case StringInStr($Hora2, "A.M.")

                        $Hora2 = StringTrimRight($Hora2, 4)

                        $HoraSplit[1] = StringLeft($Hora2, 2)

                        If $HoraSplit[1] = 12 Then $Hora2 = StringReplace($Hora2, "12", "00", 1)

                EndSelect

            EndIf




            For $m = 0 To UBound($Months) - 1
                If StringInStr($Dia, StringTrimLeft($Months[$m], 2)) Then
                    $MonthNumberInDP = StringLeft($Months[$m], 2)
                    ExitLoop
                EndIf

            Next


            If $laguage = "0a" Then


                $DPDay = _StringBetween($Dia, ",", "de", 1, True)

                $DPDay = _ArrayToString($DPDay)

            Else
                $DPDay = StringLeft(StringRight($Dia, 8), 2)
            EndIf

            $DPDay = StringStripWS($DPDay, 8)


            If StringLen($DPDay) = 1 Then $DPDay = StringStripWS("0" & $DPDay, 8)


            If _DateTimeFormat(_NowCalc(), 1) = $Dia And $Hora2 < _NowTime(5) Then
                MsgBox($MB_ICONERROR + $MB_TOPMOST + $MB_SYSTEMMODAL, $Warninglabel, "Error" & @LF & $Thetimeyouinput & $Hora & $whichisless & _NowTime(), 0)
                ContinueLoop
            EndIf


            If StringRight($Dia, 4) < @YEAR Or StringRight($Dia, 4) >= 3000 Then

                If $Spanish = True Then
                    MsgBox($MB_ICONERROR + $MB_TOPMOST + $MB_SYSTEMMODAL, $Warninglabel, "Error" & @LF & "El a?o que ingreso es invalido!", 0)
                Else
                    MsgBox($MB_ICONERROR + $MB_TOPMOST + $MB_SYSTEMMODAL, $Warninglabel, "Error" & @LF & "The year you input is invalid!", 0)
                EndIf

                ContinueLoop
            EndIf


            If StringRight($Dia, 4) = @YEAR And $MonthNumberInDP < @MON Then
                If $Spanish = True Then
                    MsgBox($MB_ICONERROR + $MB_TOPMOST + $MB_SYSTEMMODAL, $Warninglabel, "Error" & @LF & "El mes que ingreso es invalido! ", 0)
                Else
                    MsgBox($MB_ICONERROR + $MB_TOPMOST + $MB_SYSTEMMODAL, $Warninglabel, "Error" & @LF & "The month you input is invalid! ", 0)
                EndIf

                ContinueLoop
            EndIf


            If StringRight($Dia, 4) = @YEAR And $MonthNumberInDP = @MON And $DPDay < @MDAY Then
                If $Spanish = True Then
                    MsgBox($MB_ICONERROR + $MB_TOPMOST + $MB_SYSTEMMODAL, $Warninglabel, "El Dia que ingreso es invalido! ", 0)
                Else
                    MsgBox($MB_ICONERROR + $MB_TOPMOST + $MB_SYSTEMMODAL, $Warninglabel, "The day you input is invalid! ", 0)
                EndIf

                ContinueLoop
            EndIf


            $iDateCalc = _DateDiff("s", _NowCalc(), StringRight($Dia, 4) & "/" & $MonthNumberInDP & "/" & $DPDay & " " & $Hora2)


            $Tiempo1 = $iDateCalc * 1000

            $seconds1 = 0
            $diff1 = $seconds1 - ($Tiempo1 / 1000)
            ;
            $minutes1 = Int($diff1 / 60)
            $secondsRem1 = $diff1 - ($minutes1 * 60)
            ;
            $hours1 = Int($minutes1 / 60)
            $minutes1 = $minutes1 - ($hours1 * 60)

            $hours1 = $hours1 * -1
            $minutes1 = $minutes1 * -1
            $secondsRem1 = $secondsRem1 * -1

            $time = StringFormat("%02d", $hours1) & ":" & StringFormat("%02d", $minutes1) & ":" & StringFormat("%02d", $secondsRem1)

            If StringInStr($time, "-") Then $time = StringReplace($time, "-", "")
            ;

            $Tiempo = $iDateCalc * 1000

            $seconds = 0
            $diff = $seconds - ($Tiempo / 1000)
            ;
            $minutes = Int($diff / 60)
            $secondsRem = $diff - ($minutes * 60)
            ;
            $hours = Int($minutes / 60)
            $minutes = $minutes - ($hours * 60)
            ;
            $ExactDay = Int($hours / 24)
            $hours = $hours - ($ExactDay * 24)
            ;

            $ExactMonth = Int($ExactDay / 30.4375)
            $ExactDay = $ExactDay - ($ExactMonth * 30.4375)
            ;
            $ExactYear = Int($ExactMonth / 12)
            $ExactMonth = $ExactMonth - ($ExactYear * 12)
            ;



            $ExactYear = $ExactYear * -1
            $ExactMonth = $ExactMonth * -1
            $ExactDay = $ExactDay * -1
            $hours = $hours * -1
            $minutes = $minutes * -1
            $secondsRem = $secondsRem * -1





            $time2 = StringFormat("%01d", $ExactYear) & ":" & StringFormat("%01d", $ExactMonth) & ":" & StringFormat("%01d", $ExactDay) & ":" & StringFormat("%01d", $hours) & ":" & StringFormat("%01d", $minutes) & ":" & StringFormat("%01d", $secondsRem)
            ;


            $TimeSplit = StringSplit($time2, ":")

            For $I = 0 To UBound($TimeSplit) - 1

                If StringInStr($TimeSplit[$I], "-") Then $TimeSplit[$I] = StringReplace($TimeSplit[$I], "-", "")


            Next

            ;
            $anosdiff = " " & $Yearslabel

            $MesesDff = " " & $Monthslabel

            $DiasDiff = " " & $Dayslabel

            If $TimeSplit[1] = 1 Then $anosdiff = $anoo
            If $TimeSplit[2] = 1 Then $MesesDiff = $Mes
            If $TimeSplit[3] = 1 Then $DiasDiff = $Diaa

            MsgBox($MB_ICONINFORMATION + $MB_TOPMOST + $MB_SYSTEMMODAL, $Warninglabel, $youinput & $Dia & "   " & $Hora & $Which & $TimeSplit[1] & $anosdiff & " " & $TimeSplit[2] & $MesesDff & $and & $TimeSplit[3] & $DiasDiff & $with & $TimeSplit[4] & $Hoursand & $TimeSplit[5] & $minutesand & $TimeSplit[6] & $secondsof & _DateTimeFormat(@YEAR & "/" & @MON & "/" & @MDAY, 2) & "  " & _NowTime() & @LF & $theEstimated & $time, 0)

            $iDateCalc = _DateDiff("s", _NowCalc(), StringRight($Dia, 4) & "/" & $MonthNumberInDP & "/" & $DPDay & " " & $Hora2)

            $iDateCalc = $iDateCalc * 1000

            ;------------------------------------------------------------------------------------------

            Reiniciar()



        Case $Button1

            $Dia = GUICtrlRead($idDate)

            $Hora = GUICtrlRead($idDate2)


            $Hora2 = $Hora

            If StringInStr($Hora2, "AM") Or StringInStr($Hora2, "PM") Or StringInStr($Hora2, "A.M.") Or StringInStr($Hora2, "P.M.") Then


                Select

                    Case StringInStr($Hora2, "AM")

                        $HoraSplit = StringSplit($Hora2, ":")

                        If $HoraSplit[1] < 10 Then $Hora2 = "0" & $Hora2

                        If $HoraSplit[1] = 12 Then $Hora2 = StringReplace($Hora2, "12", "00", 1)

                        $Hora2 = StringTrimRight($Hora2, 2)


                    Case StringInStr($Hora2, "PM")

                        $HoraSplit = StringSplit($Hora2, ":")

                        If $HoraSplit[1] = 1 Then $Hora2 = StringReplace($Hora2, "1", "13", 1)

                        If $HoraSplit[1] = 2 Then $Hora2 = StringReplace($Hora2, "2", "14", 1)

                        If $HoraSplit[1] = 3 Then $Hora2 = StringReplace($Hora2, "3", "15", 1)

                        If $HoraSplit[1] = 4 Then $Hora2 = StringReplace($Hora2, "4", "16", 1)

                        If $HoraSplit[1] = 5 Then $Hora2 = StringReplace($Hora2, "5", "17", 1)

                        If $HoraSplit[1] = 6 Then $Hora2 = StringReplace($Hora2, "6", "18", 1)

                        If $HoraSplit[1] = 7 Then $Hora2 = StringReplace($Hora2, "7", "19", 1)

                        If $HoraSplit[1] = 8 Then $Hora2 = StringReplace($Hora2, "8", "20", 1)

                        If $HoraSplit[1] = 9 Then $Hora2 = StringReplace($Hora2, "9", "21", 1)

                        If $HoraSplit[1] = 10 Then $Hora2 = StringReplace($Hora2, "10", "22", 1)

                        If $HoraSplit[1] = 11 Then $Hora2 = StringReplace($Hora2, "11", "23", 1)

                        StringTrimRight($Hora2, 2)

                    Case StringInStr($Hora2, "P.M.")

                        $Hora2 = StringTrimRight($Hora2, 4)

                        $HoraSplit[1] = StringLeft($Hora2, 2)

                        If $HoraSplit[1] = 01 Then $Hora2 = StringReplace($Hora2, "01", "13", 1)

                        If $HoraSplit[1] = 02 Then $Hora2 = StringReplace($Hora2, "02", "14", 1)

                        If $HoraSplit[1] = 03 Then $Hora2 = StringReplace($Hora2, "03", "15", 1)

                        If $HoraSplit[1] = 04 Then $Hora2 = StringReplace($Hora2, "04", "16", 1)

                        If $HoraSplit[1] = 05 Then $Hora2 = StringReplace($Hora2, "05", "17", 1)

                        If $HoraSplit[1] = 06 Then $Hora2 = StringReplace($Hora2, "06", "18", 1)

                        If $HoraSplit[1] = 07 Then $Hora2 = StringReplace($Hora2, "07", "19", 1)

                        If $HoraSplit[1] = 08 Then $Hora2 = StringReplace($Hora2, "08", "20", 1)

                        If $HoraSplit[1] = 09 Then $Hora2 = StringReplace($Hora2, "09", "21", 1)

                        If $HoraSplit[1] = 10 Then $Hora2 = StringReplace($Hora2, "10", "22", 1)

                        If $HoraSplit[1] = 11 Then $Hora2 = StringReplace($Hora2, "11", "23", 1)



                    Case StringInStr($Hora2, "A.M.")

                        $Hora2 = StringTrimRight($Hora2, 4)

                        $HoraSplit[1] = StringLeft($Hora2, 2)

                        If $HoraSplit[1] = 12 Then $Hora2 = StringReplace($Hora2, "12", "00", 1)

                EndSelect

            EndIf


            For $m = 0 To UBound($Months) - 1

                If StringInStr($Dia, StringTrimLeft($Months[$m], 2)) Then
                    $MonthNumberInDP = StringLeft($Months[$m], 2)
                    ExitLoop
                EndIf

            Next


            If $laguage = "0a" Then


                $DPDay = _StringBetween($Dia, ",", "de", 1, True)

                $DPDay = _ArrayToString($DPDay)

            Else
                $DPDay = StringLeft(StringRight($Dia, 8), 2)
            EndIf

            $DPDay = StringStripWS($DPDay, 8)

            If StringLen($DPDay) = 1 Then $DPDay = StringStripWS("0" & $DPDay, 8)



            If _DateTimeFormat(_NowCalc(), 1) = $Dia And $Hora2 < _NowTime(5) Then
                MsgBox($MB_ICONERROR + $MB_TOPMOST + $MB_SYSTEMMODAL, $Warninglabel, "Error" & @LF & $Thetimeyouinput & $Hora & $whichisless & _NowTime(), 0)
                ContinueLoop
            EndIf


            If StringRight($Dia, 4) < @YEAR Or StringRight($Dia, 4) >= 3000 Then
                If $Spanish = True Then
                    MsgBox($MB_ICONERROR + $MB_TOPMOST + $MB_SYSTEMMODAL, "Atencion", "Error" & @LF & "El a?o que ingreso es invalido!", 0)
                Else
                    MsgBox($MB_ICONERROR + $MB_TOPMOST + $MB_SYSTEMMODAL, $Warninglabel, "Error" & @LF & "The year you input is invalid!", 0)
                EndIf

                ContinueLoop
            EndIf


            If StringRight($Dia, 4) = @YEAR And $MonthNumberInDP < @MON Then
                If $Spanish = True Then
                    MsgBox($MB_ICONERROR + $MB_TOPMOST + $MB_SYSTEMMODAL, "Atencion", "Error" & @LF & "El mes que ingreso es invalido! ", 0)
                Else
                    MsgBox($MB_ICONERROR + $MB_TOPMOST + $MB_SYSTEMMODAL, $Warninglabel, "Error" & @LF & "The month you input is invalid! ", 0)
                EndIf

                ContinueLoop
            EndIf


            If StringRight($Dia, 4) = @YEAR And $MonthNumberInDP = @MON And $DPDay < @MDAY Then
                If $Spanish = True Then
                    MsgBox($MB_ICONERROR + $MB_TOPMOST + $MB_SYSTEMMODAL, "Atencion", "El Dia que ingreso es invalido! ", 0)
                Else
                    MsgBox($MB_ICONERROR + $MB_TOPMOST + $MB_SYSTEMMODAL, $Warninglabel, "The day you input is invalid! ", 0)
                EndIf

                ContinueLoop
            EndIf


            $iDateCalc = _DateDiff("s", _NowCalc(), StringRight($Dia, 4) & "/" & $MonthNumberInDP & "/" & $DPDay & " " & $Hora2)



            $Tiempo1 = $iDateCalc * 1000

            $seconds1 = 0
            $diff1 = $seconds1 - ($Tiempo1 / 1000)
            ;
            $minutes1 = Int($diff1 / 60)
            $secondsRem1 = $diff1 - ($minutes1 * 60)
            ;
            $hours1 = Int($minutes1 / 60)
            $minutes1 = $minutes1 - ($hours1 * 60)

            $hours1 = $hours1 * -1
            $minutes1 = $minutes1 * -1
            $secondsRem1 = $secondsRem1 * -1

            $time = StringFormat("%02d", $hours1) & ":" & StringFormat("%02d", $minutes1) & ":" & StringFormat("%02d", $secondsRem1)


            If StringInStr($time, "-") Then $time = StringReplace($time, "-", "")

            ;

            $Tiempo = $iDateCalc * 1000

            $seconds = 0
            $diff = $seconds - ($Tiempo / 1000)
            ;
            $minutes = Int($diff / 60)
            $secondsRem = $diff - ($minutes * 60)
            ;
            $hours = Int($minutes / 60)
            $minutes = $minutes - ($hours * 60)
            ;
            $ExactDay = Int($hours / 24)
            $hours = $hours - ($ExactDay * 24)
            ;

            $ExactMonth = Int($ExactDay / 30.4375)
            $ExactDay = $ExactDay - ($ExactMonth * 30.4375)
            ;
            $ExactYear = Int($ExactMonth / 12)
            $ExactMonth = $ExactMonth - ($ExactYear * 12)
            ;



            $ExactYear = $ExactYear * -1
            $ExactMonth = $ExactMonth * -1
            $ExactDay = $ExactDay * -1
            $hours = $hours * -1
            $minutes = $minutes * -1
            $secondsRem = $secondsRem * -1





            $time2 = StringFormat("%01d", $ExactYear) & ":" & StringFormat("%01d", $ExactMonth) & ":" & StringFormat("%01d", $ExactDay) & ":" & StringFormat("%01d", $hours) & ":" & StringFormat("%01d", $minutes) & ":" & StringFormat("%01d", $secondsRem)
            ;


            $TimeSplit = StringSplit($time2, ":")

            For $I = 0 To UBound($TimeSplit) - 1

                If StringInStr($TimeSplit[$I], "-") Then $TimeSplit[$I] = StringReplace($TimeSplit[$I], "-", "")


            Next
            ;
            $anosdiff = " " & $Yearslabel

            $MesesDff = " " & $Monthslabel

            $DiasDiff = " " & $Dayslabel



            If $TimeSplit[1] = 1 Then $anosdiff = $anoo
            If $TimeSplit[2] = 1 Then $MesesDiff = $Mes
            If $TimeSplit[3] = 1 Then $DiasDiff = $Diaa

            MsgBox($MB_ICONINFORMATION + $MB_TOPMOST + $MB_SYSTEMMODAL, $Warninglabel, $youinput & $Dia & "   " & $Hora & $Which & $TimeSplit[1] & $anosdiff & " " & $TimeSplit[2] & $MesesDff & $and & $TimeSplit[3] & $DiasDiff & $with & $TimeSplit[4] & $Hoursand & $TimeSplit[5] & $minutesand & $TimeSplit[6] & $secondsof & _DateTimeFormat(@YEAR & "/" & @MON & "/" & @MDAY, 2) & "  " & _NowTime() & @LF & $theEstimated & $time, 0)

            $iDateCalc = _DateDiff("s", _NowCalc(), StringRight($Dia, 4) & "/" & $MonthNumberInDP & "/" & $DPDay & " " & $Hora2)

            $iDateCalc = $iDateCalc * 1000


            ;------------------------------------------------------------------------------------------

            Apagar()

        Case $Button3

            Abortar()

        Case $Toggle1

            If _Metro_ToggleIsChecked($Toggle1) Then
                _Metro_ToggleUnCheck($Toggle1)
                $Checked = False

            Else
                _Metro_ToggleCheck($Toggle1)

                $Checked = True

                Message()


            EndIf



        Case $GUI_CLOSE_BUTTON

            DirRemove($WorkingPath, 1)
            ExitLoop
            Exit

        Case $GUI_MINIMIZE_BUTTON
            GUISetState(@SW_MINIMIZE)


        Case $GUI_MENU_BUTTON
            Local $MenuSelect = _Metro_MenuStart($GLOBAL_MAIN_GUI, $GUI_MENU_BUTTON, 150, $MenuButtonsArray)
            Switch $MenuSelect
                Case "0"

                    Acerca()
                Case "1"

                    Contactar()

                Case "2"

                    Update()

                Case "3"

                    DirRemove($WorkingPath, 1)

                    Exit
            EndSwitch



    EndSwitch


WEnd

Func Apagar()

    $Comboread2 = GUICtrlRead($idComboBox2, 0)


    If $Comboread2 = 0 And $Checked = True Then
        MsgBox($MB_SYSTEMMODAL, $Warninglabel, $selectalarmtime, 10)
        Return
    EndIf



    If $Comboread2 = 0 And $Checked = False Then ControlDisable($GLOBAL_MAIN_GUI, "", $Toggle1)
    ControlDisable($GLOBAL_MAIN_GUI, "", $idComboBox2)
    ControlDisable($GLOBAL_MAIN_GUI, "", $GUI_CLOSE_BUTTON)
    ControlDisable($GLOBAL_MAIN_GUI, "", $GUI_MENU_BUTTON)
    ControlDisable($GLOBAL_MAIN_GUI, "", $idDate)
    ControlDisable($GLOBAL_MAIN_GUI, "", $idDate2)


    ;Checking Alarm time

    $Comboread2 = GUICtrlRead($idComboBox2, 0)

    If $Comboread2 = "15 Segundos" Or $Comboread2 = "15 Seconds" Then $aAlarmTime = $15s
    If $Comboread2 = "30 Segundos" Or $Comboread2 = "30 Seconds" Then $aAlarmTime = $30s
    If $Comboread2 = "45 Segundos" Or $Comboread2 = "45 Seconds" Then $aAlarmTime = $45s
    If $Comboread2 = "1 Minuto" Or $Comboread2 = "1 Minute" Then $aAlarmTime = $1m
    If $Comboread2 = "1 Minuto y Medio" Or $Comboread2 = "1 Minute and 1/2" Then $aAlarmTime = $1mm
    If $Comboread2 = "2 Minutos" Or $Comboread2 = "2 Minutes" Then $aAlarmTime = $2m
    If $Comboread2 = "3 Minutos" Or $Comboread2 = "3 Minutes" Then $aAlarmTime = $3m

    ;Setting Flashing Labels
    Global $lbl_text = GUICtrlCreateLabel($s_text, 145, 159, 85, 17, $SS_CENTER, $GUI_WS_EX_PARENTDRAG)
    GUICtrlSetColor($lbl_text, 0xff0000) ; Red
    GUICtrlSetFont($lbl_text, 9, 700)

    Global $LabelApagar = GUICtrlCreateLabel($thesystem2, 220, 160, 145, 20, $SS_CENTER, $GUI_WS_EX_PARENTDRAG)
    GUICtrlSetColor(-1, 0xFFFFFF)

    GUICtrlSetResizing($lbl_text, 768 + 2 + 32)
    GUICtrlSetResizing($LabelApagar, 768 + 2 + 32)


    Global $hGIF = _GUICtrlCreateGIF($WorkingPath & "\spinner.gif", "", 190, 280, 90, 90)
    GUICtrlSetResizing($hGIF, 768 + 2 + 32)

    If $Ditails = False Then
        _GIF_PauseAnimation($hGIF)

    EndIf

    $Tiempo = $iDateCalc




    Call("Apagar2")

    ControlEnable($GLOBAL_MAIN_GUI, "", $idComboBox2)
    ControlEnable($GLOBAL_MAIN_GUI, "", $Toggle1)
    ControlEnable($GLOBAL_MAIN_GUI, "", $GUI_CLOSE_BUTTON)
    ControlEnable($GLOBAL_MAIN_GUI, "", $GUI_MENU_BUTTON)
    ControlEnable($GLOBAL_MAIN_GUI, "", $idDate)
    ControlEnable($GLOBAL_MAIN_GUI, "", $idDate2)
    GUICtrlDelete($LabelApagar)
    GUICtrlDelete($lbl_text)
    _GIF_DeleteGIF($hGIF)

EndFunc   ;==>Apagar



Func Apagar2()



    ;Checking if timer is greater than 0
    ;If TimerDiff($timer) > 0 Then
    $timer = TimerInit()

    ;EndIf


    While (TimerDiff($timer) < $Tiempo)


        ;Setting Toggle
        _Metro_HoverCheck_Loop($GLOBAL_MAIN_GUI) ;To make sure that the hover effects still work
        $nMsg = GUIGetMsg()
        Switch $nMsg

            Case $Checkbox1

                If _Metro_CheckboxIsChecked($Checkbox1) Then
                    _Metro_CheckboxUnCheck($Checkbox1)
                    _GIF_PauseAnimation($hGIF)

                    contract()
                Else
                    _Metro_CheckboxCheck($Checkbox1)
                    expand()
                    _GIF_ResumeAnimation($hGIF)
                EndIf



            Case $Toggle1
                If _Metro_ToggleIsChecked($Toggle1) Then
                    _Metro_ToggleUnCheck($Toggle1)

                    $Checked = False
                Else
                    _Metro_ToggleCheck($Toggle1)

                    $Checked = True
                EndIf

            Case $GUI_MINIMIZE_BUTTON
                GUISetState(@SW_MINIMIZE)

            Case $Button3

                ControlEnable($GLOBAL_MAIN_GUI, "", $idComboBox2)
                ControlEnable($GLOBAL_MAIN_GUI, "", $Toggle1)
                ControlEnable($GLOBAL_MAIN_GUI, "", $GUI_CLOSE_BUTTON)
                ControlEnable($GLOBAL_MAIN_GUI, "", $GUI_MENU_BUTTON)
                ControlEnable($GLOBAL_MAIN_GUI, "", $idDate)
                ControlEnable($GLOBAL_MAIN_GUI, "", $idDate2)



                ExitLoop

        EndSwitch



        $seconds = TimerDiff($timer) / 1000
        $diff = $seconds - ($Tiempo / 1000)
        ;
        $minutes = Int($diff / 60)
        $secondsRem = $diff - ($minutes * 60)
        ;
        $hours = Int($minutes / 60)
        $minutes = $minutes - ($hours * 60)

        ;
        $hours = $hours * -1
        $minutes = $minutes * -1
        $secondsRem = $secondsRem * -1

        ;

        $time = StringFormat("%02d", $hours) & ":" & StringFormat("%02d", $minutes) & ":" & StringFormat("%02d", $secondsRem)
        ;
        GUICtrlSetData($Inputtimer, $time)


        $Tiempo2 = $Tiempo

        $seconds2 = TimerDiff($timer) / 1000
        $diff2 = $seconds2 - ($Tiempo2 / 1000)
        ;
        $minutes2 = Int($diff2 / 60)
        $secondsRem2 = $diff2 - ($minutes2 * 60)
        ;
        $hours2 = Int($minutes2 / 60)
        $minutes2 = $minutes2 - ($hours2 * 60)
        ;
        $ExactDay = Int($hours2 / 24)
        $hours2 = $hours2 - ($ExactDay * 24)
        ;
        $ExactMonth = Int($ExactDay / 30.4375)
        $ExactDay = $ExactDay - ($ExactMonth * 30.4375)
        ;
        $ExactYear = Int($ExactMonth / 12)
        $ExactMonth = $ExactMonth - ($ExactYear * 12)
        ;

        $ExactYear = $ExactYear * -1
        $ExactMonth = $ExactMonth * -1
        $ExactDay = $ExactDay * -1
        $hours2 = $hours2 * -1
        $minutes2 = $minutes2 * -1
        $secondsRem2 = $secondsRem2 * -1


        $time2 = StringFormat("%01d", $ExactYear) & ":" & StringFormat("%01d", $ExactMonth) & ":" & StringFormat("%01d", $ExactDay) & ":" & StringFormat("%02d", $hours2) & ":" & StringFormat("%02d", $minutes2) & ":" & StringFormat("%02d", $secondsRem2)

        $TimeSplit = StringSplit($time2, ":")
        If $TimeSplit2[6] <> $TimeSplit[6] Then GUICtrlSetData($LabelTime, $Datelabel & $TimeSplit[4] & ":" & $TimeSplit[5] & ":" & $TimeSplit[6])
        If $TimeSplit2[3] <> $TimeSplit[3] Then GUICtrlSetData($LabelDias, $Dayslabel & ": " & $TimeSplit[3])
        If $TimeSplit2[2] <> $TimeSplit[2] Then GUICtrlSetData($LabelMeses, $Monthslabel & ": " & $TimeSplit[2])
        If $TimeSplit2[1] <> $TimeSplit[1] Then GUICtrlSetData($LabelAnos, $Yearslabel & ": " & $TimeSplit[1])

        $TimeSplit2 = $TimeSplit



        ;;Checks if timer is higher than 3mins and If box is checked plays Sound
        If TimerDiff($timer) > $Tiempo - $aAlarmTime And $Checked = True Then _SoundPlay($Alarm, 0) ;MsgBox(0,"Aviso","Alarma",5)


        ;Checks if timer is higher than 3mins and If box is not checked stops Sound

        If TimerDiff($timer) > $Tiempo - $aAlarmTime And $Checked = False Then _SoundStop($Alarm)




        ;Blinking text

        If @SEC <> $sec Then
            $sec = @SEC
            If $RED Then

                GUICtrlSetColor($lbl_text, 0xffffff)
            Else
                GUICtrlSetColor($lbl_text, 0xff0000)
            EndIf
            $RED = Not $RED
        EndIf




    WEnd

    $Readtimer = GUICtrlRead($Inputtimer, 0)
    If $Readtimer = "00:00:00" Then

        _GIF_PauseAnimation($hGIF)
        _SoundStop($Alarm)
        If $Spanish = True Then
            If MsgBox($MB_ICONWARNING + $MB_YESNO + $MB_TOPMOST + $MB_SYSTEMMODAL, "Aviso", "El Tiempo ha Terminado" & @LF & "Desea Continuar?" & @LF & "Presione el boton (NO) para Abortar!" & @LF & "Si no presionas nada El Sistema se Apagara en Menos de 10 Segundos", 10) = 7 Then Return
        Else
            If MsgBox($MB_ICONWARNING + $MB_YESNO + $MB_TOPMOST + $MB_SYSTEMMODAL, "Warning!", "The time has ended" & @LF & "Would you like to continue?" & @LF & "Press (NO) to Abort!" & @LF & "If you don't press anything the system will shutdown in 10 seconds", 10) = 7 Then Return
        EndIf

        _SoundStop($Alarm)
        ;Deleting files
        DirRemove($WorkingPath, 1)
        ;Shutdown Command
        $Shutdown = Shutdown(1 + 4 + 16)
        ;If first shutdown command fails second will be run
        If $Shutdown = 0 Then _RunDos("Shutdown.exe /s /f")
    Else
        _SoundStop($Alarm)
        GUICtrlSetData($Inputtimer, "00:00:00")
        GUICtrlDelete($LabelApagar)
        GUICtrlDelete($lbl_text)
        GUICtrlSetData($LabelTime, $Datelabel & ": 00:00:00")
        GUICtrlSetData($LabelDias, $Dayslabel & ": 0")
        GUICtrlSetData($LabelMeses, $Monthslabel & ": 0")
        GUICtrlSetData($LabelAnos, $Yearslabel & ": 0")
        Global $TimeSplit2[7] = ["cero", "uno", "dos", "tres", "cuatro", "cinco", "seis"]

    EndIf

EndFunc   ;==>Apagar2



Func Reiniciar()

    $Comboread2 = GUICtrlRead($idComboBox2, 0)


    If $Comboread2 = 0 And $Checked = True Then
        MsgBox($MB_SYSTEMMODAL, $Warninglabel, $selectalarmtime, 10)
        Return
    EndIf


    If $Comboread2 = 0 Then ControlDisable($GLOBAL_MAIN_GUI, "", $Toggle1)

    ControlDisable($GLOBAL_MAIN_GUI, "", $idComboBox2)
    ControlDisable($GLOBAL_MAIN_GUI, "", $GUI_CLOSE_BUTTON)
    ControlDisable($GLOBAL_MAIN_GUI, "", $GUI_MENU_BUTTON)
    ControlDisable($GLOBAL_MAIN_GUI, "", $idDate)
    ControlDisable($GLOBAL_MAIN_GUI, "", $idDate2)

    ;Checking Alarm time

    $Comboread2 = GUICtrlRead($idComboBox2, 0)

    If $Comboread2 = "15 Segundos" Or $Comboread2 = "15 Seconds" Then $aAlarmTime = $15s
    If $Comboread2 = "30 Segundos" Or $Comboread2 = "30 Seconds" Then $aAlarmTime = $30s
    If $Comboread2 = "45 Segundos" Or $Comboread2 = "45 Seconds" Then $aAlarmTime = $45s
    If $Comboread2 = "1 Minuto" Or $Comboread2 = "1 Minute" Then $aAlarmTime = $1m
    If $Comboread2 = "1 Minuto y Medio" Or $Comboread2 = "1 Minute and 1/2" Then $aAlarmTime = $1mm
    If $Comboread2 = "2 Minutos" Or $Comboread2 = "2 Minutes" Then $aAlarmTime = $2m
    If $Comboread2 = "3 Minutos" Or $Comboread2 = "3 Minutes" Then $aAlarmTime = $3m


    ;setting labels de advertencia
    Global $lbl_text = GUICtrlCreateLabel($s_text, 160, 159, 85, 17, $SS_CENTER, $GUI_WS_EX_PARENTDRAG)
    GUICtrlSetColor($lbl_text, 0xff0000) ; Red
    GUICtrlSetFont($lbl_text, 9, 700)
    ;
    Global $LabelReiniciar = GUICtrlCreateLabel($thesystem, 240, 160, 125, 20, $SS_CENTER, $GUI_WS_EX_PARENTDRAG)
    GUICtrlSetColor(-1, 0xFFFFFF)

    GUICtrlSetResizing($lbl_text, 768 + 2 + 32)
    GUICtrlSetResizing($LabelReiniciar, 768 + 2 + 32)

    Global $hGIF = _GUICtrlCreateGIF($WorkingPath & "\spinner.gif", "", 190, 280, 90, 90)
    GUICtrlSetResizing($hGIF, 768 + 2 + 32)

    If $Ditails = False Then
        _GIF_PauseAnimation($hGIF)
    EndIf


    $Tiempo = $iDateCalc

    Call("Reiniciar2")

    ControlEnable($GLOBAL_MAIN_GUI, "", $idComboBox2)
    ControlEnable($GLOBAL_MAIN_GUI, "", $Toggle1)
    ControlEnable($GLOBAL_MAIN_GUI, "", $GUI_CLOSE_BUTTON)
    ControlEnable($GLOBAL_MAIN_GUI, "", $GUI_MENU_BUTTON)
    ControlEnable($GLOBAL_MAIN_GUI, "", $idDate)
    ControlEnable($GLOBAL_MAIN_GUI, "", $idDate2)

    GUICtrlDelete($LabelReiniciar)
    GUICtrlDelete($lbl_text)
    _GIF_DeleteGIF($hGIF)

EndFunc   ;==>Reiniciar






Func Reiniciar2()



    ;Checking if timer is greater than 0
    ;If TimerDiff($timer) > 0 Then
    $timer = TimerInit()


    ;EndIf




    While (TimerDiff($timer) < $Tiempo)



        ;Setting Toggle
        _Metro_HoverCheck_Loop($GLOBAL_MAIN_GUI) ;To make sure that the hover effects still work
        $nMsg = GUIGetMsg()
        Switch $nMsg

            Case $Checkbox1

                If _Metro_CheckboxIsChecked($Checkbox1) Then
                    _Metro_CheckboxUnCheck($Checkbox1)
                    _GIF_PauseAnimation($hGIF)
                    contract()
                Else
                    _Metro_CheckboxCheck($Checkbox1)
                    expand()
                    _GIF_ResumeAnimation($hGIF)
                EndIf


            Case $Toggle1
                If _Metro_ToggleIsChecked($Toggle1) Then
                    _Metro_ToggleUnCheck($Toggle1)

                    $Checked = False
                Else
                    _Metro_ToggleCheck($Toggle1)

                    $Checked = True
                EndIf

            Case $GUI_MINIMIZE_BUTTON
                GUISetState(@SW_MINIMIZE)

            Case $Button3
                ControlEnable($GLOBAL_MAIN_GUI, "", $idComboBox2)
                ControlEnable($GLOBAL_MAIN_GUI, "", $Toggle1)
                ControlEnable($GLOBAL_MAIN_GUI, "", $GUI_CLOSE_BUTTON)
                ControlEnable($GLOBAL_MAIN_GUI, "", $GUI_MENU_BUTTON)
                ControlEnable($GLOBAL_MAIN_GUI, "", $idDate)
                ControlEnable($GLOBAL_MAIN_GUI, "", $idDate2)

                ExitLoop

        EndSwitch



        $seconds = TimerDiff($timer) / 1000
        $diff = $seconds - ($Tiempo / 1000)
        ;
        $minutes = Int($diff / 60)
        $secondsRem = $diff - ($minutes * 60)
        ;
        $hours = Int($minutes / 60)
        $minutes = $minutes - ($hours * 60)

        ;
        $hours = $hours * -1
        $minutes = $minutes * -1
        $secondsRem = $secondsRem * -1

        ;

        $time = StringFormat("%02d", $hours) & ":" & StringFormat("%02d", $minutes) & ":" & StringFormat("%02d", $secondsRem)
        ;
        GUICtrlSetData($Inputtimer, $time)


        $Tiempo2 = $Tiempo

        $seconds2 = TimerDiff($timer) / 1000
        $diff2 = $seconds2 - ($Tiempo2 / 1000)
        ;
        $minutes2 = Int($diff2 / 60)
        $secondsRem2 = $diff2 - ($minutes2 * 60)
        ;
        $hours2 = Int($minutes2 / 60)
        $minutes2 = $minutes2 - ($hours2 * 60)
        ;
        $ExactDay = Int($hours2 / 24)
        $hours2 = $hours2 - ($ExactDay * 24)
        ;
        $ExactMonth = Int($ExactDay / 30.4375)
        $ExactDay = $ExactDay - ($ExactMonth * 30.4375)
        ;
        $ExactYear = Int($ExactMonth / 12)
        $ExactMonth = $ExactMonth - ($ExactYear * 12)
        ;

        $ExactYear = $ExactYear * -1
        $ExactMonth = $ExactMonth * -1
        $ExactDay = $ExactDay * -1
        $hours2 = $hours2 * -1
        $minutes2 = $minutes2 * -1
        $secondsRem2 = $secondsRem2 * -1


        $time2 = StringFormat("%01d", $ExactYear) & ":" & StringFormat("%01d", $ExactMonth) & ":" & StringFormat("%01d", $ExactDay) & ":" & StringFormat("%02d", $hours2) & ":" & StringFormat("%02d", $minutes2) & ":" & StringFormat("%02d", $secondsRem2)

        $TimeSplit = StringSplit($time2, ":")
        If $TimeSplit2[6] <> $TimeSplit[6] Then GUICtrlSetData($LabelTime, $Datelabel & $TimeSplit[4] & ":" & $TimeSplit[5] & ":" & $TimeSplit[6])
        If $TimeSplit2[3] <> $TimeSplit[3] Then GUICtrlSetData($LabelDias, $Dayslabel & ": " & $TimeSplit[3])
        If $TimeSplit2[2] <> $TimeSplit[2] Then GUICtrlSetData($LabelMeses, $Monthslabel & ": " & $TimeSplit[2])
        If $TimeSplit2[1] <> $TimeSplit[1] Then GUICtrlSetData($LabelAnos, $Yearslabel & ": " & $TimeSplit[1])

        $TimeSplit2 = $TimeSplit

        ;Checks if timer is higher than 3mins and If box is checked plays Sound
        If TimerDiff($timer) > $Tiempo - $aAlarmTime And $Checked = True Then _SoundPlay($Alarm, 0) ;MsgBox(0,"Aviso","Alarma",5)


        ;Checks if timer is higher than 3mins and If box is not checked stops Sound

        If TimerDiff($timer) > $Tiempo - $aAlarmTime And $Checked = False Then _SoundStop($Alarm)






        ; Blinking Text





        If @SEC <> $sec Then
            $sec = @SEC
            If $RED Then
                GUICtrlSetColor($lbl_text, 0xffffff)
            Else
                GUICtrlSetColor($lbl_text, 0xff0000)
            EndIf
            $RED = Not $RED
        EndIf




    WEnd





    $Readtimer = GUICtrlRead($Inputtimer, 0)
    If $Readtimer = "00:00:00" Then
        _GIF_PauseAnimation($hGIF)
        _SoundStop($Alarm)
        If $Spanish = True Then
            If MsgBox($MB_ICONWARNING + $MB_YESNO + $MB_TOPMOST + $MB_SYSTEMMODAL, "Aviso", "El Tiempo ha Terminado" & @LF & "Desea Continuar?" & @LF & "Presione el boton (NO) para Abortar!" & @LF & "Si no presionas nada El Sistema se Reiniciara en Menos de 10 Segundos", 10) = 7 Then Return

        Else
            If MsgBox($MB_ICONWARNING + $MB_YESNO + $MB_TOPMOST + $MB_SYSTEMMODAL, "Warning", "The time has ended" & @LF & "Would you like to continue?" & @LF & "Press (NO) to Abort!" & @LF & "If ypu don't press anything the system will restart in 10 seconds", 10) = 7 Then Return
        EndIf

        _SoundStop($Alarm)
        DirRemove($WorkingPath, 1)
        $Shutdown = Shutdown(2 + 4 + 16)
        ;If first shutdown command fails second will be run
        If $Shutdown = 0 Then _RunDos("Shutdown.exe /r /f")
    Else
        _SoundStop($Alarm)
        GUICtrlSetData($Inputtimer, "00:00:00")
        GUICtrlDelete($LabelReiniciar)
        GUICtrlDelete($lbl_text)
        GUICtrlSetData($LabelTime, $Datelabel & ": 00:00:00")
        GUICtrlSetData($LabelDias, $Dayslabel & ": 0")
        GUICtrlSetData($LabelMeses, $Monthslabel & ": 0")
        GUICtrlSetData($LabelAnos, $Yearslabel & ": 0")
        Global $TimeSplit2[7] = ["cero", "uno", "dos", "tres", "cuatro", "cinco", "seis"]

    EndIf


EndFunc   ;==>Reiniciar2


Func Abortar()
    DirRemove($WorkingPath, 1)

    Exit

EndFunc   ;==>Abortar




Func Message()

    $Comboread2 = GUICtrlRead($idComboBox2, 0)

    If $Comboread2 = $select Then _Metro_MsgBox(0, $Warninglabel, $selectalarmtime, 300, 11, $GLOBAL_MAIN_GUI)

EndFunc   ;==>Message


Func Update()

    If @Compiled Then

        $iPing = Ping("google.com", 6000)

        If $iPing = 0 Then
            If Spanish = True Then
                MsgBox($MB_SYSTEMMODAL, "Update Utility", "Error de conexion!" & @LF & "No me logro comunicar con El Internet ):")
            Else
                MsgBox($MB_SYSTEMMODAL, "Update Utility", "Connexion Error!" & @LF & "Couln,t connect to the internet ):")
            EndIf
            Return
        Else

            $my_url = "https://drive.google.com/open?id=1-pabsEiu7q7_gKw0X2YB5wchNTOebdDp"

            ShellExecute($my_url)

            If $Spanish = True Then
                MsgBox($MB_TOPMOST, "Update Utility", "Descarga la version mas nueva desde tu navegador.")
            Else
                MsgBox($MB_TOPMOST, "Update Utility", "Download the new version from your browser.")
            EndIf

        EndIf


    Else

        MsgBox(0, "Aviso", "App not Compiled", 0)

        Return
    EndIf



EndFunc   ;==>Update



Func Contactar()

    $YesNoContact = _Metro_MsgBox(4, $Warninglabel, $YesNoContactlabel, 500, 11, $GLOBAL_MAIN_GUI)
    If $YesNoContact = "Yes" Then





        $iPing = Ping("google.com", 6000)

        If $iPing = 0 Then
            If $Spanish = True Then
                MsgBox($MB_SYSTEMMODAL, "Aviso", "Error de conexion!" & @LF & "No me logro comunicar con El Internet ):")
            Else
                MsgBox($MB_SYSTEMMODAL, "Aviso", "Connexion Error!" & @LF & "Couln't connect to the internet ):")
            EndIf
            Return
        EndIf



        #Region ### START Koda GUI section ### Form=

        $Form3 = _Metro_CreateGUI("Mail Utility", 500, 265, 100, 118, False, $GLOBAL_MAIN_GUI)

        $GroupBox1 = GUICtrlCreateGroup("", 5, 8, 473, 193)
        GUICtrlSetState(-1, $GUI_DISABLE)
        $Label1 = GUICtrlCreateLabel($formulario3label1, 20, 24, 428, 17, $SS_CENTER)
        GUICtrlSetColor(-1, 0xFFFFFF)
        GUICtrlSetFont($Label1, 9, 700)
        $Label2 = GUICtrlCreateLabel($formulario3label2, 20, 64, 428, 17, $SS_CENTER)
        GUICtrlSetColor(-1, 0xFFFFFF)
        GUICtrlSetFont($Label2, 9, 700)
        $Label11 = GUICtrlCreateLabel($formulario3label3, 20, 93, 128, 17, $SS_CENTER)
        GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
        GUICtrlSetColor(-1, 0xFFFFFF)
        $InputnName = GUICtrlCreateInput("", 20, 107, 150, 20)
        $Label12 = GUICtrlCreateLabel($formulario3label4, 317, 93, 128, 17, $SS_CENTER)
        GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
        GUICtrlSetColor(-1, 0xFFFFFF)
        $InputEmail = GUICtrlCreateInput("", 317, 107, 150, 20)
        $Label13 = GUICtrlCreateLabel($formulario3label5, 180, 133, 128, 17, $SS_CENTER)
        GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
        GUICtrlSetColor(-1, 0xFFFFFF)
        $InputMesage = GUICtrlCreateInput("", 20, 147, 445, 30)

        $ButtonListo = _Metro_CreateButtonEx($formulario3botonlabel, 123, 208, 75, 25, 0)

        $ButtonCancelar = _Metro_CreateButtonEx($formulario3botonlabel2, 297, 208, 75, 25, 0)

        GUISetState(@SW_SHOW)
        #EndRegion ### END Koda GUI section ###

        While 1
            $About = GUIGetMsg()
            Switch $About
                Case $GUI_EVENT_CLOSE
                    GUIDelete($Form2)
                    ExitLoop


                Case $ButtonCancelar
                    GUIDelete($Form3)
                    ExitLoop

                Case $ButtonListo


                    Global $readEmail = GUICtrlRead($InputEmail)



                    $readName = GUICtrlRead($InputnName)



                    $readMesage = GUICtrlRead($InputMesage)

                    If $readEmail = "" Or $readName = "" Or $readMesage = "" Then

                        If $Spanish = True Then
                            _Metro_MsgBox(0, "Aviso", "Llene Todas las Cajitas en El Formulario", 300, 11, $GLOBAL_MAIN_GUI)
                        Else
                            _Metro_MsgBox(0, "Attention!", "Fill all the boxes in the Form", 300, 11, $GLOBAL_MAIN_GUI)
                        EndIf

                    Else

                        _IsValidEmail()
                        If $Update = True Then
                            $Body = "Nombre: " & $readName & @LF & "E-mail: " & $readEmail & @LF & "Mensaje: " & $readMesage
                            GUIDelete($Form3)
                            SendEmail()
                            ExitLoop
                        EndIf
                    EndIf

            EndSwitch


        WEnd








    Else
        _Metro_MsgBox(0, $Warninglabel, $Decidedlabel, 300, 11, $GLOBAL_MAIN_GUI)
    EndIf



EndFunc   ;==>Contactar

Func _IsValidEmail()
    If StringRegExp($readEmail, "^([a-zA-Z0-9_\-])([a-zA-Z0-9_\-\.]*)@(\[((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}|((([a-zA-Z0-9\-]+)\.)+))([a-zA-Z]{2,}|(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\])$") Then

        ping2()

    Else
        If $Spanish = True Then
            _Metro_MsgBox(0, "Aviso", "Error, Correo electronico invalido!" & @LF & $readEmail & " no es un correo electronico valido" & @LF & "Ingrese un correo electronico valido!" & @LF & " Ejamplo: manuelcipote31@gmail.com", 300, 11, $GLOBAL_MAIN_GUI)
        Else
            _Metro_MsgBox(0, "Warning!", "Error, Invalid E-mail!" & @LF & $readEmail & " is not a valid E-mail" & @LF & "Plaese input a valid E-mail!" & @LF & " Exmaple: manuelcipote31@gmail.com", 300, 11, $GLOBAL_MAIN_GUI)
        EndIf
    EndIf
EndFunc   ;==>_IsValidEmail


Func ping2()

    $iPing = Ping("google.com", 6000)

    If $iPing = 0 Then
        If $Spanish = True Then
            MsgBox($MB_SYSTEMMODAL, "Aviso", "Error de conexion!" & @LF & "El mensaje no se puede enviar ):" & @LF & "No me logro comunicar con El Internet ):")
        Else
            MsgBox($MB_SYSTEMMODAL, "Attention", "Connexion Error!" & @LF & "Your message can't be sent ):" & @LF & "couldn't connect to the internet ):")
        EndIf
        Return
    Else
        $Update = True
    EndIf


EndFunc   ;==>ping2




Func Acerca()


    #Region ### START Koda GUI section ### Form=

    $Form2 = _Metro_CreateGUI("About", 489, 265, 1, 118, False, $GLOBAL_MAIN_GUI)

    $GroupBox1 = GUICtrlCreateGroup("", 5, 8, 473, 193)
    GUICtrlSetState(-1, $GUI_DISABLE)
    $Image1 = GUICtrlCreatePic($WorkingPath & "\Capture10.jpg", 16, 24, 127, 114)
    GUICtrlSetState(-1, $GUI_DISABLE)
    $Label1 = GUICtrlCreateLabel($ProductNamelabel, 152, 24, 308, 17)
    GUICtrlSetColor(-1, 0xFFFFFF)
    $Label2 = GUICtrlCreateLabel("Version 3.0.2.0, 11.15.2017", 152, 48, 207, 17)
    GUICtrlSetColor(-1, 0xFFFFFF)
    $Label3 = GUICtrlCreateLabel($Label3label, 16, 160, 451, 17)
    GUICtrlSetColor(-1, 0xFFFFFF)
    $Label4 = GUICtrlCreateLabel($Label4label, 16, 180, 451, 17)
    GUICtrlSetColor(-1, 0xFFFFFF)
    $Label5 = GUICtrlCreateLabel($Label5label, 16, 136, 267, 17)
    GUICtrlSetColor(-1, 0xFFFFFF)
    $Label6 = GUICtrlCreateLabel($Label6label, 149, 80, 131, 17)
    GUICtrlSetColor(-1, 0xFFFFFF)

    $ButtonOk = _Metro_CreateButtonEx("OK", 124, 208, 75, 25, 0)

    GUISetState(@SW_SHOW)
    #EndRegion ### END Koda GUI section ###

    While 1
        $About = GUIGetMsg()
        Switch $About
            Case $GUI_EVENT_CLOSE
                GUIDelete($Form2)
                ExitLoop


            Case $ButtonOk
                GUIDelete($Form2)
                ExitLoop

        EndSwitch


    WEnd


EndFunc   ;==>Acerca
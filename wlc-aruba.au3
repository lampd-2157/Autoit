#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:  pham.duy.lam@sun-asterisk.com

#ce ----------------------------------------------------------------------------

#include <GUICONSTANTS.AU3>
#include <Constants.au3>
#include <WindowsConstants.au3>
#include "ColorConstants.au3"
#include <FontConstants.au3>
#include <GUIConstantsEx.au3>
#include <DateTimeConstants.au3>
#include <Date.au3>

HotKeySet("{ESC}", "EndProgram")

$MAIN = GUICreate("WLC-ARUBA ", 420, 360)

$guide = GUICtrlCreateLabel("CLICK VIEW USER GUIDE!", 15, 20, 165, 25)
GUICtrlSetFont($guide,9,400,4)
GUICtrlSetColor($guide, $COLOR_BLUE)
GUICtrlSetTip($guide, "Hướng dẫn sử dụng công cụ")


GUICtrlCreateLabel("USERNAME:", 15, 60, 65, 25)
$username = GUICtrlCreateInput("FF:FF:FF:FF:FF", 100, 55, 298, 25)
GUICtrlSetTip($username, "Nhập đúng format MAC Address (hexa) | Staff: FF:FF | Manager: FF-FF")

GUICtrlCreateLabel("PASSWORD:", 15, 100, 65, 25)
$password = GUICtrlCreateInput("<same username>", 100, 95, 298, 25)
GUICtrlSetFont($password,9,400,2)
GUICtrlSetTip($password, "local user: password trùng với username | guest: tạo password cho user guest ")

GUICtrlCreateLabel("ROLE:", 15, 140, 65, 25)
$role =  GUICtrlCreateCombo ("Choice role option..." ,100, 135,298, 25)
GUICtrlSetData (-1 , "STAFF|MANAGER|GUEST")

GUICtrlCreateLabel("EMAIL:", 15, 180, 65, 25)
$email = GUICtrlCreateInput("abc@example.com", 100, 175, 298, 25)
GUICtrlSetTip($email, "Nhập email Sun* ")

GUICtrlCreateLabel("EXPIRY:", 15, 220, 65, 25)
$expiry = GUICtrlCreateCombo ("Choice expiry option..." ,100, 215, 133, 25)
GUICtrlSetData (-1 , "Set duration in minutes|Set time will expire")
GUICtrlCreateLabel("START DATE:", 15, 260, 95, 25)

$start_date = GUICtrlCreateDate ("START DATE:", 100, 255, 298, 25,$WS_TABSTOP)
GUICtrlSetTip($start_date, "Thời gian username sẽ active")

$CHECK = GUICtrlCreateButton("CHECK", 15, 300, 85, 25)
$OK = GUICtrlCreateButton("PLAY", 115, 300, 85, 25)
$DELETE = GUICtrlCreateButton("DELETE USER", 315, 300, 85, 25)
$EDIT = GUICtrlCreateButton("EDIT USER", 215, 300, 85, 25)

GUICtrlCreateLabel("Copyright by Lâm Phạm", 288, 340, 120, 25)
GUICtrlSetFont($DELETE,5, $FW_BOLD)

GUICtrlSetBkColor($OK, $COLOR_GREEN)
GUICtrlSetColor($OK, $COLOR_WHITE)
GUICtrlSetFont($OK,9, $FW_BOLD)

GUICtrlSetBkColor($DELETE, $COLOR_RED)
GUICtrlSetColor($DELETE, $COLOR_WHITE)
GUICtrlSetFont($DELETE,9, $FW_BOLD)

GUICtrlSetBkColor($EDIT, $COLOR_BLUE)
GUICtrlSetColor($EDIT, $COLOR_WHITE)
GUICtrlSetFont($EDIT,9, $FW_BOLD)

GUICtrlSetBkColor($CHECK, 0xff9933)
GUICtrlSetColor($CHECK, $COLOR_WHITE)
GUICtrlSetFont($CHECK,9, $FW_BOLD)

;Main GUI
GUISetState()

$flag = 1

While 1
    $MSG = GUIGetMsg()

    Select
	  Case $MSG = $guide
			ShellExecute("https://sal.vn/XctNAu")
	  Case $MSG = $GUI_EVENT_CLOSE ; Or $MSG = $CANCEL
			Exit
	  Case $MSG = $expiry
		   If GUICtrlRead($expiry) = "Set duration in minutes" Then
				 $set = GUICtrlCreateLabel("duration ", 240, 220, 50, 25)
			  If $flag = 0 Then
				 GUICtrlDelete($time)
				 EndIf
			  $time = GUICtrlCreateInput("", 290, 215, 108, 20)
			  $flag = 0
			  $hour = ""
			ElseIf GUICtrlRead($expiry) = "Set time will expire" Then
				 $set = GUICtrlCreateLabel("time ", 240, 220, 50, 25)
			  If $flag = 0 Then
				 GUICtrlDelete($time)
				 EndIf
			  $time = GUICtrlCreateDate ("", 290, 215, 108, 20,$WS_TABSTOP)
			  $flag=0
			  $hour = " 00:00"
		   EndIf
	  Case $MSG = $role
			If GUICtrlRead($role) = "MANAGER" Then
			   $rol = "SUN-vlan10-manager"
			ElseIf GUICtrlRead($role) = "STAFF" Then
			   $rol = "SUN-vlan3-staff"
			ElseIf GUICtrlRead($role) = "GUEST" Then
			   $rol = "guest"
			EndIf
	  Case $MSG = $CHECK
			$ktra = GUICreate("SEARCH LOCAL-USERDB ", 320, 236)

			GUICtrlCreateLabel("KEYWORD:", 15, 60, 125, 25)
			$filter = GUICtrlCreateInput("", 90, 55, 158, 25)
			GUICtrlSetTip($filter, "Nhập thông tin cần tìm kiếm")

			$SEARCH = GUICtrlCreateButton("SEACH", 55, 200, 85, 25)
			$CANCEL = GUICtrlCreateButton("CANCEL", 200, 200, 85, 25)

			GUISetState ()
			   While 1
			   $MSG1 = GUIGetMsg()

				  Select
					 Case $MSG1 = $GUI_EVENT_CLOSE Or $MSG1 = $CANCEL
						GUIDelete($ktra)
						ExitLoop

					 Case $MSG1 = $SEARCH
						Run("C:\Program Files\PuTTY\plink.exe -no-antispoof -ssh 192.168.99.253 -l lampd -pw 123321" )
						Sleep(1000)
						Send ("show local-userdb | include "& GUICtrlRead($filter) & @CRLF )
						Sleep(1000)
				  EndSelect
			   WEnd

	  Case $MSG = $DELETE
			Run("C:\Program Files\PuTTY\plink.exe -no-antispoof -ssh 192.168.99.253 -l lampd -pw 123321" )
			Sleep(1000)
			Send ("local-userdb del username "& GUICtrlRead($username))
			Sleep(1000)

	  Case $MSG = $EDIT
			Run("C:\Program Files\PuTTY\plink.exe -no-antispoof -ssh 192.168.99.253 -l lampd -pw 123321" )
			Sleep(1000)
			$code = "local-userdb modify username "&GUICtrlRead($username)& " password " &GUICtrlRead($password)& " role " & $rol & " email " &GUICtrlRead($email)&  " expiry " &GUICtrlRead($set)&GUICtrlRead($time)& $hour & " start-time " &GUICtrlRead($start_date) & " 00:00"
			Send ($code)
			Sleep(1000)

      Case $MSG = $OK
			Run("C:\Program Files\PuTTY\plink.exe -no-antispoof -ssh 192.168.99.253 -P 22 -l lampd -pw 123321")
			Sleep(1000)
			$code = "local-userdb add username " & GUICtrlRead($username) & " password " &GUICtrlRead($password) & " role " & $rol & " email " &GUICtrlRead($email)&  " expiry " &GUICtrlRead($set)&GUICtrlRead($time) & $hour &  " start-time " &GUICtrlRead($start_date) & " 00:00"
			Send ($code)
			Sleep(1000)

    EndSelect

WEnd  ;==>EndWhile

;Exit Program with HotKey
Func EndProgram()
    Exit
 EndFunc   ;==>EndProgram


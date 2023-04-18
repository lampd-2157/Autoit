#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=C:\Users\pham.duy.lam\Downloads\favicon.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

 AutoIt Version 03: 05.04.2023
 Author:  pham.duy.lam@sun-asterisk.com

#ce ----------------------------------------------------------------------------

#include <GUICONSTANTS.AU3>
#include <Constants.au3>
#include <WindowsConstants.au3>
#include "ColorConstants.au3"
#include <FontConstants.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <DateTimeConstants.au3>
#include <Date.au3>

HotKeySet("{ESC}", "EndProgram")

$MAIN = GUICreate("WLC-ARUBA ", 450, 420)


<<<<<<< HEAD

=======
>>>>>>> ee6a5fe0f91b7b4b1baf5ba5d0623b1551263c52
;---------Tạo các thông tin Label---------
$guide = GUICtrlCreateLabel("CLICK VIEW USER GUIDE!", 15, 30, 165, 25)
GUICtrlSetFont($guide,9,400,4)
GUICtrlSetColor($guide, $COLOR_BLUE)
GUICtrlSetTip($guide, "Hướng dẫn sử dụng công cụ")

GUICtrlCreateLabel("MAC ADDRESS:", 15, 100, 100, 30)
$username = GUICtrlCreateInput("FF:FF:FF:FF:FF", 100, 94, 298, 25)
GUICtrlSetTip($username, "Nhập đúng format MAC Address (hexa) | Staff: FF:FF | Manager: FF-FF")

GUICtrlCreateLabel("ROLE:", 15, 140, 65, 25)
$role =  GUICtrlCreateCombo ("Choice role option..." ,100,135,298,25)
GUICtrlSetData (-1 , "STAFF|MANAGER")

GUICtrlCreateLabel("EMAIL:", 15, 180, 65, 25)
$email = GUICtrlCreateInput("abc@example.com", 100, 175, 298, 25)
GUICtrlSetTip($email, "Nhập email Sun* ")

GUICtrlCreateLabel("SPONSOR:", 15, 220, 65, 25)
$sponsor_name = GUICtrlCreateInput("", 100, 215, 298, 25)
GUICtrlSetTip($sponsor_name, "Nhập sponsor-name để hiển thị Description")

GUICtrlCreateLabel("EXPIRY:", 15, 260, 65, 25)
$expiry = GUICtrlCreateCombo ("Choice expiry option..." ,100, 255, 133, 25)
GUICtrlSetData (-1 , "Set duration in minutes|Set time will expire")

GUICtrlCreateLabel("START DATE:", 15, 300, 95, 25)
$start_date = GUICtrlCreateDate ("START DATE:", 100, 295, 298, 25,$WS_TABSTOP)
GUICtrlSetTip($start_date, "Thời gian username sẽ active")

$GUEST = GUICtrlCreateButton("Create Guest ID", 278, 30, 120, 25)
$CHECK = GUICtrlCreateButton("CHECK", 15, 350, 85, 25)
$OK = GUICtrlCreateButton("PLAY", 115, 350, 85, 25)
$EDIT = GUICtrlCreateButton("EDIT USER", 215, 350, 85, 25)
$DELETE = GUICtrlCreateButton("DELETE USER", 315, 350, 85, 25)



;------Tạo nút checkbox-------
$box_expiry = GUICtrlCreateCheckbox("",405,255,25,25)
GUICtrlSetState($box_expiry, $GUI_UNCHECKED)
$box_start = GUICtrlCreateCheckbox("",405,295,25,25)
GUICtrlSetState($box_start, $GUI_UNCHECKED)


GUICtrlCreateLabel("Copyright by Lâm Phạm", 328, 396, 120, 20)
;GUICtrlSetFont(-1,8,$GUI_FONTITALIC)

;-----Set Font cho các Button--------
GUICtrlSetBkColor($GUEST, 0x32CD32)
GUICtrlSetColor($GUEST, 0x660000)
GUICtrlSetFont($GUEST,9, $FW_BOLD)

GUICtrlSetBkColor($OK, 0x009999)
GUICtrlSetColor($OK, $COLOR_WHITE)
GUICtrlSetFont($OK,9, $FW_BOLD)

GUICtrlSetBkColor($DELETE, 0xEE2C2C)
GUICtrlSetColor($DELETE, $COLOR_BLACK)
GUICtrlSetFont($DELETE,9, $FW_BOLD)

GUICtrlSetBkColor($EDIT, 0x1874CD)
GUICtrlSetColor($EDIT, $COLOR_WHITE)
GUICtrlSetFont($EDIT,9, $FW_BOLD)

GUICtrlSetBkColor($CHECK, 0xEEAD0E)
GUICtrlSetColor($CHECK, $COLOR_WHITE)
GUICtrlSetFont($CHECK,9, $FW_BOLD)

;------Main GUI-------
GUISetState()

$flag = 1
$flag1 = 1
$temp = 0
Global $password,$time,$expiry_time,$start_time,$set,$hour,$pass_user,$sponsor_name_user,$temp, $email_user
Global $user_guest_ID, $pass_guest_ID
Local $user_guest_1, $pass_guest_1, $sponsor_guest_1,$date
Local $today = _DateToDayValue(@YEAR,@MON,@MDAY),$Y, $M, $D

While 1
    $MSG = GUIGetMsg()

    Select
	  	Case $MSG = $guide
			ShellExecute("https://sal.vn/XctNAu")
		Case $MSG = $GUI_EVENT_CLOSE ; Or $MSG = $CANCEL
			Exit

		Case $MSG = $role
			If GUICtrlRead($role) == "MANAGER" Then
				$role_user = " role SUN-vlan10-manager"
			ElseIf GUICtrlRead($role) == "STAFF" Then
				$role_user = " role SUN-vlan3-staff"
<<<<<<< HEAD
=======
			ElseIf GUICtrlRead($role) == "GUEST" Then
				$role_user = " role guest"
>>>>>>> ee6a5fe0f91b7b4b1baf5ba5d0623b1551263c52
			EndIf
		Case $MSG = $email
			If GUICtrlRead($email) == "" Or GUICtrlRead($email) == "abc@example.com" Then
				$email_user = ""
			ElseIf GUICtrlRead($email) <> "" Then
				$email_user = " email " & GUICtrlRead($email)
			EndIf
	  	Case $MSG = $sponsor_name
			If GUICtrlRead($sponsor_name) == "" Then
				$sponsor_name_user = ""
			ElseIf GUICtrlRead($sponsor_name) <> "" Then
				$sponsor_name_user = " sponsor-name " & GUICtrlRead($sponsor_name)
			EndIf

	  	Case $MSG = $expiry
			If GUICtrlRead($expiry) == "Set duration in minutes" Then
				$set = GUICtrlCreateLabel("duration ", 240, 260, 50, 25)
				If $flag = 0 Then
					GUICtrlDelete($time)
			  	EndIf
				$time = GUICtrlCreateInput("", 290, 255, 108, 20,$ES_NUMBER)
				$flag = 0
				$hour = ""
			ElseIf GUICtrlRead($expiry) == "Set time will expire" Then
				$set = GUICtrlCreateLabel(" time ", 240, 260, 50, 25)
				If $flag = 0 Then
					GUICtrlDelete($time)
				EndIf
				$time = GUICtrlCreateDate ("", 290, 255, 108, 20,$WS_TABSTOP)
				$flag=0
				$hour = _NowTime(4)
				EndIf

;Chạy khi click button "CREATE GUEST ID"
		Case $MSG = $GUEST
				$guest_create = GUICreate("CREATE GUEST ID ", 350, 330)

				GUICtrlCreateLabel("Note: Nên chọn generate cho các tài khoản Guest", 15, 300, 300, 25)

				GUICtrlCreateLabel("USERNAME", 15, 40, 100, 25)
				$user_guest = GUICtrlCreateCombo("generate-username", 100, 35, 120, 25)
				GUICtrlSetData (-1 , "username")
				GUICtrlSetTip($user_guest, "Chọn tùy chọn phù hợp (khuyến khích genarate-username) ")

				GUICtrlCreateLabel("PASSWORD", 15, 80, 100, 25)
				$pass_guest = GUICtrlCreateCombo("generate-password", 100, 75, 120, 25)
				GUICtrlSetData (-1 , "password")
				GUICtrlSetTip($pass_guest, "Chọn tùy chọn phù hợp (khuyến khích genarate-password) ")

				GUICtrlCreateLabel("SPONSOR", 15, 120, 100, 25)
				$sponsor_guest = GUICtrlCreateInput("", 100, 115, 230, 25)
				GUICtrlSetTip($sponsor_guest, "Description cho user ")

				GUICtrlCreateLabel("THỜI HẠN:", 15, 160, 100, 25)
				$expire_guest = GUICtrlCreateCombo("1 Day", 100, 155, 230, 25)
				GUICtrlSetData (-1 , "3 Day|7 Day|1 Month|3 Month|6 Month")
				GUICtrlSetTip($expire_guest, "Chọn thời hạn sử dụng cho user ")

				$CREATE = GUICtrlCreateButton("CREATE", 15, 220, 85, 25)
				$CANCEL = GUICtrlCreateButton("CANCEL",235, 220, 85, 25)
				$MODIFY = GUICtrlCreateButton("MODIFY", 130, 220, 80, 25)

				GUICtrlSetFont($CREATE,9, $FW_BOLD)
				GUICtrlSetBkColor($CREATE, 0x009999)
				GUICtrlSetColor($CREATE, $COLOR_WHITE)

				GUICtrlSetFont($CANCEL,9, $FW_BOLD)
				GUICtrlSetFont($MODIFY,9, $FW_BOLD)

				GUISetState ()
					While 1
						$MSG1 = GUIGetMsg()

					   Select
							Case $MSG1 = $GUI_EVENT_CLOSE Or $MSG1 = $CANCEL
								GUIDelete($guest_create)
								ExitLoop

							Case $MSG1 = $user_guest
								If GUICtrlRead($user_guest) == "generate-username" Then
									GUICtrlDelete($user_guest_ID)
								ElseIf GUICtrlRead($user_guest) = "username" Then
									$user_guest_ID = GUICtrlCreateInput("", 230, 32, 100, 25)
								EndIf

							Case $MSG1 = $pass_guest
								If GUICtrlRead($pass_guest) == "generate-password" Then
									GUICtrlDelete($pass_guest_ID)
								ElseIf GUICtrlRead($pass_guest) = "password" Then
									$pass_guest_ID = GUICtrlCreateInput("", 230, 72, 100, 25)
								EndIf

						   Case $MSG1 = $sponsor_guest
								If GUICtrlRead($sponsor_guest) == ""   Then
									$sponsor_guest_1 = ""
								ElseIf GUICtrlRead($sponsor_guest) <> ""  Then
									$sponsor_guest_1 = " sponsor-name " & GUICtrlRead($sponsor_guest)
								EndIf

						   Case $MSG1 = $CREATE
								If GUICtrlRead($user_guest) <> "username" And GUICtrlRead($user_guest) <> "generate-username" Then
									MsgBox (0,"Warning!", "Kiểm tra lại thông tin username")
								ElseIf GUICtrlRead($pass_guest) <> "password" And GUICtrlRead($pass_guest) <> "generate-password" Then
									MsgBox (0,"Warning!", "Kiểm tra lại thông tin password")
								ElseIf GUICtrlRead($sponsor_guest) == ""   Then
									MsgBox (0,"Warning!", "Cần nhập thông tin SPONSOR !")
								ElseIf GUICtrlRead($sponsor_guest) <> ""  Then
									$temp = 1
								EndIf

								If GUICtrlRead($user_guest) == "generate-username" Then
									$user_guest_1 = " generate-username "
								ElseIf GUICtrlRead($user_guest) == "username" Then
									$user_guest_1 = " username " & GUICtrlRead($user_guest_ID)
								EndIf

								If GUICtrlRead($pass_guest) == "generate-password" Then
									$pass_guest_1 = " generate-password "
								ElseIf GUICtrlRead($pass_guest) == "password" Then
									$pass_guest_1 = " password " & GUICtrlRead($pass_guest_ID)
								EndIf

								If GUICtrlRead($expire_guest) == "1 Day" Then
									$expire_guest_1 = " expiry duration 1440"
								ElseIf GUICtrlRead($expire_guest) == "3 Day" Then
									$expire_guest_1 = " expiry duration 4320"
								ElseIf GUICtrlRead($expire_guest) == "7 Day" Then
									$expire_guest_1 = " expiry duration 10080"
								ElseIf GUICtrlRead($expire_guest) == "1 Month" Then
									$expire_guest_1 = " expiry duration 43200"
								ElseIf GUICtrlRead($expire_guest) == "3 Month" Then
									$expire_guest_1 = " expiry duration 129600"
								ElseIf GUICtrlRead($expire_guest) == "6 Month" Then
									$expire_guest_1 = " expiry duration 259200"
								EndIf

								If $temp==1 Then
									Run("C:\Program Files\PuTTY\plink.exe -no-antispoof -ssh 192.168.99.253 -l lampd -pw 123321" )
									Sleep(1000)
									Send ("local-userdb-guest add" & $user_guest_1 & $pass_guest_1 & $sponsor_guest_1 & $expire_guest_1 & @CRLF )
									Sleep(1000)
									Send ("show local-userdb-guest | include " & GUICtrlRead($user_guest_ID) & @CRLF )
									Sleep(1000)
								EndIf

							Case $MSG1 = $MODIFY
								If GUICtrlRead($user_guest) <> "username"  And GUICtrlRead($user_guest_ID) == "" Then
									MsgBox (0,"Warning!", "Yêu cầu phải nhập username")
								ElseIf GUICtrlRead($pass_guest) <> "password" And GUICtrlRead($pass_guest_ID) == "" Then
									MsgBox (0,"Warning!", "Yêu cầu phải nhập password")
								ElseIf GUICtrlRead($sponsor_guest) = ""   Then
									MsgBox (0,"Warning!", "Cần nhập thông tin SPONSOR !")
								ElseIf GUICtrlRead($sponsor_guest) <> ""  Then
								$temp =1
								EndIf

								If GUICtrlRead($expire_guest) == "1 Day" Then
									$date =_DayValueToDate($today+1, $Y, $M, $D)
								ElseIf GUICtrlRead($expire_guest) == "3 Day" Then
									$date =_DayValueToDate($today+3, $Y, $M, $D)
								ElseIf GUICtrlRead($expire_guest) == "7 Day" Then
									$date =_DayValueToDate($today+7, $Y, $M, $D)
								ElseIf GUICtrlRead($expire_guest) == "1 Month" Then
									$date =_DayValueToDate($today+30, $Y, $M, $D)
								ElseIf GUICtrlRead($expire_guest) == "3 Month" Then
									$date =_DayValueToDate($today+90, $Y, $M, $D)
								ElseIf GUICtrlRead($expire_guest) == "6 Month" Then
									$date =_DayValueToDate($today+180, $Y, $M, $D)
								EndIf

								$date = StringFormat("%02i/%02i/%04i", $M,  $D,  $Y)
								$expire_guest_1 = " expiry time " & $date & " " & _NowTime(4)

								$user_guest_1 = " username " & GUICtrlRead($user_guest_ID)
								$pass_guest_1 = " password " & GUICtrlRead($pass_guest_ID)

								If $temp ==1 Then
									Run("C:\Program Files\PuTTY\plink.exe -no-antispoof -ssh 192.168.99.253 -l lampd -pw 123321" )
									Sleep(1000)
									Send ("local-userdb-guest modify" & $user_guest_1 & $pass_guest_1 & $sponsor_guest_1 & $expire_guest_1 & @CRLF )
									Sleep(100)
									Send ("show local-userdb-guest | include " & GUICtrlRead($user_guest_ID) & @CRLF )
									Sleep(1000)
								EndIf

							EndSelect
					WEnd

	  	Case $MSG = $CHECK
			$ktra = GUICreate("SEARCH LOCAL-USERDB ", 320, 236)

			GUICtrlCreateLabel("KEYWORD:", 15, 60, 125, 25)
			$filter = GUICtrlCreateInput("", 90, 55, 158, 25)
			GUICtrlSetTip($filter, "Nhập thông tin cần tìm kiếm")

			$SEARCH = GUICtrlCreateButton("SEACH", 55, 200, 85, 25)
			$CANCEL = GUICtrlCreateButton("CANCEL", 200, 200, 85, 25)

			GUISetState ()
				While 1
					$MSG2 = GUIGetMsg()

					Select
						Case $MSG2 = $GUI_EVENT_CLOSE Or $MSG2 = $CANCEL
							GUIDelete($ktra)
						ExitLoop

						Case $MSG2 = $SEARCH
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
			If GUICtrlRead($username) == "" Then
					MsgBox (0,"Warning!", "Nhập lại địa chỉ MAC ADDRESS!")
			ElseIf GUICtrlRead($role) == "Choice role option..." Then
					MsgBox (0,"Warning!", "Yêu cầu nhập Role chính xác!")
			ElseIf GUICtrlRead($box_expiry)==$GUI_UNCHECKED  Then
				If GUICtrlRead($box_start)==$GUI_UNCHECKED Then
					$start_time = ""
				ElseIf GUICtrlRead($box_start)==$GUI_CHECKED Then
					$start_time = " start-time " &GUICtrlRead($start_date) & " " & $hour
				EndIf
					$expiry_time = ""
					$temp = 1
			ElseIf GUICtrlRead($box_expiry)==$GUI_CHECKED Then
					$expiry_time = " expiry " & GUICtrlRead($set) & GUICtrlRead($time) & " " & $hour

					If GUICtrlRead($expiry) <> "Set time will expire" Then
						MsgBox (0,"Warning!", "Yêu cầu nhập time expire cho option Modify !")
						$temp =0

					ElseIf GUICtrlRead($box_start)==$GUI_UNCHECKED And GUICtrlRead($expiry) == "Set time will expire" Then
						$start_time = ""
						$temp = 1

					ElseIf GUICtrlRead($box_start)==$GUI_CHECKED And GUICtrlRead($expiry) == "Set time will expire" Then
							If GUICtrlRead($time) <= GUICtrlRead($start_date) Then
								MsgBox (0,"Warning!", "Vui lòng chọn lại thời gian Expiry_Time > Start_Date !")
								$temp = 0
							ElseIf GUICtrlRead($time) > GUICtrlRead($start_date) Then
								$start_time = " start-time " &GUICtrlRead($start_date) & " " & $hour
								$temp = 1
							EndIf
					EndIf

			Else
					$temp = 0
			EndIf

			If $temp == 1 Then
				MsgBox (0,"Check Script","local-userdb add username " & GUICtrlRead($username) & " password " &GUICtrlRead($username)& $role_user & $email_user & $sponsor_name_user & $expiry_time &  $start_time)
				Local $ans = MsgBox($mb_okcancel, "Wait for the page to load then select OK to continue script", "Wait for the page to load then select OK to continue script")
				If $ans = $idok Then
					Run("C:\Program Files\PuTTY\plink.exe -no-antispoof -ssh 192.168.99.253 -P 22 -l lampd -pw 123321")
					Sleep(1000)
					$code = "local-userdb modify username " & GUICtrlRead($username) & " password " &GUICtrlRead($username)& $role_user & $email_user & $sponsor_name_user & $expiry_time &  $start_time & @CRLF
					Send ($code)
					Sleep(1000)
					Send ("show local-userdb username "& GUICtrlRead($username)& @CRLF)
					Sleep(1000)
				ElseIf $ans = $idcancel Then
				EndIf
			EndIf

		Case $MSG = $OK
			If GUICtrlRead($username) == "" Then
					MsgBox (0,"Warning!", "Nhập lại địa chỉ MAC ADDRESS!")
			ElseIf GUICtrlRead($role) == "Choice role option..." Then
					MsgBox (0,"Warning!", "Yêu cầu nhập Role !")
			ElseIf GUICtrlRead($sponsor_name) == "" Then
					MsgBox (0,"Warning!", "Yêu cầu nhập Sponsor name cho user !")
			ElseIf GUICtrlRead($box_expiry)==$GUI_UNCHECKED  Then
				If GUICtrlRead($box_start)==$GUI_UNCHECKED Then
					$start_time = ""
				ElseIf GUICtrlRead($box_start)==$GUI_CHECKED Then
					$start_time = " start-time " &GUICtrlRead($start_date) & " " & $hour
				EndIf
					$expiry_time = ""
					$temp = 1
			ElseIf GUICtrlRead($box_expiry)==$GUI_CHECKED Then
					$expiry_time = " expiry " & GUICtrlRead($set) & GUICtrlRead($time) & " " & $hour

					If GUICtrlRead($expiry) == "Choice expiry option..." Then
							MsgBox (0,"Warning!", "Yêu cầu chọn option Expiry !")
							$temp = 0

					ElseIf GUICtrlRead($box_start)==$GUI_UNCHECKED And  GUICtrlRead($expiry) <> "Choice expiry option..." Then
							$start_time = ""
							$temp = 1

					ElseIf GUICtrlRead($box_start)==$GUI_CHECKED And  GUICtrlRead($expiry) == "Set time will expire" Then

						If GUICtrlRead($time) <= GUICtrlRead($start_date) Then
							MsgBox (0,"Warning!", "Vui lòng chọn lại thời gian Expiry_Time > Start_Date !")
							$temp = 0

						ElseIf GUICtrlRead($time) > GUICtrlRead($start_date) Then
							$start_time = " start-time " &GUICtrlRead($start_date) & " " & $hour
							$temp = 1
						EndIf
					EndIf
			Else
					$temp = 0
			EndIf

			If $temp == 1 Then
				MsgBox (0,"Check Script","local-userdb add username " & GUICtrlRead($username) & " password " &GUICtrlRead($username)& $role_user & $email_user & $sponsor_name_user & $expiry_time &  $start_time)
				Local $ans = MsgBox($mb_okcancel, "Wait for the page to load then select OK to continue script", "Wait for the page to load then select OK to continue script")
					If $ans = $idok Then
						Run("C:\Program Files\PuTTY\plink.exe -no-antispoof -ssh 192.168.99.253 -P 22 -l lampd -pw 123321")
						Sleep(1000)
						$code = "local-userdb add username " & GUICtrlRead($username) & " password " &GUICtrlRead($username)& $role_user & $email_user & $sponsor_name_user & $expiry_time &  $start_time & @CRLF
						Send ($code)
						Sleep(1000)
						Send ("show local-userdb username "& GUICtrlRead($username)& @CRLF)
						Sleep(1000)
					ElseIf $ans = $idcancel Then
					EndIf
			EndIf

    	EndSelect

WEnd  ;==>EndWhile

;Exit Program with HotKey
Func EndProgram()
    Exit
 EndFunc   ;==>EndProgram


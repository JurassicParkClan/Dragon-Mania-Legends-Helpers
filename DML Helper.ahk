;#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance fORCE
;set coord mode
CoordMode "ToolTip", "Screen"
CoordMode "Mouse", "Screen"
global winID 

; Specify below the path to the GIF file to animate (local files are allowed too):
pic := "http://www.animatedgif.net/cartoons/A_5odie_e0.gif"
Gui := GuiCreate()
Gui.Add("ActiveX", "w100 h150", "mshtml:<img src='" pic "' />")
Gui.Show
return
FileInstall "C:\My Documents\My File.txt", A_ProgramFiles "\My Application\Readme.txt", 1
FileInstall "splash.gif", A_ScriptDir "splashgif",1
Gui := GuiCreate()
pic := Gui.Add("Picture"," x92 y29 w250 h130 ","splash.gif")
text := Gui.Add("Text", "x102 y199 w220 h40 ", Text)
text.setFont( "S20 Cgreen Bold Italic Underline, timsnewrome")

; Generated using SmartGUI Creator for SciTE
Gui.Show()
return

GuiClose:
	ExitApp



Return

F12:: ;Press F12 to reset script
	result := WinSetAlwaysOnTop("off","ahk_id" winID)
	myReload()
Return

F11:: ;Press F11 to watch lotto ADs
	winID := WinGetID("A") ;get the ID of current active window(Dragon Mania Legends)
	result := WinSetAlwaysOnTop("on","ahk_id" winID)
	watchads(winID) ;begin to watch ADs
	myReload()
Return

F10::
	winID := WinGetID("A") ;get the ID of current active window(Dragon Mania Legends)
	result := WinSetAlwaysOnTop("on","ahk_id" winID)
	sendgifts(winID) ;begin to watch ADs
	myReload()
Return

sendgifts(winID){
	WinGetClientPos clientX, clientY, clientW, clientH, "ahk_id" winID
	ToolTip  "↖friends",clientX+clientW-35+5,clientY+290+5,1
	Click clientX+clientW-35,clientY+290
	sleep 2000 ;wait for friends list shows up
	
	num := 0 
	offset :=0
	while(num<250){
		WinGetClientPos clientX, clientY, clientW, clientH, "ahk_id" winID
	
		if((280+offset*70) < (clientH-40)){
			SendMode "Input"
			ToolTip  "↖sent",clientX+clientW/2+200+5,clientY+280+offset*70
			Click clientX+clientW/2+200,clientY+280+offset*70
			sleep 10
			Click clientX+clientW/2+200,clientY+280+offset*70+35
			sleep 10
			num += 1
			offset += 1
			;sleep 100 
		}
		else {
			sendMode "Event"
			MouseClickDrag "left", clientX+clientW/2+200, clientY+210+offset*70, clientX+clientW/2+200, clientY+280,2
		offset := 0
		}	
	}
Return
}
	
watchads(winID){
	WinGetClientPos clientX, clientY, clientW, clientH, "ahk_id" winID
	ToolTip  "↖lotto's entry",clientX+clientW-150+5,clientY+clientH-50+5,1
	myClick clientX+clientW-150,clientY+clientH-50
	sleep 2000
	
	WinGetClientPos clientX, clientY, clientW, clientH, "ahk_id" winID
	ToolTip  "↖AD entry",clientX+clientW/2-250+5,clientY+clientH/2+100+5,2
	myClick clientX+clientW/2-250,clientY+clientH/2+100
	sleep 40000
		
	num := 20
	while(num--){
		WinGetClientPos clientX, clientY, clientW, clientH, "ahk_id" winID
		ToolTip  "↖close AD",clientX+clientW-20+5,clientY+50+5,1
		myClick clientX+clientW-20,clientY+50
		sleep 2000
		
		WinGetClientPos clientX, clientY, clientW, clientH, "ahk_id" winID
		ToolTip  "↖lotto button",clientX+clientW/2-250+5,clientY+clientH/2+200+5,2
		myClick clientX+clientW/2-250,clientY+clientH/2+200
		sleep 12000
		
		WinGetClientPos clientX, clientY, clientW, clientH, "ahk_id" winID
		
		sleep 1000
		
		WinGetClientPos clientX, clientY, clientW, clientH, "ahk_id" winID
		
		sleep 40000
	}
Return	
}

myClick(x,y){
	local xpos,ypos,idpos
	idpos := WinGetID("A") ;get current active window
	MouseGetPos xpos, ypos ;get current mouse position
	click x,y ;click the target
	MouseMove xpos,ypos,0 ;move the mouse back
	WinActivate "ahk_id" idpos ;active last window
Return
}

myReload(){
	Reload
	Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
	Res := MsgBox("The script could not be reloaded. Would you like to open it for editing?",, 4)
	if Result = "Yes"
		Edit
Return
}
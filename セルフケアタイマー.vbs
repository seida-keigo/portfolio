If WScript.Arguments.Count Then
	With CreateObject("SAPI.SpVoice")
		.Rate=4
		.Speak WScript.Arguments(0)
	End With
	WScript.Quit
End If
Function Speak(Text)
	CreateObject("WScript.Shell").Run WScript.ScriptName&" "&Text
	Speak=Text
End Function
Notice="周囲の状況変化を確認しましょう"
Do
	MsgBox Speak("周囲の状況変化を確認しましょう。"&vbLf&vbLf&"ストレッチしましょう。"),&H30,Notice
	Do While MsgBox(Speak("周囲の状況変化を確認しましたか?"),&H124,Notice)=vbNo
		MsgBox Speak("周囲の状況変化を確認しましょう。"),&H10,Notice
	Loop
	If MsgBox("セルフケアタイマーを続けますか?",&H24,"セルフケアタイマー")=vbNo Then Exit Do
	WScript.Sleep 300E3-1E3*(60+Timer)Mod 300E3
Loop
MsgBox"セルフケアタイマーを終了しました。",,"セルフケアタイマー"
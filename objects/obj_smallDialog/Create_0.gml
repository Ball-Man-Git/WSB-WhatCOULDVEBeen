enum dialogChars
{
	mildred,
	milton
}

addDialog = function(_char, _dialog, _func = function(){})
{
	var q =
	{
		char: _char,
		text: _dialog,
		func: _func
	}
	array_push(dialogStuff, q)
}
dialogCharInfo = []
dialogCharInfo[dialogChars.mildred] = 
{
	voice: "event:/Sfx/Dialog/mildredSpeak",
	color: c_lime,
}
dialogCharInfo[dialogChars.milton] = 
{
	voice: "event:/Sfx/Dialog/miltonSpeak",
	color: c_red,
}
dialogStuff = []
currentDialog = 0
active = false
textVisual = ""
textLetter = 1
canProgress = true
currentChar = UnknownEnum.Value_0
textLength = 1
target = noone
fadeout = false
fade = 0
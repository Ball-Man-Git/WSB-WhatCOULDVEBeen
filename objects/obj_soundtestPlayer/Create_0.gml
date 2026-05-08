songs = [];

add_song = function(arg0, arg1, arg2, _milton = false, _naomi = false, _ernie = false, _juan = false, _fidelity = false) constructor
{
    event = arg0;
    text = arg1;
	bpm = arg2;
	milton = _milton;
	naomi = _naomi;
	ernie = _ernie;
	juan = _juan;
	fidelity = _fidelity;
};

songInst = -4;
playing = false;
currentSong = 0;
image_speed = 0;
depth = 50;
currentBPM = 0
beat = 0
bar = 0
isMilton = false
isNaomi = false
isErnie = false
isJuan = false
isFidelity = false
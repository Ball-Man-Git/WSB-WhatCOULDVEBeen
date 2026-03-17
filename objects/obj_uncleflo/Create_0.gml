active = 0;
image_speed = 1;
spr_idle = spr_floidle;
spr_talk = spr_flotalk;
borderTargetpos = -160;
borderX = 32 + wave(-2, 2, 4, 0);
borderY = borderTargetpos;
borderscaleYmult = 1;
borderVsp = 0;
borderpart = 0;
text = "[wave]Hey bro! I'm a placeholder Bro! What's up Bro? It's me Bro! Your step-uncle Flo, Bro!";
depth = 10;
surf = surface_create(895.999968, 140.16 * borderscaleYmult);
BGX = 0;
BGY = 0;
snd_voice = FMODcreate_event("event:/Sfx/General/Hub/Granny/granny");
rescaled = false;

hurtTimer = 0;
isUpset = false;
upsetLine = "";

upsetLines = [
    "[shake]Whoa, Bro! That was totally harsh.",
    "[shake]Not cool, man. My aura is seriously dented now bro.",
    "[shake]You're harshing the whole vibe, bro.",
    "[shake]Aggressive much? Go hit a wall, not uncle flo!",
    "[shake]That's a major vibe-foul, Milton. Major."
];

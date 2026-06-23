titlecardSprite = lang_get_asset("spr_titlecardMonolith");
titlecardMusic = "event:/Music/W1/Monolith Mangrove/titlecard"


titlecardName = 
{
    sprite: lang_get_asset("spr_titlecardMonolithTitle1"),
	sprite2: lang_get_asset("spr_titlecardMonolithTitle2"),
    x: 0,
    y: 0,
    alpha: 0,
    fadeIn: false
};
fadeAlpha = 0;
fadeIn = true;
scene = 0;
depth = -600;
fadeSurface = surface_create(obj_screensizer.displayWidth, obj_screensizer.displayHeight);
circleSize = 0;
circleSizeSpeed = 0;
titlecardMilton = spr_titlecardMilton_wayback;
titlecardMiltonIndex = 0;
titlecardSpriteJuan = lang_get_asset("spr_titlecardMonolithJuan")
isMilton = obj_player.character == UnknownEnum.Value_1
isJuan = obj_player.isJuan

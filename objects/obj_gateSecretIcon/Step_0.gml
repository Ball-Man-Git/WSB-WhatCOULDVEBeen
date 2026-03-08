if (level != "none" && !found)
{
    ini_open(global.saveFile);
    var _count = ini_read_real(level, "Secrets", 0);
    ini_close();
    if (_count >= secretIndex) found = true;
}

if (parentGate != -4)
{
    sprite_index = found ? spr_secret_collected : spr_secret_missing;
    
    var _prev_x = x;
    

    var _centerX = parentGate.x - 50;
    x = wave(_centerX - 110, _centerX + 110, orbitSpeed, 0, current_time + cardtimer);
    

    var _baseY = parentGate.y - 130; 
    y = _baseY + ((secretIndex - 1) * 100);


    if ((x - _prev_x) < 0)
        depth = parentGate.depth + 10;
    else
        depth = parentGate.depth - 10;
}

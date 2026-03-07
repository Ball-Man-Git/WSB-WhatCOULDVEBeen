// Update palette and animation timers
roomPaletteIndex = approach(roomPaletteIndex, selectedFile + 1, 0.1);
bg_frame += bg_speed;
dark_frame += dark_speed;
title_timer += 0.02; // only increment once

// Fade titles if a save is chosen (scene >= 1)
if (scene >= 1)
{
    title_alpha = approach(title_alpha, 0, 0.05);
    corner_alpha = approach(corner_alpha, 0, 0.05);
}

// Now switch properly on scene
switch (scene)
{
    case -2:
    getMenu_input();
    if (key_jump2)
    {
        dark = false;
        FMODevent_oneshot("event:/Sfx/UI/Mainmenu/turnon");
        scene = -1;
        alarm[0] = 60;
        alarm[3] = 5;

        fmod_studio_event_instance_start(music);
        fmod_studio_event_instance_set_paused(music, false);
    }
    break;

    case -1:
        break;

    case 0:
        getMenu_input();
        if (instance_exists(obj_option)) exit;

        if (key_start2) instance_create(x, y, obj_option);

        hudAlpha = approach(hudAlpha, 1, 0.1);
        var q = saveFiles[selectedFile];

        if (key_jump2)
        {
            global.saveFile = q.savePath;
            alarm[1] = 180;
            FMODevent_oneshot("event:/Sfx/General/Collects/bigcollect", obj_screensizer.displayWidth/2, obj_screensizer.displayHeight/2);
            FMODevent_oneshot("event:/Sfx/UI/Mainmenu/selectmovie");
            scene = 1;
            alarm[2] = 120;
            fmod_studio_event_instance_stop(music, UnknownEnum.Value_0);
            ini_open(global.saveFile);
            ini_write_real("General", "created", true);
            ini_close();
            TVsprite = spr_mainmenu_tv;
        }

        var move = key_right2 + key_left2;
        if (move != 0)
        {
            selectedFile += -move;
            FMODevent_oneshot("event:/Sfx/UI/Pause/menumove");
            TVsprite = spr_mainmenu_tvStatic;
            selectedFile = clamp(selectedFile, 0, 3);

            if (saveFiles[selectedFile].created) alarm[5] = 6;
            else alarm[5] = -1;
        }

        if (TVsprite == spr_mainmenu_tv) TVindex = selectedFile + 1;
        else TVindex += 0.35;

        percentageReal = q.completion;
        if (TVsprite != spr_mainmenu_tvStatic)
            percentage = lerp(percentage, percentageReal, 0.25);

        for (var i = 0; i < array_length(saveFiles); i++)
        {
            q = saveFiles[i];
            q.faceAlpha = approach(q.faceAlpha, (selectedFile == q.file && q.created) ? 1 : 0, 0.1);
            q.movie.x = lerp(q.movie.x, (selectedFile == q.file) ? (q.movie.saveX + 80) : q.movie.saveX, 0.35);
            q.movie.y = lerp(q.movie.y, (selectedFile == q.file) ? (q.movie.saveY - 5) : q.movie.saveY, 0.25);
        }

        if (key_slap2) game_end();
        if (key_taunt2)
        {
            q = saveFiles[selectedFile];
            if (file_exists(q.savePath)) file_delete(q.savePath);
            saveFiles[selectedFile] = new createSave(selectedFile);
            TVsprite = spr_mainmenu_tvStatic;
        }

        break;

    case 1:
        hudAlpha = approach(hudAlpha, 0, 0.1);
        for (var i = 0; i < array_length(saveFiles); i++)
        {
            var q = saveFiles[i];
            if (selectedFile != q.file)
            {
                q.movie.alpha = approach(q.movie.alpha, 0, 0.01);
                q.movie.x = q.movie.saveX + irandom_range(-1, 1);
                q.movie.y = q.movie.saveY + irandom_range(-1, 1);
            }
            else q.movie.scale = approach(q.movie.scale, 2.5, 0.001);
        }
        break;

    case 2:
        hudAlpha = approach(hudAlpha, 0, 0.1);
        for (var i = 0; i < array_length(saveFiles); i++)
        {
            var q = saveFiles[i];
            if (selectedFile != q.file)
            {
                q.movie.alpha = approach(q.movie.alpha, 0, 1);
                q.movie.x = q.movie.saveX + irandom_range(-1, 1);
                q.movie.y = q.movie.saveY + irandom_range(-1, 1);
            }
            else
            {
                q.movie.scale = approach(q.movie.scale, 100, 2);
                moviefade = max(0, moviefade - 5);
                moviefadeC = make_color_rgb(moviefade, moviefade, moviefade);
            }
        }
        break;
}
ini_open(global.saveFile);

if (ini_read_real("Cutscenes", "miltonIntro", false) == true)
{
    instance_destroy();
    instance_destroy(inst_1D559AD8);
}

ini_close();

trigger = function()
{
	ini_open(global.saveFile);
    ini_write_real("Cutscenes", "miltonIntro", true)
	ini_close();
    obj_music.pauseMusic = true;
    instance_destroy();
    instance_create_depth(x, y, 0, obj_miltonCutscene);
    var _box = instance_create_depth(x, y, 0, obj_dialog);
    
    with (_box)
    {
        addDialog(spr_dialogportraitPlaceholder2, "dialog_milton1_1_MT");
        addDialog(spr_dialogportraitPlaceholder2, "dialog_milton1_2_MT");
        addDialog(spr_dialogportraitPlaceholder1, "dialog_milton1_1_MR");
        addDialog(spr_dialogportraitPlaceholder2, "dialog_milton1_3_MT");
        addDialog(spr_dialogportraitPlaceholder2, "dialog_milton1_4_MT");
        addDialog(spr_dialogportraitPlaceholder2, "dialog_milton1_5_MT");
        addDialog(spr_dialogportraitPlaceholder2, "dialog_milton1_6_MT");
        addDialog(spr_dialogportraitPlaceholder1, "dialog_milton1_1_MR");
        addDialog(spr_dialogportraitPlaceholder2, "dialog_milton1_7_MT");
        addDialog(spr_dialogportraitPlaceholder2, "dialog_milton1_8_MT");
        addDialog(spr_dialogportraitPlaceholder2, "dialog_milton1_9_MT");
		addDialog(spr_dialogportraitPlaceholder1, "dialog_milton1_2_MR");
		addDialog(spr_dialogportraitPlaceholder2, "dialog_milton1_10_MT");
		addDialog(spr_dialogportraitPlaceholder1, "dialog_milton1_3_MR");
		addDialog(spr_dialogportraitPlaceholder1, "dialog_milton1_4_MR");
		addDialog(spr_dialogportraitPlaceholder2, "dialog_milton1_11_MT");
    }
};

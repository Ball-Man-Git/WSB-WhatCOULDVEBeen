function scr_load_milton_data()
{
    var _file = (variable_global_exists("saveFile")) ? global.saveFile : "save1.ini";

    if (file_exists(_file)) 
    {
        ini_open(_file);
        var _data = ini_read_string("Potables", "confirmed_list", "");
        
        if (_data != "") 
        {
            ds_list_clear(global.confirmed_ids); 
            ds_list_read(global.confirmed_ids, _data);
        }
        ini_close();
        
        global.potables_total = ds_list_size(global.confirmed_ids);
    }
}

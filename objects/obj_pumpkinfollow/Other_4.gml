
ds_queue_clear(followqueue);


repeat (lag * 25) 
{
    ds_queue_enqueue(followqueue, obj_player.x);
    ds_queue_enqueue(followqueue, obj_player.y);
}


if (ds_list_find_index(global.followers, id) == -1)
    ds_list_add(global.followers, id);


x = obj_player.x;
y = obj_player.y;
interp = 0;


ds_queue_clear(followqueue);
repeat (lag * 25) 
{
    ds_queue_enqueue(followqueue, obj_player.x);
    ds_queue_enqueue(followqueue, obj_player.y);
}
interp = 0;

ref_o = o_note_creator.pos_x
my_snd_arr = [x_note_1,x_note_2,x_note_3,x_note_4,x_note_5,x_note_6,x_note_7]
my_snd=x_note_1
played=false
selected=false
off_mouse=0
width = sprite_width
test=false
held=false
org_x=x
left=true
color=c_white
x_size = image_xscale
play_note=""
counter=-1
last_pos=false
menu_id=0
recalculate=false
selected_id=0
release_amt=0

_org_alpha = draw_get_alpha()

note_index=0

muted=false

image_speed=0

calculate_release=false

note_play=false
is_playing=false
curent_gain=0

target_gain=0
sound_id=0
finish=false
steps=0

max_gain=1
attack_speed=1
release_speed=1
base_atkk_speed=1
base_release_speed=1
pitch_amt=1


sprite_wd=sprite_width




multiplication_amt_ml_to_sc = sprite_width/o_note_creator.bpm

milliseconds=sprite_width*multiplication_amt_ml_to_sc

steps = ceil(60/sprite_width)

show_debug_message(steps)
note_play=false

my_text=""

original_xcale=0

selected_in_zone=false
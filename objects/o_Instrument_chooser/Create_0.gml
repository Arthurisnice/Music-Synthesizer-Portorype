image_speed=0
valeu=0
val_to_send=0
random_number=0

x_offset_mine=x

Letter_font = font_add_sprite(s_font_custom_normal, ord("A"), false, 0);

Letter_font_note = font_add_sprite(s_font_custom_note, ord("A"), false, 0);

//array format GAIN | ATTACK | RELEASE | PITCH | MULTIPLYER
array_eguitar=[1,0.400,0.100,0.890,0.150]
array_piano=[1,0.150,0.100,1.780,0.230]
array_bass=[1,0.300,0.050,0.670,0.110]
array_flute=[0.6,0.350,0.250,1.700,0.120]
array_FMS=[1,1,1,1,0]
array_voice=[1,0.5,0.5,2.5,0.50]

array_pitch_universal=[1.782, 1.889, 2.000, 2.120, 2.248, 2.381, 2.522, 2.670, 2.830, 2.997, 3.177, 3.364]

array_pitch_vocals=[2.500, 1.850, 3.440, 3.600, 4.450, 4.000, 5.530, 3.240, 6.200, 2.050, 4.200, 5.600, 5.000, 5.100, 1.860, 5.250, 5.300, 2.300, 6.100, 4.800, 7.000, 5.150, 3.700, 5.450, 6.000]

base_array=[array_eguitar,array_piano,array_bass,array_flute,array_FMS,array_voice,array_eguitar,array_pitch_universal]

notes_array = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L"]
letter_array = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
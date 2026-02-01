

valeu = clamp(valeu,0,5)

switch (valeu)
{
	case 0:
			image_index=valeu
			val_to_send=6
		break;
	case 1:
			image_index=valeu
			val_to_send=1
		break;
	case 2:
			
			if random_number==1 {image_index=6; val_to_send=2}
			else {image_index=valeu; val_to_send=2}
		break;
	case 3:
			image_index=valeu
			val_to_send=3
		break;
	case 4:
			image_index=valeu
			val_to_send=4
		break;
	case 5:
			image_index=valeu
			val_to_send=5
		break;
}
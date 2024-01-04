/// @description Insert description here 
//The exp system for crop
// each crop require a certain amount of exp point to ascend to a stage
// each day watered will give them 100 exp
// depend on the fertilizer, add more exp

//How to store exp point for each crop 
// save a exp_point var, this var will be updated base on event (day pass, fetilizer)
//If exp_point == -1, it mean the crop is dead
ds_crops_types = -1
//this is the table that hold information for each type of crop
//Every crop have 5 stage, the different is how many exp to get to each stage
//by design, any type of crop only need 1 day(=100exp) to get to stage 1
//QUESTION: So if fertilized on the first day, effect == null ?
//Statge 0 = seed
//Statge 1 = sprout
//Statge 2 = seedling
//Statge 3 = budding
//Statge 4 = flowering
//Statge 5 = ripening (harvestable)

ds_crops_instances = -1 
// save the location of cell that already have a crop planted, so that another crop cant be planted on top of that 
// this is a grid that represent the room in a 16x16 cell

ds_crops_data = ds_grid_create(5,1) 
//to save the data of existing crops on the field, for save or for room exit 
//each grop is a crop that is planted
//col 1 is the x coordinate
//col 2 is the y coordinate
//col 3 is the crop type
//col 4 is the exp point
//col 4 is the is_watered
//
//ds_crops_data[# 0, 0] = -1
ds_grid_clear(ds_crops_data, -1)
is_planting = false
max_growth_stage = 5 //by design

enum CROP_SPRITE_INFO {
	FANTASY,
	WHEAT_EGGPLANT,
	SIMPLE,
	FANTASY_2,
	TINY_WONDER_FARM
}
ds_crop_sprites = -1
create_sprite_crop_type(spr_fantasy_crops, 0, 0, 4)
create_sprite_crop_type(spr_wheat_eggplant_crop, 1, 8, 3)
create_sprite_crop_type(spr_simple_crops, 0, 10, 4)
create_sprite_crop_type(spr_fantasy_crops, 7, 22, 4)
create_sprite_crop_type(spr_tiny_wonder_farm, 0, 30, 4)


//the order of this enum should correspond to the order in the sprite
//Need to update get_crop_obj_id/sprite_by_crop_type manually if upadte this
enum CROPS {
	CARROT,//0 fantasy
	CROP2, //placeholder
	CROP3,
	CROP4,
	LETTUCE,
	CROP6,
	PURPLE_LETTUCE,
	CROP8, //7
	WHEAT,//wheat_and_egg_plant
	EGGPLANT, //9,
	CROP11, //simple
	CROP12,
	CROP13,
	CROP14,
	CROP15,
	CROP16,
	CROP17,
	ICY_SUNFLOWER, //
	CROP19,
	SUNFLOWER,
	GREEN_PEPPER,
	CROP22,
	CROP23, //fantasy_2
	PURPLE_CABBAGE,
	CROP25,
	RADDISH,
	CAULIFLOWER,
	CROP28,
	CROP29,
	CROP30,
	PUMPKIN, //tiny wonder farm
	CROP32,
	CROP33,
	CROP34,
}
crop_num = 34
selected_crop = 0 //correspond to enum above

//insert the info of a crop to the table
//again, the order is important, should correspond to the order of crop in the sprite
//The shape of the table:
//Each row is a type of crop and its info
//col 1 is the exp point to get to stage 1
//col 2 is the exp point to get to stage 2
//col 3 is the exp point to get to stage 3
//col 4 is the exp point to get to stage 4
//col 5 is the exp point to get to stage 5
//col 6 is the name of the crop
//col 7 is the seed price
//col 8 is sprite_id of harvested crops
//TODO: and more to came

create_crop_type(100,200,300,400,500,"Carrot", 70, spr_carrot_crop)  //this is the info of the carrot
create_crop_type(100,100,100,100,100,"crop2", 700, spr_carrot_crop)
create_crop_type(100,100,100,100,100,"crop3", 700, spr_carrot_crop)
create_crop_type(100,100,100,100,100,"crop4", 700, spr_carrot_crop)
create_crop_type(100,200,250,300,400,"Lettuce", 100, spr_lettuce_crop)
create_crop_type(100,100,100,100,100,"crop6", 700, spr_carrot_crop)
create_crop_type(100,200,250,300,400,"Purple Lettuce", 300, spr_purple_lettuce_crop)
create_crop_type(100,100,100,100,100,"crop8", 700, spr_carrot_crop)
create_crop_type(100,200,400,700,800,"Wheat", 100, spr_wheat_crop)
create_crop_type(100,200,400,700,900,"Eggplant", 100, spr_eggplant_crop)
create_crop_type(100,100,100,100,100,"crop11", 0, spr_carrot_crop)
create_crop_type(100,100,100,100,100,"crop12", 0, spr_carrot_crop)
create_crop_type(100,100,100,100,100,"crop13", 0, spr_carrot_crop)
create_crop_type(100,100,100,100,100,"crop14", 0, spr_carrot_crop)
create_crop_type(100,100,100,100,100,"crop15", 0, spr_carrot_crop)
create_crop_type(100,100,100,100,100,"crop16", 0, spr_carrot_crop)
create_crop_type(100,100,100,100,100,"crop17", 0, spr_carrot_crop)
create_crop_type(100,300,400,500,600,"Icy Sunflower", 120, spr_icy_sunflower_crop)
create_crop_type(100,100,100,100,100,"crop19", 0, spr_carrot_crop)
create_crop_type(100,200,300,500,600,"Sunflower", 200, spr_sunflower_crop)
create_crop_type(100,200,300,500,700,"Green Pepper", 300, spr_green_pepper_crop)
create_crop_type(100,100,100,100,100,"crop22", 0, spr_carrot_crop)
create_crop_type(100,100,100,100,100,"crop23", 0, spr_carrot_crop)
create_crop_type(100,200,300,400,450,"Purple Cabbage", 300, spr_purple_cabbage_crop)
create_crop_type(100,100,100,100,100,"crop25", 0, spr_carrot_crop)
create_crop_type(100,150,250,300,350,"Raddish", 300, spr_carrot_crop)
create_crop_type(100,200,300,400,450,"Broccoflower", 500, spr_carrot_crop)// no sprite
create_crop_type(100,100,100,100,100,"crop28", 0, spr_carrot_crop)
create_crop_type(100,100,100,100,100,"crop29", 0, spr_carrot_crop)
create_crop_type(100,100,100,100,100,"crop30", 0, spr_carrot_crop)
create_crop_type(100,300,500,800,1000,"Pumpkin", 7000, spr_pumpkin_crop)
create_crop_type(100,100,100,100,100,"crop32", 0, spr_carrot_crop)
create_crop_type(100,100,100,100,100,"crop33", 0, spr_carrot_crop)
create_crop_type(100,100,100,100,100,"crop34", 0, spr_carrot_crop)

mx = 0;
my = 0;

cell_size = 16
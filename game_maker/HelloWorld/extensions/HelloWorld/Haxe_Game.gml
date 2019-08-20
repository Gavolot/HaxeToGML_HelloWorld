#define hw_game_main
// Generated at 2019-08-20 13:08:40 (397ms) for v2.2.1+
globalvar mq_game_RotationOnMouseClass;mq_game_RotationOnMouseClass=[undefined,0,undefined,0,0,0,0,0];
globalvar mq_haxe_class;mq_haxe_class=[undefined,undefined,0,undefined,undefined];
globalvar haxe_type_markerValue;haxe_type_markerValue=[];
globalvar mt_game_RotationOnMouseClass;mt_game_RotationOnMouseClass=haxe_class_create(8,"game_RotationOnMouseClass");
globalvar mt_haxe_class;mt_haxe_class=haxe_class_create(10,"haxe_class");
globalvar g_game_Main_rotObj;
game_Main_main();

#define game_ExternCvadApi_init
// game_ExternCvadApi_init(this:ExternCvadApi)
var this=argument[0];
this.image_xscale=0;
this.image_yscale=0;

#define game_ExternCvadApi_step
// game_ExternCvadApi_step(this:ExternCvadApi)
var this=argument[0];
this.image_xscale=(this.image_xscale<1?this.image_xscale+0.025:0);
this.image_yscale=(this.image_yscale<1?this.image_yscale+0.025:0);

#define game_ExternCvadApi_draw
// game_ExternCvadApi_draw(this:ExternCvadApi)
draw_self();

#define game_Main_main
// game_Main_main()
game_Main_setup();
debug_log("src/game/Main.hx:23","\"GameEntry!\":","GameEntry!");
g_game_Main_rotObj=game_RotationOnMouseClass_create([32,32],spr_cvad);
with (o_cvad) {
	self.x=64;
	self.y=64;
}

#define game_Main_step
// game_Main_step()
game_RotationOnMouseClass_step(g_game_Main_rotObj);
with (o_cvad) {
	if(keyboard_check(87))self.y-=5;
	if(keyboard_check(83))self.y+=5;
	if(keyboard_check(65))self.x-=5;
	if(keyboard_check(68))self.x+=5;
}

#define game_Main_draw
// game_Main_draw()
game_RotationOnMouseClass_draw(g_game_Main_rotObj);

#define game_Main_setup
// game_Main_setup()
game_set_speed(60,gamespeed_fps);
math_set_epsilon(0.0001);
randomize();
room_speed=60;

#define game_RotationOnMouseClass_create
// game_RotationOnMouseClass_create(position:Vect2f, sprite_index:int)
var this=[mt_game_RotationOnMouseClass];
array_copy(this,1,mq_game_RotationOnMouseClass,1,7);
var hw_gameVar_position=argument[0],hw_gameVar_sprite_index=argument[1];
this[@2]=hw_gameVar_position;
this[@1]=hw_gameVar_sprite_index;
this[@4]=-1;
this[@5]=1.0;
this[@6]=1.0;
this[@7]=1.0;
return this;

#define game_RotationOnMouseClass_step
// game_RotationOnMouseClass_step(this:RotationOnMouseClass)
var this=argument[0];
this[@3]=point_direction(haxe_boot_wget(this[2],0),haxe_boot_wget(this[2],1),mouse_x,mouse_y);

#define game_RotationOnMouseClass_draw
// game_RotationOnMouseClass_draw(this:RotationOnMouseClass)
var this=argument[0];
draw_sprite_ext(this[1],this[4],haxe_boot_wget(this[2],0),haxe_boot_wget(this[2],1),this[5],this[6],this[3],16777215,this[7]);

#define haxe_class_create
// haxe_class_create(id:int, name:string)
var this=["mt_haxe_class"];
array_copy(this,1,mq_haxe_class,1,4);
var hw_gameVar_id=argument[0],hw_gameVar_name=argument[1];
this[@4]=undefined;
this[@1]=haxe_type_markerValue;
this[@2]=hw_gameVar_id;
this[@3]=hw_gameVar_name;
return this;

#define haxe_boot_wget
// haxe_boot_wget(arr:array<T>, index:int)->T
var hw_gameVar_arr=argument[0],hw_gameVar_index=argument[1];
return hw_gameVar_arr[hw_gameVar_index];

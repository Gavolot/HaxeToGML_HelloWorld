package game;
using tools.Debug;
import gml.Assets;
import gml.NativeScope;
import gml.RawAPI;
import gml.input.Keyboard;
import gml.input.KeyCode;
import project_utils.math.Vect2f;
/**
 * ...
 * @author Gavolot
 * 
 * for (inst in gml.NativeScope.with(...)) inst.x += 1;
 * with (...) self.x += 1;
 * extern class Thing extends gml.Instance { ... }
 */
@:keep class Main
{
	static var rotObj:RotationOnMouseClass;
	static function main() 
	{
		setup();
		Debug.log("GameEntry!");
		rotObj = new RotationOnMouseClass(new Vect2f(32, 32), Assets.spr_cvad.index);
		
		for (inst in NativeScope.with (Assets.o_cvad)){
			inst.x = 64;
			inst.y = 64;
		}
	}
	static function step(){
		rotObj.step();
		
		for (inst in NativeScope.with (Assets.o_cvad)){
			if (Keyboard.check(KeyCode.W)){
				inst.y -= 5;
			}
			if (Keyboard.check(KeyCode.S)){
				inst.y += 5;
			}
			if (Keyboard.check(KeyCode.A)){
				inst.x -= 5;
			}
			if (Keyboard.check(KeyCode.D)){
				inst.x += 5;
			}
		}
	}
	
	static function draw(){
		rotObj.draw();
	}
	
	static function setup(){
		RawAPI.game_set_speed(60, RawAPI.gamespeed_fps);
		RawAPI.math_set_epsilon(1 / 10000);
		RawAPI.randomize();
		RawAPI.room_speed = 60;
	}
}

@:native("cvad_api") extern class CVAD extends ExternCvadApi {
	
}
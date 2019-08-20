package project_utils.math;
import gml.RawAPI;

/**
 * ...
 * @author Gavolot
 */
class MathTools 
{
	//angle constraits
	public static function wrap_angle(rotation:Float){
		var rot = rotation % 360;
		if (rot < 0){
			rot += 360;
		}
		return rot;
	}
	//smooth_rotation
	public static function rotate_angle(current_direction:Float, target_direction:Float, speed:Float):Float{
		
		current_direction = wrap_angle(current_direction);
		
		if (Math.abs(current_direction - target_direction) < speed){
			return Math.ceil(target_direction);
		}
		return current_direction + Math.ceil(RawAPI.sign(RawAPI.sin(RawAPI.degtorad(target_direction - current_direction))) * speed);
	}
	//pivots
	public static function get_pivot_x(thisX:Float, offsetX:Float, offsetY:Float, direction:Float){
		return (thisX + RawAPI.lengthdir_x(offsetX, direction) + RawAPI.lengthdir_x(offsetY, direction + 90)); 
	}
	public static function get_pivot_y(thisY:Float, offsetX:Float, offsetY:Float, direction:Float){
		return (thisY + RawAPI.lengthdir_y(offsetX, direction) + RawAPI.lengthdir_y(offsetY, direction + 90)); 
	}
}
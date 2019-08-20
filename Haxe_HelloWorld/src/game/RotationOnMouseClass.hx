package game;
import gml.ds.Color;
import gml.RawAPI;
import gml.input.Mouse;
import project_utils.math.Vect2f;

/**
 * ...
 * @author Gavolot
 */
class RotationOnMouseClass 
{
	
	private var sprite_index:Int;
	private var position:Vect2f;
	private var direction:Float;
	
	private var subImage:Float;
	
	private var image_xscale:Float;
	private var image_yscale:Float;
	private var image_alpha:Float;
	public function new(position:Vect2f, sprite_index:Int) 
	{
		this.position = position;
		this.sprite_index = sprite_index;
		
		this.subImage = -1;
		
		this.image_xscale = 1.0;
		this.image_yscale = 1.0;
		this.image_alpha = 1.0;
	}
	
	public function Get_Position():Vect2f {
		return this.position;
	}
	public function Get_Sprite_Index():Int{
		return this.sprite_index;
	}
	
	public function step(){
		this.direction = RawAPI.point_direction(this.position.x, this.position.y, Mouse.roomX, Mouse.roomY);
	}
	
	public function draw(){
		RawAPI.draw_sprite_ext(this.sprite_index, this.subImage, this.position.x, this.position.y, 
		this.image_xscale, this.image_yscale, this.direction, Color.white, this.image_alpha);
	}
	
}
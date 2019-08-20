package project_utils.math;

/**
 * ...
 * @author Gavolot
 */
@:forward abstract Rect2f(Rect2f_impl) 
{
	public inline function new(x:Float, y:Float, width:Float, height:Float) this = {x:x, y:y, width:width, height:height}
	
	public static var zero = new Rect2f(0, 0, 0, 0);
	public static function newRectSize(width:Float, height:Float):Rect2f{
		return new Rect2f(0, 0, width, height);
	}
	
	public function min() : Vect2f {
		return new Vect2f(this.x, this.y);
	}
	public function max():Vect2f {
		return new Vect2f(this.x + this.width, this.y + this.height);
	}
	
	public function center():Vect2f {
		return new Vect2f(this.x + (this.width / 2), this.y + (this.height / 2));
	}
	
	@:op(A == B) public function equally(v:Rect2f) : Bool {
		return (this.x == v.x && this.y == v.y && this.width == v.width && this.height == v.height);
	}
	@:op(A != B) public function notEqually(v:Rect2f) : Bool {
		return (this.x != v.x || this.y != v.y || this.width != v.width || this.height != v.height);
	}
	public function ToRect():Rect2f {
		return new Rect2f(this.x, this.y, this.width, this.height);
	}
	
	/*public static function Contains(rect:Rect2f, point:Vec2f) : Bool {
		if (point.x >= rect.x && point.y >= rect.y && point.x <= rect.x + rect.width && point.y <= rect.y + rect.height){
			return true;
		}
		return false;
	}*/
	public function Contains(point:Vect2f) : Bool {
		if (point.x >= this.x && point.y >= this.y && point.x <= this.x + this.width && point.y <= this.y + this.height){
			return true;
		}
		return false;
	}
	
	public function Intersects(rect:Rect2f) : Bool {
		if (rect.x + rect.width < this.x || rect.y + rect.height < this.y 
		|| rect.x > this.x + this.width || rect.y > this.y + this.height){
			return false;
		}
		return true;
	}
	/// Calculates how far another rectangle intersects into this rectangle. The returned depth represents how much the
    /// rectangle would have to be offset so that it no longer collides. This method is useful in collision resolution.
	public function IntersectionDepth(rect:Rect2f):Vect2f{
		var depth_vect:Vect2f = Vect2f.zero;
		var halfWidthA = (max().x - min().x + 1) / 2;
		var halfHeightA = (max().y - min().y + 1) / 2;
		var halfWidthB = (rect.max().x - rect.min().x + 1) / 2;
		var halfHeightB = (rect.max().y - rect.min().y + 1) / 2;
		
		var centerA:Vect2f;
		var centerB:Vect2f;
		centerA = new Vect2f(min().x + halfWidthA, min().y + halfHeightA);
		centerB = new Vect2f(rect.min().x + halfWidthB, rect.min().y + halfHeightB);
		
		var distanceX = centerA.x - centerB.x;
		var distanceY = centerA.y - centerB.y;
		var minDistanceX = halfWidthA + halfWidthB;
		var minDistanceY = halfHeightA + halfHeightB;
		
		if (Math.abs(distanceX) >= minDistanceX || Math.abs(distanceY) >= minDistanceY){
			return depth_vect;
		}
		
		depth_vect.x = distanceX > 0 ? minDistanceX - distanceX : -minDistanceX - distanceX;
		depth_vect.y = distanceY > 0 ? minDistanceY - distanceY : -minDistanceY - distanceY;
		return depth_vect;
	}
	
	public function Intersect(rect:Rect2f):Rect2f {
		var x0:Float = Math.max(this.x, rect.x);
		var x1:Float = Math.min(this.x + this.width, rect.x + rect.width);
		var y0:Float = Math.max(this.y, rect.y);
		var y1:Float = Math.min(this.y + this.height, rect.y + rect.height);
		
		if((x1 >= x0) && (y1 >= y0)){
			return new Rect2f(x0, y0, x1 - x0, y1 - y0);
		}
		
		return Rect2f.zero;
	}
	
	public function SetPos(vect:Vect2f) : Void{
		this.x = vect.x;
		this.y = vect.y;
	}

}

@:nativeGen typedef Rect2f_impl = { x:Float, y:Float, width:Float, height:Float }
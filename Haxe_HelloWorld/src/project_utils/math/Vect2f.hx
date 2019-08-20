package project_utils.math;

/**
 * ...
 * @author Gavolot
 */
@:forward abstract Vect2f(Vec2f_impl) {
    public inline function new(x:Float, y:Float) this = { x:x, y:y };
	

	public static var zero = new Vect2f(0, 0);
	//{
    /// <summary>
    /// Get Math.sqrt length of vector.
    /// </summary>
    /// <remarks>
    /// Get length of a vector. This is a relatively expensive operation as it involves a square root calculation.
    /// <see cref="Vector2i.SqrMagnitude"/> should be used if a relative magnitude/distance is sufficient.
    /// </remarks>
    /// <code>
    ///     var dist = (playerPos - enemyPos).SqrtMagnitude();
    ///     if (dist < 10.0f) {
    ///         playerHealth--;
    ///     }
    /// </code>
    /// <returns>Magnitude</returns>
    /// <seealso cref="Vector2i.SqrMagnitude"/>
	//}
	public inline function SqrtMagnitude() {
		return Math.sqrt((this.x * this.x) + (this.y * this.y));
	}
	//{
	/// <summary>
    /// Get squared length of vector.
    /// </summary>
    /// <remarks>
    /// Get the squared length of a vector. This is much faster than <see cref="Vector2i.Magnitude"/>.
    /// </remarks>
    /// <code>
    ///     var shortestDist = 99999;
    ///      closestEnemyPos : Vec2i;
    ///     // Find the closest enemy by comparing relative squared distances.
    ///     for(var enemyPos in enemyPos) {
    ///         var squareDist = (playerPos - enemyPos).SqrMagnitude();
    ///         if (squareDist < shortestDist) {
    ///             closestEnemyPos = enemyPos;
    ///             shortestDistance = squareDist;
    ///         }
    ///     }
    ///
    ///     if (shorestDist < 99999) {
    ///         AreaAttack(closestEnemyPos);
    ///     }
    /// </code>
    /// <returns>Square magnitude</returns>
	//}
	public inline function SqrMagnitude() {
		return (this.x * this.x) + (this.y * this.y);
	}
	
    @:op(A + B) public function add(v:Vect2f) return new Vect2f(this.x + v.x, this.y + v.y);
	@:op(A + B) public function addInt(v:Int) return new Vect2f(this.x + v, this.y + v);
	@:op(A + B) public function addFloat(v:Float) return new Vect2f(this.x + v, this.y + v);
	
	@:op(A - B) public function minus(v:Vect2f) return new Vect2f(this.x - v.x, this.y - v.y);
	@:op(A - B) public function minusInt(v:Int) return new Vect2f(this.x - v, this.y - v);
	@:op(A - B) public function minusFloat(v:Float) return new Vect2f(this.x - v, this.y - v);
	
	@:op(A * B) public function multiply(v:Vect2f) return new Vect2f(this.x * v.x, this.y * v.y);
	@:op(A * B) public function multiplyInt(v:Int) return new Vect2f(this.x * v, this.y * v);
	@:op(A * B) public function multiplyFloat(v:Float) return new Vect2f(this.x * v, this.y * v);
	
	@:op(A / B) public function divide(v:Vect2f) return new Vect2f(Std.int(this.x / v.x), this.y / v.y);
	@:op(A / B) public function divideInt(v:Int) return new Vect2f(Std.int(this.x / v), this.y / v);
	@:op(A / B) public function divideFloat(v:Float) return new Vect2f(this.x / v, this.y / v);
	
	@:op(A == B) public function equally(v:Vect2f) : Bool return (this.x == v.x && this.y == v.y);
	@:op(A != B) public function notEqually(v:Vect2f) : Bool return (this.x != v.x || this.y != v.y);
}
@:nativeGen typedef Vec2f_impl = { x:Float, y:Float }
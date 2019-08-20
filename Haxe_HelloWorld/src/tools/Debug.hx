package tools;
import haxe.macro.Expr;
import haxe.macro.PositionTools;
import haxe.macro.Context;
class Debug {
    public static macro function math_log(args:Array<Expr>):Expr {
        var loc = PositionTools.toLocation(Context.currentPos());
        var locStr = loc.file + ":" + loc.range.start.line;
		
		var str = haxe.macro.ExprTools.toString(args[0]);
		str = str + ":";
		args.unshift(macro $v{str});
        args.unshift(macro $v{locStr});
		
		return macro tools.Tracer.debug_math_log($a{args});
    }
	public static macro function log(args:Array<Expr>):Expr {
        var loc = PositionTools.toLocation(Context.currentPos());
        var locStr = loc.file + ":" + loc.range.start.line;
		
		var str = haxe.macro.ExprTools.toString(args[0]);
		str = str + ":";
		args.unshift(macro $v{str});
        args.unshift(macro $v{locStr});
		
		return macro tools.Tracer.debug_log($a{args});
    }
}


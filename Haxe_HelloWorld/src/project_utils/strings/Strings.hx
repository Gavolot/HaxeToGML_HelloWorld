package project_utils.strings;
import haxe.io.Bytes;
/**
 * ...
 * @author Gavolot
 */
class Strings 
{
    inline
    public static function isEmpty(str:String):Bool {
        return str == null || str.length == 0;
    }
	inline
    public static function toBytes(str:String):Bytes {
        if (str == null)
            return null;

        return Bytes.ofString(str);
    }
	
}
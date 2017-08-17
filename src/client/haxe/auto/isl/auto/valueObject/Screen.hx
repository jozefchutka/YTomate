package auto.isl.auto.valueObject;

class Screen
{
	inline public static var FIELD_WIDTH:String = "width";
	inline public static var FIELD_HEIGHT:String = "height";

	public var width(default, null):Int;
	public var height(default, null):Int;

	public function new(width:Int, height:Int)
	{
		this.width = width;
		this.height = height;
	}
}

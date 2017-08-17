package auto.isl.auto.valueObject;

class Event
{
	inline public static var FIELD_C:String = "c";

	public var c(default, null):String;

	function new()
	{
		c = getC(Type.getClass(this));
	}

	public static function getC(clazz:Class<Dynamic>)
	{
		return Type.getClassName(clazz).split(".").pop();
	}
}

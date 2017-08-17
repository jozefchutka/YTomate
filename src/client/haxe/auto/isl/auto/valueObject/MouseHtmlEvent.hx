package auto.isl.auto.valueObject;

class MouseHtmlEvent extends HtmlEvent
{
	inline public static var FIELD_X:String = "x";
	inline public static var FIELD_Y:String = "y";

	public var x(default, null):Int;
	public var y(default, null):Int;

	public function new(type:String, x:Int, y:Int)
	{
		this.x = x;
		this.y = y;

		super(type);
	}
}

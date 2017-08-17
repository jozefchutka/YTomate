package auto.isl.auto.valueObject;

class HtmlEvent extends Event
{
	inline public static var FIELD_TYPE:String = "type";

	public var type(default, null):String;

	public function new(type:String)
	{
		this.type = type;

		super();
	}
}

package auto.isl.auto.valueObject;

class HrefAssert extends Assert
{
	inline public static var FIELD_VALUE:String = "value";

	public var value(default, null):String;

	public function new(href:String)
	{
		this.value = href;

		super();
	}
}

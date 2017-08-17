package auto.isl.auto.valueObject;

class KeyboardHtmlEvent extends HtmlEvent
{
	inline public static var FIELD_KEY_CODE:String = "keyCode";

	public var keyCode(default, null):Int;

	public function new(type:String, keyCode:Int)
	{
		this.keyCode = keyCode;

		super(type);
	}
}

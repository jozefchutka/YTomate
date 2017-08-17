package auto.isl.common.valueObject;

class Error
{
	public var code(get, never):Int;
	public var message(default, null):String;

	function new(message:String)
	{
		this.message = message;
	}

	function get_code():Int
	{
		throw "This is abstract method";
	}
}

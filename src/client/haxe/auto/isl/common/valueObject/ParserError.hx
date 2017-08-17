package auto.isl.common.valueObject;

class ParserError extends Error
{
	public function new(message:String)
	{
		super(message);
	}

	override function get_code():Int
	{
		return 0;
	}
}
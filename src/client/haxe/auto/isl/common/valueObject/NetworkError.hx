package auto.isl.common.valueObject;

class NetworkError extends Error
{
	public function new()
	{
		super(null);
	}

	override function get_code():Int
	{
		return 0;
	}
}
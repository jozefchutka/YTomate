package auto.isl.common.valueObject;

import auto.isl.common.enums.HttpStatus;

class HttpError extends Error
{
	public var status(default, null):HttpStatus;

	public function new(status:HttpStatus, message:String)
	{
		this.status = status;
		super(message);
	}

	override function get_code():Int
	{
		return cast status;
	}
}
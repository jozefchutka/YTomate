package auto.isl.common.util;

import auto.isl.common.enums.HttpStatus;

class HttpStatusUtil
{
	public static function fromInt(value:Int):HttpStatus
	{
		return cast value;
	}
}

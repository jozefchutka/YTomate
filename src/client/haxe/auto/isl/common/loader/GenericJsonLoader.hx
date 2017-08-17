package auto.isl.common.loader;

import haxe.Json;
import auto.isl.common.valueObject.Error;
import auto.isl.common.valueObject.ParserError;

class GenericJsonLoader<TResult> extends GenericLoader<TResult>
{
	function parse(data:Dynamic):TResult
	{
		return null;
	}

	override function handleSuccess(json:String)
	{
		var result = null;

		try
		{
			var data = (json == "" || json == null) ? json : jsonParse(json);
			result = parse(data);
		}
		catch(error:Dynamic)
		{
			return handleError(Std.is(error, Error) ? error : new ParserError(Std.string(error)));
		}

		completed.dispatch(result);
	}

	function jsonParse(data:String):Dynamic
	{
		return Json.parse(data);
	}

	function jsonStringify(value:Dynamic, ?replacer:Dynamic->Dynamic->Dynamic):String
	{
		return Json.stringify(value, replacer);
	}
}
package auto.isl.common.parser;

class GenericParser<T>
{
	function new()
	{
	}

	public function parse(source:Dynamic):T
	{
		throw "Not implemented!";
	}

	/**
	 * Checking out for null in loop as we have seen some null values in list comming from services:
	 * Genres: [null]
	 **/
	public function parseList(source:Array<Dynamic>):Array<T>
	{
		if(source == null)
			return null;

		var result:Array<T> = [];
		for(item in source)
			if(item != null)
			{
				var parsed = parse(item);
				if (parsed != null)
					result.push(parsed);
			}

		return result.length > 0 ? result : null;
	}

	public static function parseEnum<E>(e:Enum<E>, source:String):E
	{
		if(source == null)
			return null;

		try
		{
			return Type.createEnum(e, source);
		}
		catch(error:Dynamic)
		{
			return null;
		}
	}

	public static function enumToString(source:EnumValue):String
	{
		if(source == null)
			return null;

		var result:String = Std.string(source);
		result = result.toLowerCase();
		result = StringTools.replace(result, "_", "-");
		return result;
	}
}

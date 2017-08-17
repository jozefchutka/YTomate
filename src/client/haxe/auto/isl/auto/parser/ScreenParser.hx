package auto.isl.auto.parser;

import auto.isl.auto.valueObject.Screen;
import auto.isl.common.parser.GenericParser;

class ScreenParser extends GenericParser<Screen>
{
	public function new()
	{
		super();
	}

	override function parse(source:Dynamic):Screen
	{
		var width = Reflect.field(source, Screen.FIELD_WIDTH);
		var height = Reflect.field(source, Screen.FIELD_HEIGHT);
		return new Screen(width, height);
	}
}

package auto.isl.auto.parser;

import auto.isl.auto.valueObject.HtmlEvent;
import auto.isl.auto.valueObject.MouseHtmlEvent;
import auto.isl.common.parser.GenericParser;

class MouseHtmlEventParser extends GenericParser<MouseHtmlEvent>
{
	public function new()
	{
		super();
	}

	override function parse(source:Dynamic):MouseHtmlEvent
	{
		var type = Reflect.field(source, HtmlEvent.FIELD_TYPE);
		var x = Reflect.field(source, MouseHtmlEvent.FIELD_X);
		var y = Reflect.field(source, MouseHtmlEvent.FIELD_Y);
		return new MouseHtmlEvent(type, x, y);
	}
}

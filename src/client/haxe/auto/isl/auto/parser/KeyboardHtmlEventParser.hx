package auto.isl.auto.parser;

import auto.isl.auto.valueObject.HtmlEvent;
import auto.isl.auto.valueObject.KeyboardHtmlEvent;
import auto.isl.common.parser.GenericParser;

class KeyboardHtmlEventParser extends GenericParser<KeyboardHtmlEvent>
{
	public function new()
	{
		super();
	}

	override function parse(source:Dynamic):KeyboardHtmlEvent
	{
		var type = Reflect.field(source, HtmlEvent.FIELD_TYPE);
		var keyCode = Reflect.field(source, KeyboardHtmlEvent.FIELD_KEY_CODE);
		return new KeyboardHtmlEvent(type, keyCode);
	}
}

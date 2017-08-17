package auto.isl.auto.parser;

import auto.isl.auto.valueObject.Event;
import auto.isl.auto.valueObject.KeyboardHtmlEvent;
import auto.isl.auto.valueObject.MouseHtmlEvent;
import auto.isl.auto.valueObject.HrefAssert;
import auto.isl.common.parser.GenericParser;

class EventParser extends GenericParser<Event>
{
	public function new()
	{
		super();
	}

	override function parse(source:Dynamic):Event
	{
		var c:String = Reflect.field(source, Event.FIELD_C);
		if(c == Event.getC(KeyboardHtmlEvent))
			return new KeyboardHtmlEventParser().parse(source);
		if(c == Event.getC(MouseHtmlEvent))
			return new MouseHtmlEventParser().parse(source);
		if(c == Event.getC(HrefAssert))
			return new HrefAssertParser().parse(source);
		return null;
	}
}

package auto.isl.auto.parser;

import auto.isl.auto.valueObject.HrefAssert;
import auto.isl.common.parser.GenericParser;

class HrefAssertParser extends GenericParser<HrefAssert>
{
	public function new()
	{
		super();
	}

	override function parse(source:Dynamic):HrefAssert
	{
		var href = Reflect.field(source, HrefAssert.FIELD_VALUE);
		return new HrefAssert(href);
	}
}

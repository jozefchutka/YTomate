package auto.isl.auto.parser;

import auto.isl.auto.valueObject.Step;
import auto.isl.common.parser.GenericParser;

class StepParser extends GenericParser<Step>
{
	public function new()
	{
		super();
	}

	override function parse(source:Dynamic):Step
	{
		var id = Reflect.field(source, Step.FIELD_ID);
		var delay = Reflect.field(source, Step.FIELD_DELAY);
		var command = Reflect.field(source, Step.FIELD_EVENT);
		return new Step(id, delay, new EventParser().parse(command));
	}
}

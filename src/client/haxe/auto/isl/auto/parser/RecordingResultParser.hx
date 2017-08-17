package auto.isl.auto.parser;

import auto.isl.auto.valueObject.RecordingResult;
import auto.isl.common.parser.GenericParser;

class RecordingResultParser extends GenericParser<RecordingResult>
{
	public function new()
	{
		super();
	}

	override function parse(source:Dynamic):RecordingResult
	{
		var steps = Reflect.field(source, RecordingResult.FIELD_STEPS);
		var screen = Reflect.field(source, RecordingResult.FIELD_SCREEN);
		var html = Reflect.field(source, RecordingResult.FIELD_HTML);
		return new RecordingResult(
			new StepParser().parseList(steps),
			new ScreenParser().parse(screen),
			html);
	}
}

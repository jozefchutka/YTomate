package auto.isl.auto.valueObject;

class RecordingResult
{
	inline public static var FIELD_STEPS:String = "steps";
	inline public static var FIELD_SCREEN:String = "screen";
	inline public static var FIELD_HTML:String = "html";

	public var steps(default, null):Array<Step>;
	public var screen(default, null):Screen;
	public var html(default, null):String;

	public function new(steps:Array<Step>, screen:Screen, html:String)
	{
		this.steps = steps;
		this.screen = screen;
		this.html = html;
	}
}

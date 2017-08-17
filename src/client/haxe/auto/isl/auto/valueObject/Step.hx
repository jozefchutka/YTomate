package auto.isl.auto.valueObject;

class Step
{
	inline public static var FIELD_ID:String = "id";
	inline public static var FIELD_DELAY:String = "delay";
	inline public static var FIELD_EVENT:String = "event";

	public var id(default, null):Int;
	public var delay(default, null):Int;
	public var event(default, null):Event;

	public function new(id:Int, delay:Int, event:Event)
	{
		this.id = id;
		this.delay = delay;
		this.event = event;
	}
}

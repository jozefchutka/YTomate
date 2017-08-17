package auto.executor;

import auto.isl.auto.valueObject.KeyboardHtmlEvent;
import auto.isl.auto.valueObject.MouseHtmlEvent;
import auto.isl.auto.valueObject.HrefAssert;
import auto.isl.auto.valueObject.RecordingResult;
import auto.isl.auto.valueObject.Step;
import auto.util.HtmlUtil;
import haxe.Timer;
import js.Browser;

class Executor
{
	var source:RecordingResult;
	var currentStep:Step;

	public function new(source:RecordingResult)
	{
		this.source =  source;
	}

	public function start()
	{
		next();
	}

	function complete()
	{
		trace("execution completed");
	}

	function next()
	{
		var steps = source.steps;
		if(steps == null || steps.length == 0)
			return complete();

		var index = 0;
		if(currentStep != null)
			index = steps.indexOf(currentStep) + 1;
		if(index >= steps.length)
			return complete();

		currentStep = steps[index];
		if(currentStep.delay != 0)
			Timer.delay(executeCurrentStep, currentStep.delay);
		else
			executeCurrentStep();
	}

	function executeCurrentStep()
	{
		var event = currentStep.event;
		trace("Executing step " + currentStep.id + " - " + event.c);

		var mouseEvent:MouseHtmlEvent = Std.instance(event, MouseHtmlEvent);
		var keyboardEvent:KeyboardHtmlEvent = Std.instance(event, KeyboardHtmlEvent);
		var navigationAssert:HrefAssert = Std.instance(event, HrefAssert);
		if(mouseEvent != null)
			handleMouseHtmlEvent(mouseEvent);
		else if(keyboardEvent != null)
			handleKeyboardHtmlEvent(keyboardEvent);
		else if(navigationAssert != null)
			handleNavitaionAssert(navigationAssert);
		next();
	}

	function handleMouseHtmlEvent(source:MouseHtmlEvent)
	{
		var event = HtmlUtil.createMouseEvent(source);
		Browser.document.elementFromPoint(source.x, source.y).dispatchEvent(event);
	}

	function handleKeyboardHtmlEvent(source:KeyboardHtmlEvent)
	{
		var event = HtmlUtil.createKeyboardEvent(source);
		Browser.document.dispatchEvent(event);
	}

	function handleNavitaionAssert(source:HrefAssert)
	{
		assert(source.value, HtmlUtil.getHref(), "NavigationAssert");
	}

	function assert(expected:String, actual:String, message:String)
	{
		var result = expected == actual;
		if(result)
			trace(message + " OK");
		else
			trace(message + " FAIL (" + expected + " != " + actual + ")");
	}
}

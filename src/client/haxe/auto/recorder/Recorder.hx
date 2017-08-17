package auto.recorder;

import auto.isl.auto.valueObject.Event;
import auto.isl.auto.valueObject.KeyboardHtmlEvent;
import auto.isl.auto.valueObject.MouseHtmlEvent;
import auto.isl.auto.valueObject.HrefAssert;
import auto.isl.auto.valueObject.RecordingResult;
import auto.isl.auto.valueObject.Step;
import auto.util.HtmlUtil;
import haxe.Json;
import js.Browser;
import js.html.KeyboardEvent;
import js.html.MouseEvent;

class Recorder
{
	var steps:Array<Step> = [];
	var lastStepTime:Float = 0;
	var stepId:Int = 0;

	public function new()
	{
	}

	public function start()
	{
		Browser.document.addEventListener("mousedown", onMouseEvent, true);
		Browser.document.addEventListener("mouseup", onMouseEvent, true);
		Browser.document.addEventListener("click", onMouseEvent, true);

		Browser.document.addEventListener("keydown", onKeyboardEvent, true);
		Browser.document.addEventListener("keypress", onKeyboardEvent, true);
		Browser.document.addEventListener("keyup", onKeyboardEvent, true);
	}

	public function stop()
	{
		Browser.document.removeEventListener("mousedown", onMouseEvent, true);
		Browser.document.removeEventListener("mouseup", onMouseEvent, true);
		Browser.document.removeEventListener("click", onMouseEvent, true);

		Browser.document.removeEventListener("keydown", onKeyboardEvent, true);
		Browser.document.removeEventListener("keypress", onKeyboardEvent, true);
		Browser.document.removeEventListener("keyup", onKeyboardEvent, true);

		steps = [];
	}

	function addEvent(event:Event)
	{
		var delay = 0;
		var now = Date.now().getTime();
		if(lastStepTime != 0)
			delay = Std.int(now - lastStepTime);
		lastStepTime = now;
		steps.push(new Step(stepId++, delay, event));
	}

	function getResult()
	{
		var screen = HtmlUtil.getScreen();
		var html = HtmlUtil.removeScripts(HtmlUtil.getHtml())
			+ "\n\n<style>" + HtmlUtil.getCss() + "</style>";
		return new RecordingResult(steps, screen, html);
	}

	public function assertHref()
	{
		addEvent(new HrefAssert(HtmlUtil.getHref()));
	}

	function onMouseEvent(event:MouseEvent)
	{
		addEvent(new MouseHtmlEvent(event.type, event.clientX, event.clientY));
	}

	function onKeyboardEvent(event:KeyboardEvent)
	{
		addEvent(new KeyboardHtmlEvent(event.type, event.keyCode));
	}
}

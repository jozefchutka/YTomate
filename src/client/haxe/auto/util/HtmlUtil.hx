package auto.util;

import auto.isl.auto.valueObject.KeyboardHtmlEvent;
import auto.isl.auto.valueObject.MouseHtmlEvent;
import auto.isl.auto.valueObject.Screen;
import js.Browser;
import js.html.MouseEvent;
import js.html.MouseEventInit;

class HtmlUtil
{
	public static function getTagName(target:Dynamic):String
	{
		var result:String = Reflect.field(target, "tagName");
		return result == null ? null : result.toUpperCase();
	}

	public static function isInput(target:Dynamic):Bool
	{
		var tagName = getTagName(target);
		return tagName == "TEXTAREA" || tagName == "INPUT" || tagName == "SELECT";
	}

	public static function getHref()
	{
		return Browser.window.location.href;
	}

	public static function getScreen()
	{
		return new Screen(Browser.window.screen.width, Browser.window.screen.height);
	}

	public static function getHtml()
	{
		return Browser.document.documentElement.outerHTML;
	}

	public static function getCss()
	{
		var result = "";
		for(sheet in Browser.document.styleSheets)
		{
			var rules:Array<Dynamic> = untyped sheet.cssRules;
			for(rule in rules)
				result += rule.cssText;
		}
		return result;
	}

	public static function removeScripts(source:String)
	{
		var result = source;
		var scriptMatcher = ~/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi;
		var noscriptMatcher = ~/<noscript\b[^<]*(?:(?!<\/noscript>)<[^<]*)*<\/noscript>/gi;
		var linkMatcher = ~/<link[^>]*>/gi;
		result = scriptMatcher.replace(result, "<!-- script -->");
		result = noscriptMatcher.replace(result, "<!-- noscript -->");
		result = linkMatcher.replace(result, "<!-- link -->");
		return result;
	}

	public static function createMouseEvent(source:MouseHtmlEvent)
	{
		var init:MouseEventInit = {
			bubbles: true,
			cancelable: true,
			view: Browser.document.defaultView,
			screenX: source.x,
			screenY: source.y
		}
		return new MouseEvent(source.type, init);
	}

	public static function createKeyboardEvent(source:KeyboardHtmlEvent)
	{
		var event = Browser.document.createEvent("Events");
		event.initEvent(source.type, true, true);
		untyped event.keyCode = source.keyCode;
		untyped event.which = source.keyCode;
		return event;
	}
}

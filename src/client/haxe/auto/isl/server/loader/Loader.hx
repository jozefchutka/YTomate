package auto.isl.server.loader;

import auto.isl.common.loader.GenericJsonLoader;
import auto.isl.server.valueObject.Response;

class Loader extends GenericJsonLoader<Response>
{
	public function new(url:String)
	{
		super(url);
	}

	override function load()
	{
		super.load();
		loader.xhr.timeout = 30000;
	}

	override function parse(data:Dynamic):Response
	{
		return data;
	}
}

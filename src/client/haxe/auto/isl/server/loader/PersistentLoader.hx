package auto.isl.server.loader;

import auto.isl.common.valueObject.Error;
import auto.isl.server.valueObject.Response;

class PersistentLoader
{
	var url:String;
	var loader:Loader;

	public function new(url:String)
	{
		this.url = url;

		reset();
	}

	public function load()
	{
		loader.load();
	}

	function reset()
	{
		loader = new Loader(url);
		loader.completed.add(onLoaderCompleted);
		loader.failed.add(onLoaderFailed);
		loader.disposed.add(onLoaderDisposed);
	}

	function onLoaderCompleted(data:Response)
	{
		trace(data);
	}

	function onLoaderFailed(error:Error)
	{
		trace(error);
	}

	function onLoaderDisposed()
	{
		reset();
		load();
	}
}

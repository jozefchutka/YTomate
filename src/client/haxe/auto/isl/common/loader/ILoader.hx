package auto.isl.common.loader;

import auto.isl.common.valueObject.Error;
import msignal.Signal;
import yloader.valueObject.Request;

interface ILoader<TResult>
{
	var completed(default, null):Signal1<TResult>;
	var failed(default, null):Signal1<Error>;
	var disposed(default, null):Signal0;
	var request:Request;
	var isDisposed(get, never):Bool;

	/**
	 * Multiple load()s can be executed before the loader instance is disposed. When another load() is called during
	 * a pending one, only the last response is captured.
	 **/
	function load():Void;

	/**
	 * In order to abort/cancel/pause a pending loader, cancel() can be executed. The request can be reloaded using
	 * load() method. After the loader is completed and disposed cancel() can not be called anymore.
	 **/
	function cancel():Void;

	/**
	 * After a dispose() is executed (internally after loader response) the instance of this loader is ready to be GCed
	 * and is not available for another use. This approach guarantees that only one execution of completed (or failed)
	 * and dispatched will be triggered.
	 **/
	function dispose():Void;
}

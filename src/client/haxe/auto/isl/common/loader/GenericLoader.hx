package auto.isl.common.loader;

import auto.isl.common.util.HttpStatusUtil;
import auto.isl.common.valueObject.Error;
import auto.isl.common.valueObject.HttpError;
import auto.isl.common.valueObject.NetworkError;
import msignal.Signal;
import yloader.enums.Method;
import yloader.impl.js.Loader;
import yloader.impl.js.XMLHttpRequestLoader;
import yloader.valueObject.Parameter;
import yloader.valueObject.Request;
import yloader.valueObject.Response;

class GenericLoader<TResult> implements ILoader<TResult>
{
	public var completed(default, null):Signal1<TResult>;
	public var failed(default, null):Signal1<Error>;
	public var disposed(default, null):Signal0;
	public var request:Request;
	public var isDisposed(get, never):Bool;

	var loader:XMLHttpRequestLoader;
	var method(get, set):Method;
	var postData(get, set):String;

	function new(url:String)
	{
		this.completed = new Signal1();
		this.failed = new Signal1();
		this.disposed = new Signal0();

		request = new Request(url);
		method = Method.GET;
		loader = createLoader();
		loader.onResponse = onResponse;
	}

	function get_method():Method
	{
		return request.method;
	}

	function set_method(value:Method):Method
	{
		return request.method = value;
	}

	function get_postData():String
	{
		return request.data;
	}

	function set_postData(value:String):String
	{
		return request.data = value;
	}

	function get_isDisposed():Bool
	{
		return disposed == null;
	}

	function createLoader()
	{
		return Loader.create(request);
	}

	function setParameter(name:String, value:String)
	{
		request.setGetParameter(new Parameter(name, value));
	}

	function setHeader(name:String, value:String)
	{
		request.setHeader(new Parameter(name, value));
	}

	public function load()
	{
		if(isDisposed)
			throw "Loader has been already disposed!";

		loader.load();
	}

	public function cancel()
	{
		if(isDisposed)
			throw "Loader has been already disposed!";

		loader.cancel();
	}

	public function dispose()
	{
		if(!isDisposed)
			cancel();

		if(completed != null)
			completed.removeAll();
		completed = null;

		if(failed != null)
			failed.removeAll();
		failed = null;

		if(disposed != null)
		{
			disposed.dispatch();
			disposed.removeAll();
		}
		disposed = null;
	}

	function handleSuccess(data:String)
	{
		completed.dispatch(cast data);
	}

	function handleHttpError(error:HttpError)
	{
		handleError(error);
	}

	function handleError(error:Error)
	{
		failed.dispatch(error);
	}

	function onResponse(response:Response)
	{
		if(response.success)
			handleSuccess(response.data);
		else if (response.status == 0)
			handleError(new NetworkError());
		else
			handleHttpError(new HttpError(HttpStatusUtil.fromInt(response.status), response.data));
		dispose();
	}
}

package socketio.server;

import haxe.extern.Rest;

extern class Namespace
{
	public var name(default, never):String;
	public var connected(default, never):{};
	public var adapter(default, never):Adapter;
	public function to(room:String):Namespace;
	@:native("in")
	public function inRoom(room:String):Namespace;
	public function emit(eventName:String, args:Rest<Dynamic>):Socket;
	public function clients(callback:Dynamic->Dynamic):Void;
	public function use(fn:Socket->Dynamic->Void):Void;

	public function on(eventName:String, ?callback:Dynamic->Void):Socket;
}

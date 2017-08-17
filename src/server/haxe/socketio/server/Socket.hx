package socketio.server;

extern class Socket
{
	public var id(default, never):String;
	public var rooms(default, never):{};
	public var client(default, never):Client;
	public var conn(default, never):Socket;
	public var request(default, never):Dynamic;
	public var handshake(default, never):Handshake;

	public function use(fn:Socket->Void):Void;
	public function send(?args:Dynamic, ?ack:Dynamic->Dynamic):Socket;
	public function emit(eventName:String, ?args:Dynamic, ?ack:Dynamic->Dynamic):Socket;
	public function on(eventName:String, ?callback:Dynamic->Void):Socket;
	@:overload(function (names:Array<String>, ?callback:Dynamic->Dynamic):Socket{})
	public function join(name:String, ?callback:Dynamic):Socket;
	public function leave(name:String, ?callback:Dynamic):Socket;
	public function to(room:String):Socket;
	@:native("in")
	public function inRoom(room:String):Socket;
	public function disconnect(close:Bool):Socket;
}

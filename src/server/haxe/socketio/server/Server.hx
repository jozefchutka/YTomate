package socketio.server;

@:native("require('socket.io')")
extern class Server
{
	public var sockets(default, never):Namespace;
	//engine.generateId

	public function new(?a:Dynamic, ?b:Dynamic);
	public function serveClient(v:Bool):Server;
	public function path(value:String):Server;
	public function adapter(value:Adapter):Server;

	@:overload(function (fn:Dynamic->Dynamic):Server{})
	public function origins(value:String):Server;

	@:overload(function (port:Int, ?options:Dynamic):Server{})
	public function attach(httpServer:Server, ?options:Dynamic):Server;

	@:overload(function (port:Int, ?options:Dynamic):Server{})
	public function listen(httpServer:Server, ?options:Dynamic):Server;

	public function bind(engine:Server):Server;
	public function onconnection(socket:Socket):Server;
	public function of(nsp:String):Namespace;
	public function close(?callback:Dynamic->Dynamic):Void;
}

package ;

import express.Express;
import express.Request;
import express.Response;
import express.Router;
import js.node.Http;
import socketio.server.Namespace;
import socketio.server.Server;
import socketio.server.Socket;

class Main
{
	static var io:Server;
	static var clientNamespace:Namespace;
	static var managerNamespace:Namespace;

	static function main()
	{
		var app = new Express();
		var http = Http.createServer(untyped app);
		var router = new Router();
		router.use(onRouterUse);
		router.get('/', onRouterGet);
		router.get('/user/:id', onRouterGetUserId);
		//app.get('/', onGet);
		app.use('/api', router);
		app.use(Express.serveStatic('static'));

		io = new Server(http);
		clientNamespace = io.of("/client");
		clientNamespace.on("connection", onClientConnection);
		managerNamespace = io.of("/manager");
		managerNamespace.on("connection", onManagerConnection);

		http.listen(3000);
	}

	/*
	static function onGet(request:Request, response:Response)
	{
		response.sendFile(untyped __dirname + '/static/server.html');
	}
	*/

	static function onClientConnection(socket:Socket)
	{
		trace("onClientConnection");
		trace(socket.handshake.query.username);
		socket.on('chat message', onChatMessage);
	}

	static function onManagerConnection(socket:Socket)
	{
		trace("onManagerConnection");
		var clients:Array<String> = [];
		var connectedClients = clientNamespace.connected;
		for(key in Reflect.fields(connectedClients))
		{
			var clientSocket:Socket = Reflect.field(connectedClients, key);
			clients.push(clientSocket.handshake.query.username);
		}

		trace(clients);
		managerNamespace.emit('clients', clients);
	}

	static function onChatMessage(message)
	{
		clientNamespace.emit('chat message', message);
	}

	static function onRouterUse(request:Request, response:Response, next:Dynamic)
	{
		trace('Something is happening.');
		next(); // make sure we go to the next routes and don't stop here
	}

	static function onRouterGet(request:Request, response:Response)
	{
		response.json({message:"hello"});
	}

	static function onRouterGetUserId(request:Request, response:Response)
	{
		var params:Dynamic = request.params;
		response.json({id:params.id});
	}
}

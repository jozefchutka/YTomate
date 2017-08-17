package socketio.server;

@:native("(typeof io == 'undefined' ? require('socket.io-client') : io)")
extern class Client extends Socket
{
    @:selfCall
    public function new(?server:String);
}

package socketio.server;

extern class Handshake
{
	public var headers:Dynamic; /* the headers sent as part of the handshake */
	public var time:Dynamic; /* the date of creation (as string) */
	public var address:Dynamic; /* the ip of the client */
	public var xdomain:Dynamic; /* whether the connection is cross-domain */
	public var secure:Dynamic; /* whether the connection is secure */
	public var issued:Dynamic; /* the date of creation (as unix timestamp) */
	public var url:Dynamic; /* the request URL string */
	public var query:Dynamic; /* the query object */
}

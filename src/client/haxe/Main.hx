package ;

import auto.isl.server.loader.PersistentLoader;
import auto.executor.Executor;
import auto.isl.auto.parser.RecordingResultParser;
import auto.recorder.Recorder;

class Main
{
	static var recorder:Recorder;
	static var loader:PersistentLoader;

	static function main()
	{
		recorder = new Recorder();
		loader = new PersistentLoader("server.php");
		loader.load();
	}

	static function execute(source:Dynamic)
	{
		var list = new RecordingResultParser().parse(source);
		var executor = new Executor(list);
		executor.start();
	}
}

#if android
package;

import flixel.FlxState;
import extension.webview.WebView;

using StringTools;

class BrowserVideoPlayer
{
	public static var androidPath:String = 'file:///android_asset/assets/video/';

        public var finishCallback:Void->Void = null;

        public var stateCallback:FlxState;

	public function new()
	{

	}

        public function playVideo(source:String)
	{
		WebView.onClose = onClose;
		WebView.onURLChanging= onURLChanging;

		WebView.open(androidPath + source + '.html', false, null, ['http://exitme(.*)']);
	}

	function onClose()
	{
                if (finishCallback != null)
                {
			finishCallback();
		}
		else if (stateCallback != null)
		{
			LoadingState.loadAndSwitchState(stateCallback);
		}
	}

	function onURLChanging(url:String) 
	{
		if (url == 'http://exitme/') 
                         onClose(); // drity hack lol
	}
}
#end//only for android

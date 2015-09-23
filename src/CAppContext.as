package
{
	import flash.display.DisplayObjectContainer;
	
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	
	/**
	 * ...
	 * @author Alexander M.
	 */
	
	public class CAppContext
	{
		private var context:IContext;
		
		public function CAppContext(view:DisplayObjectContainer) {
			context = new Context()
				.install(MVCSBundle)
				.configure(CAppConfig)
				.configure(new ContextView(view));
		}
	}
}
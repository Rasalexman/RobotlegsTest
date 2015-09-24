package
{
	import flash.display.DisplayObjectContainer;
	
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	import com.configures.CAppConfig;
	import com.configures.CCommandsConfig;
	import com.configures.CMediatorsConfig;
	import com.configures.CModelConfig;
	import com.configures.CServicesConfig;
	
	/**
	 * ...
	 * @author Alexander M.
	 */
	
	public class CAppContext
	{
		private var _mContext		:IContext;
		
		public function CAppContext(view:DisplayObjectContainer) {
			_mContext = new Context()
				.install(MVCSBundle)
				.configure(CAppConfig, CModelConfig, CServicesConfig, CCommandsConfig, CMediatorsConfig)
				.configure(new ContextView(view));
		}

		public function get context():IContext {
			return _mContext;
		}

	}
}
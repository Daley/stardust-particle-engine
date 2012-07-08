package idv.cjcat.stardust.twoD.pyronova {
	import idv.cjcat.stardust.common.xml.ClassPackage;
	import idv.cjcat.stardust.twoD.pyronova.handlers.PyroGroupHandler;
	import idv.cjcat.stardust.twoD.pyronova.initializers.PyroNodeClass;
	
	/**
	 * Packs together classes for the Stardust Pyronova extension.
	 *
	 * <p>
	 * To enable XML support for this extension, use the <code>XMLBuilder.registerClassesFromClassPackage()</code> method
	 * to register related classes to the <code>XMLBuilder</code> object first.
	 * </p>
	 *
	 */
	public class PyronovaClassPackage extends ClassPackage {
		
		private static var _instance:PyronovaClassPackage;
		
		public static function getInstance():PyronovaClassPackage {
			if (!_instance) _instance = new PyronovaClassPackage();
			return _instance;
		}
		
		public function PyronovaClassPackage() {
			
		}
		
		
		override protected final function populateClasses():void {
			//Pyronova initializers
			classes.push(PyroNodeClass);
			
			//Pyronova particle handlers
			classes.push(PyroGroupHandler);
		}
	}
}
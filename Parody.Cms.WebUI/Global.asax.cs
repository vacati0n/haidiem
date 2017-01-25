using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Umbraco.Core;
using Umbraco.Web;

namespace Parody.Cms.WebUI
{
    //public class MvcApplication : System.Web.HttpApplication
    //{
    //    protected void Application_Start()
    //    {
    //        AreaRegistration.RegisterAllAreas();
    //        FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
    //        RouteConfig.RegisterRoutes(RouteTable.Routes);
    //        BundleConfig.RegisterBundles(BundleTable.Bundles);
    //    }

    //}
    public class MvcApplication : UmbracoApplication
    {
        protected override void OnApplicationStarted(object sender, EventArgs e)
        {
            base.OnApplicationStarted(sender, e);
        }

        protected override void OnApplicationEnd(object sender, EventArgs e)
        {
            base.OnApplicationEnd(sender, e);
        }

    }

    public class WebExtGlobal : ApplicationEventHandler
    {
        protected override void ApplicationStarted(UmbracoApplicationBase umbracoApplication, ApplicationContext applicationContext)
        {

            base.ApplicationStarted(umbracoApplication, applicationContext);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            //RouteConfig.RegisterRoutes(RouteTable.Routes);

        }
    }
}

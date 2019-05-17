using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AJAX_WF.Startup))]
namespace AJAX_WF
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

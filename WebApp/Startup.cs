using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.Facebook;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using ShopGame.Repository.IRepository;
using ShopGame.Repository.Repository;
using ShopGame.Service.IService;
using ShopGame.Service.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers().AddNewtonsoftJson();

            services.AddHttpClient();
            services.AddMvc(x => x.EnableEndpointRouting = false);
            services.AddControllers();


            services.AddControllersWithViews().AddRazorRuntimeCompilation();
            services.AddDistributedMemoryCache();

            services.AddSession(x => x.IOTimeout = TimeSpan.FromSeconds(30 * 60));
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();

            services.AddServerSideBlazor();
            // repository
            services.AddTransient<ICommonRepository, CommonRepository>();
            services.AddTransient<IAuthenticationRepository, AuthenticationRepository>();
            services.AddTransient<IProductRepository, ProductRepository>();
            services.AddTransient<IBlogTypeRepository, BlogTypeRepository>();
            services.AddTransient<ICardAdminRepository, CardAdminRepository>();
            services.AddTransient<INotificationRepository, NotificationRepository>();
            services.AddTransient<ISkinCategoryRepository, SkinCategoryRepository>();
            services.AddTransient<ISlideRepository, SlideRepository>();
            services.AddTransient<ITransactionTypeRepository, TransactionTypeRepository>();
            services.AddTransient<ISkinRepository, SkinRepository>();
            services.AddTransient<IUserRepository, UserRepository>();
            services.AddTransient<INCCRepository, NCCRepository>();
            services.AddTransient<IGiaTriTheRepository, GiaTriTheRepository>();
            services.AddTransient<ITransactionCardRepository, TransactionCardRepository>();
            services.AddTransient<IProductTransactionRepository, ProductTransactionRepository>();
            services.AddTransient<INapTheTransactionRepository, NapTheTransactionRepository>();
            services.AddTransient<IStepRepository, StepRepository>();
            services.AddTransient<IMasterDataRepository, MasterDataRepository>();

            // service
            services.AddTransient<IAuthenticationService, AuthenticationService>();
            services.AddTransient<IProductService, ProductService>();
            services.AddTransient<IBlogTypeService, BlogTypeService>();
            services.AddTransient<ICardAdminService, CardAdminService>();
            services.AddTransient<INotificationService, NotificationService>();
            services.AddTransient<ISkinCategoryService, SkinCategoryService>();
            services.AddTransient<ISlideService, SlideService>();
            services.AddTransient<ITransactionTypeService, TransactionTypeService>();
            services.AddTransient<ISkinService, SkinService>();
            services.AddTransient<IUserService, UserService>();
            services.AddTransient<INCCService, NCCService>();
            services.AddTransient<IGiaTriTheService, GiaTriTheService>();
            services.AddTransient<ITransactionCardService, TransactionCardService>();
            services.AddTransient<IProductTransactionService, ProductTransactionService>();
            services.AddTransient<INapTheTransactionService, NapTheTransactionService>();
            services.AddTransient<IStepService, StepService>();
            services.AddTransient<IMasterDataService, MasterDataService>();

            //fb
            services.AddAuthentication(options => {
                options.DefaultScheme = CookieAuthenticationDefaults.AuthenticationScheme;

            }).AddCookie(options =>
            {
                options.LoginPath = "/auth/Facebook";
            }).AddFacebook(facebookOptions =>
            {
                facebookOptions.AppId = Configuration.GetValue<String>("AppID");
                facebookOptions.AppSecret = Configuration.GetValue<String>("AppSecret");
            });
            


            //repository client
            services.AddTransient<IClientSlideRepository, ClientSlideRepository>();

            // service client
            services.AddTransient<IClientSlideService, ClientSlideService>();

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseSession();

            app.UseHttpsRedirection();

            app.UseStaticFiles();

            app.UseRouting();

            app.UseCors(options => options.AllowAnyOrigin().AllowAnyHeader());

            app.UseCors("AllowAllCorsPolicy");

            app.UseAuthentication();
            app.UseAuthorization();
            app.UseMvc(routes =>
            {
                routes.MapRoute(
                  name: "areas",
                  template: "{area:exists}/{controller=Home}/{action=Index}/{id?}"
                );

                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");
            });
            //app.UseEndpoints(endpoints =>
            //{

            //    endpoints.MapControllerRoute(
            //        name: "default",
            //        pattern: "{controller=Home}/{action=Index}/{id?}");
            //});


        }
    }
}

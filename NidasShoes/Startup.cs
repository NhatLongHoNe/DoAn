
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using NidasShoes.Repository.IRepository;
using NidasShoes.Repository.Repository;
using NidasShoes.Service.IService;
using NidasShoes.Service.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NidasShoes
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
            services.AddRazorPages();
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
            //services.AddTransient<IUserRepository, UserRepository>();
            services.AddTransient<IDiscountRepository, DiscountRepository>();
            services.AddTransient<ISupplyRepository, SupplyRepository>();
            services.AddTransient<IShopRepository, ShopRepository>();
            services.AddTransient<ISlideRepository, SlideRepository>();
            services.AddTransient<IFeedBackRepository, FeedBackRepository>();
            services.AddTransient<IProductReviewRepository, ProductReviewRepository>();
            services.AddTransient<IProductColorRepository, ProductColorRepository>();
            services.AddTransient<IProductSizeRepository, ProductSizeRepository>();
            services.AddTransient<IProductRepository, ProductRepository>();
            services.AddTransient<IOrderRepository, OrderRepository>();



            // service
            services.AddTransient<IAuthenticationService, AuthenticationService>();
            //services.AddTransient<IUserService, UserRepository>();
            services.AddTransient<IDiscountService, DiscountService>();
            services.AddTransient<ISupplyService, SupplyService>();
            services.AddTransient<IShopService, ShopService>();
            services.AddTransient<ISlideService, SlideService>();
            services.AddTransient<IFeedBackService, FeedBackService>();
            services.AddTransient<IProductReviewService, ProductReviewService>();
            services.AddTransient<IProductColorService, ProductColorService>();
            services.AddTransient<IProductSizeService, ProductSizeService>();
            services.AddTransient<IProductService, ProductService>();
            services.AddTransient<IOrderService, OrderService>();


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
        }
    }
}

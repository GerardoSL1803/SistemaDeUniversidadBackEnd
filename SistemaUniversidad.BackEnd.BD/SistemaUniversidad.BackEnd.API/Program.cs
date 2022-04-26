using SistemaUniversidad.BackEnd.API.Services.Interfaces;
using SistemaUniversidad.BackEnd.API.UnitOfWork;
using SistemaUniversidad.BackEnd.API.UnitOfWork.SqlServer;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//Aca van todos los servicios de cada Entidad
builder.Services.AddTransient<IUnitOfWork, UnitOfWorkSqlServer>();
builder.Services.AddTransient<IAulasService, AulasService>();
builder.Services.AddTransient<IEstudiantesService, IEstudiantesService>();

builder.Services.AddControllers()
                //.AddJsonOptions(options =>
                //{
                //    //Permite que se mantengan las propiedades tal cual se escriben en los modelos
                //    options.JsonSerializerOptions.PropertyNamingPolicy = null;
                //})
                .ConfigureApiBehaviorOptions(options =>
                {
                    //Permite controlar el estado de los modelos cuando llegan a un controlador
                    options.SuppressModelStateInvalidFilter = true;
                });

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

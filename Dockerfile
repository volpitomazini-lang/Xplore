FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copia tudo para o container
COPY . .

# Restaura e publica apontando diretamente para a pasta que tens no repositório
RUN dotnet restore "XploreBackend/XploreBackend.csproj"
RUN dotnet publish "XploreBackend/XploreBackend.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .

ENTRYPOINT ["dotnet", "XploreBackend.dll"]








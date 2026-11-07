FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY . .

# Restaura e publica apontando para o caminho correto detetado
RUN dotnet restore "XploreBackend/Xplore/Xplore.csproj"
RUN dotnet publish "XploreBackend/Xplore/Xplore.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .

ENTRYPOINT ["dotnet", "Xplore.dll"]








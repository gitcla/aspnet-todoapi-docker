FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build
WORKDIR /app

# copy all the files
COPY *.json ./
COPY *.csproj ./
COPY *.cs ./
COPY ./Controllers/. ./Controllers/
COPY ./Models/. ./Models/
COPY ./Properties/. ./Properties/

RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/core/aspnet:2.2 AS runtime
WORKDIR /app
COPY --from=build /app/out ./
ENTRYPOINT ["dotnet", "TodoApi.dll"]

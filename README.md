# Develop and deploy an ASP.NET REST API with Docker on Linux

Setup, develop and deploy an ASP.NET project with Docker is really easy, Microsoft provides official images and tutorials to start:

https://docs.microsoft.com/en-us/aspnet/core/host-and-deploy/docker/building-net-docker-images?view=aspnetcore-2.2

https://docs.microsoft.com/en-US/aspnet/core/tutorials/first-web-api?view=aspnetcore-2.2&tabs=visual-studio-code

This repository is based on the demo with some bash scripts added to start and build the code.

The container can be started in watch mode with the provided script dotnet-watch.sh:

```
docker run -it --rm                       \
    -p 5000:5000                          \
    -v $PWD:/app -w /app                  \
    mcr.microsoft.com/dotnet/core/sdk:2.2 \
    dotnet watch run --urls=http://+:5000
```

Point your browser to the link:  http://\<your machine\>:5000/api/todo to check the running service.   Now try to change some code, the watch mode should detect modifications, recompile and run the new version.

Finally, the Dockerfile provided uses multi stage building to compile the code on the SDK container and run it on a smaller runtime container.

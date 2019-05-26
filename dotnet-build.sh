#!/bin/bash

docker run -it --rm                       \
    -p 5000:80                            \
    -v $PWD:/app -w /app                  \
    mcr.microsoft.com/dotnet/core/sdk:2.2 \
    dotnet publish -c Release -o published

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 8080

ENV ASPNETCORE_ENVIRONMENT=Development
ENV ASPNETCORE_URLS=http://0.0.0.0:8080

# ENV SECRET_PASSWORD=${DB_CHESS_USER_PASSWORD}
# RUN echo ${SECRET_PASSWORD}

ARG DB_CHESS_USER_PASSWORD
ENV SECRET_PASSWORD = $DB_CHESS_USER_PASSWORD
ENV CONNECTION_STRING="Server=10.109.0.3;Database=Chess;MultipleActiveResultSets=true;UID=chess;PWD=${SECRET_PASSWORD}"

RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["Web/Chess.Web/Chess.Web.csproj", "Web/Chess.Web/"]
COPY . .
RUN dotnet restore "Web/Chess.Web/Chess.Web.csproj"
WORKDIR "/src/Web/Chess.Web"
RUN dotnet build "Chess.Web.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Chess.Web.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Chess.Web.dll", "SECRET_PASSWORD=${SECRET_PASSWORD}"]

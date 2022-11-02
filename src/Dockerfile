FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 8080

ENV ASPNETCORE_ENVIRONMENT=Development
ENV ASPNETCORE_URLS=http://0.0.0.0:8080

ARG PASSWD_CHESS_DB_USER
ENV DB_PASSWORD = $PASSWD_CHESS_DB_USER
ENV CONNECTION_STRING="Server=10.109.0.3;Database=Chess;MultipleActiveResultSets=true;UID=chess;PWD=${DB_PASSWORD}"

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
ENTRYPOINT ["dotnet", "Chess.Web.dll", "-e", 'DB_PASSWORD=gcloud secrets versions access 1 --secret="chess-db-user-password"']

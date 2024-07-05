# Matrix Wiki

## Run in development mode (live reload)

```bash
nix develop --command bash -c "templ generate --watch --proxy=\"http://localhost:6969\" --cmd=\"go run .\""
```

## Build an executable

```bash
nix build --system x86_64-linux .
```

## Build docker image

```bash
nix build --system x86_64-linux .#docker
```

## Run docker image

```bash
docker load < result # Get image name from the output

docker run localhost/matrix-wiki-docker:blablabla
```

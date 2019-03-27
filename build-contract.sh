docker build -t $(basename "$PWD") .
docker image tag $(basename "$PWD") localhost:5000/$(basename "$PWD")
docker push localhost:5000/$(basename "$PWD")
curl --silent --header "Accept: application/vnd.docker.distribution.manifest.v2+json" "http://localhost:5000/v2/$(basename "$PWD")/manifests/latest" | jq -r '.config.digest'

docker build -t %cd% .
docker image tag %cd% localhost:5000/%cd%
docker push localhost:5000/%cd%
curl --silent --header "Accept: application/vnd.docker.distribution.manifest.v2+json" "http://localhost:5000/v2/%cd%/manifests/latest" | jq -r '.config.digest'

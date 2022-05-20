# add docker commands
# needed for m1 mac or winows only since native image will not on aws 
docker buildx build --push --platform linux/amd64,linux/arm64 -t rixonmathew/multiarch-lightsail-hello-world:buildx-latest .

# add aws 
aws lightsail create-container-service --service-name helloworld-flask --power nano --scale 1

aws lightsail push-container-image --service-name helloworld-flask --label hello-world --image rixonmathew/multiarch-lightsail-hello-world:buildx-latest 

aws lightsail create-container-service-deployment --cli-input-json file://lc.json  

#cleanup
aws lightsail delete-container-service --service-name helloworld-flask
### Solution for build once and deploy everywhere.

Application will be build from jenkins using docker multistage build and create a docker image and push the image to AWS container registry.
When creating the image we will include the properties as environment variables.
Then we can include these properties in a configmap and passwords as kubernetes secrets or we can store in AWS secret manager. This way we can achieve build once deploy anywhere. 

![alt text](https://github.com/PreslyJ/different-assesment/blob/master/image2.png?raw=true)


### Infrastructure diagram 

![alt text](https://github.com/PreslyJ/different-assesment/blob/master/image1.png?raw=true)

Ref - https://learn.hashicorp.com/tutorials/terraform/eks

Above diagram depicts the eks cluster provisioned for this assesment

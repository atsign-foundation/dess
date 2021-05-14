<img src="https://atsign.dev/assets/img/@dev.png?sanitize=true">

### Now for a little internet optimism

#README

Distributed Edge Secondary Server (dess)

The @protocol was written and developed with "distribute what you can and centralized what you must" as a design requirement.
Each @sign has it's own microservice and that microservice can run anywhere as long as it is directly addressable on the internet. 
By this we mean it has a dedicated DNS address and port number, also required is an SSL certificate to allow TLS encrypted communications. 

This means that by design you can run your own secondary server or have someone you trust to run it reliably run it for you. 
Why would you do that ? Well perhaps you like to have the control, or your requirements need more infrastructure than The @ Company provide on their secondary infrastructure.

Whatever the use case we want to make it easy for you run your own Secondary.

We welcome contributions - we want pull requests and to hear about issues. We are also very interested in your use cases!

## Who is this for?

We use Linux as our base OS any flavour is fine, we also use docker. So some basic Linux skills are useful. 
As with any Internet protocol, you will need to provide internet access and in some case may have to port forward to the secondary if your machine is perhaps behind a router or a firewall.
If you have set up a NAT before then you will have no issues, if not its worth understanding how you can provide the internet connectivity required in your environment before proceeding.

Finally you will need an @sign and you can get a free one or a custom one at [atsign.com](https://atsign.com)

### Contributor

These instructions are not going to cover every use case but if you found them useful and found some things missing, please contribute and help others.
[CONTRIBUTING.md](CONTRIBUTING.md) is going to have the detailed guidance on how to setup their tools,
tests and how to make a pull request.

## Why, What, How?

### Why?

Run your own secondary server on a light bulb to cloud server, on arm32,arm64 or amd64 CPU architectures.

### What?

You will need a machine with a Linux OS, installed along the way will be docker, docker-compose
### How?

An atsign linux account will be created and docker will be used to gather SSL certificates using LetsEncrypt. The secondary will be configured and started up as a docker swarm service.
That service will auto update when new software is pushed. Certificates will be renewed automatically, and crashes or other issues will be handled gracefully.
The software your secondary uses will be the exact same image as The @ Company is using in production.


## Maintainers

Created by [cconstab](https://github.com/cconstab).
See something wrong let me know by raising and issue or please contribute and raise a pull request! 

#!/bin/bash

version=5.32.1
edition=team
tagName=uschti/mattermost-prod-app
push=$1

docker image build --build-arg VERSION=${version} --build-arg edition=${edition} -t ${tagName} -t ${tagName}:${version} .

if [[ -z "$push" || $push == true ]]
then
	echo "Pushing to Docker HUB"
    docker push ${tagName} && \
    docker push ${tagName}:${version}
fi

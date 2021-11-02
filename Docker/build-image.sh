export DEFAULT_J2J_IMAGE_NAME=j2j_service
export DEFAULT_J2J_IMAGE_VERSION=latest

echo 'Build j2j'
pushd ${J2J_HOME}

if [ -z "${J2J_IMAGE_NAME}" ]; then
    export J2J_IMAGE_NAME=${DEFAULT_J2J_IMAGE_NAME}
fi

if [ -z "${J2J_IMAGE_VERSION}" ]; then
    export J2J_IMAGE_VERSION=${DEFAULT_J2J_IMAGE_VERSION}
fi

DOCKER_BUILDKIT=1 docker build -f ./Dockerfile -t ${J2J_IMAGE_NAME}:${J2J_IMAGE_VERSION} .

popd

#example in scripts folder

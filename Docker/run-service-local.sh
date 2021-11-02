pushd ${J2J_HOME}

main() {
  stop_and_remove_if_exists $1
  remove_image_if_exists $1
  ./scripts/build-image.sh
  docker-compose up -d $1
}

stop_and_remove_if_exists () {
  docker-compose rm -f -s -v $1
}

remove_image_if_exists() {
  local image=$(docker images | grep $1)
  if [[ ! -z "$image" ]]; then
    docker rmi -f $1
  fi
}
main j2j_service


#example in scripts folder

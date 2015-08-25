container_volume_mount_path="/var/lib/registry"
host_volume_mount_path="$(pwd)$container_volume_mount_path"
container_name="com.zgardner.msa.docker.registry"
registry_version="2.1.1"
host_registry_port="5000"
container_registry_port="5000"

echo "Killing existing container $container_name..."
docker kill $container_name

echo "Removing existing container $container_name..."
docker rm $container_name

echo "Starting new container $container_name..."
docker run -d --name $container_name -v "$host_volume_mount_path:$container_volume_mount_path" -p $host_registry_port:$container_registry_port registry:$registry_version

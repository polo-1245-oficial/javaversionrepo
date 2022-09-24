#FROM https://stackoverflow.com/a/36538247/14882381


sleep 20 & PID=$! 

echo "Instalando Java $VER"
printf "["
while kill -0 $PID 2> /dev/null; do 
    printf  "▓"
    sleep 1
done
printf "] Listo!"

apt install -y wget apt-transport-https &
mkdir -p /etc/apt/keyrings &
wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc &
echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list &
apt update -y &
apt install temurin-8-jdk -y &
command &

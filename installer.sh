sudo source /temp/bar.sh

generate_some_output_and_sleep() {
    apt install -y wget apt-transport-https
    mkdir -p /etc/apt/keyrings
    wget -O - https://packages.adoptium.net/artifactory/api/gpg/key/public | tee /etc/apt/keyrings/adoptium.asc 
    echo "deb [signed-by=/etc/apt/keyrings/adoptium.asc] https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list 
    apt update -y 
    apt install temurin-8-jdk -y 
}


main() {
    # Make sure that the progress bar is cleaned up when user presses ctrl+c
    enable_trapping
    # Create progress bar
    setup_scroll_area
    for i in {1..99}
    do
            generate_some_output_and_sleep
            draw_progress_bar $i
        fi
    done
    destroy_scroll_area
}

main

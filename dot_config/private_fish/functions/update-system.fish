function update-system
    echo "Updating Ubuntu..."
    sudo apt update && sudo apt upgrade -y
    sudo apt autoremove -y
end

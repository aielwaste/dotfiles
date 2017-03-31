sudo pacman-key -r E49CC0415DC2D5CA
sudo pacman-key --lsign-key E49CC0415DC2D5CA 
sudo pacman -Syu --noconfirm
sudo pacman -S pipelight --noconfirm
sudo pipelight-plugin --update
sudo pipelight-plugin --enable silverlight

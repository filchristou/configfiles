#show files in recursive 'path/to/somewhere' Path with RegEX "pattern". Examine only *.{c,h} files.
grep --include=\*.{c,h} -rnw '/path/to/somewhere/' -e "pattern"

#use for extracting files from a tar.gz struct.
tar xvzf example.tar.gz -C ./where/to/extract/

#open "file" with default app
xdg-open file

#run a command in the background. terminal can close.
nohup okular SimulationExample.pdf &

#print names with pattern "de*" of files in current directory
find ./ -name "de*" -printf "%f\n"

#symbolic link from ~/configfiles/.vimrc to ~/.vimrc
ln -s ~/configfiles/.vimrc ~/.vimrc

#git pretty log
git log --graph --oneline --decorate --all

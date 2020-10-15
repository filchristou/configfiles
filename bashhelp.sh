#show files in recursive 'path/to/somewhere' Path that contain the RegEX "pattern". Examine only *.{c,h} files.
grep --include=\*.{c,h} -rnw '/path/to/somewhere/' -e ".*pattern.*" -n

#use for extracting files from a tar.gz struct.
#x for extract, v for verbose, z for gz files (also tar.gz), f for which file
tar xvzf example.tar.gz -C ./where/to/extract/

#open "file" with default app
xdg-open file

#run a command in the background. terminal can close.
nohup okular SimulationExample.pdf &

#print names with pattern "de*" of files in current directory
find ./ -name "de*" -printf "%f\n"

#symbolic link from ~/configfiles/.vimrc to ~/.vimrc
ln -s ~/configfiles/.vimrc ~/.vimrc

#show folder size. (emit -s to see recursively)
du -hs 'patho/to/folder-file'

#search with regex path
find ./ -regextype posix-egrep -regex "./bash/.*/Subfolder1/.*"
#search all directories except for "./.git/"
find ./ -path ./.git -prune -o -print
#search excluding dot files
find . -not -path '*/\.*'
#find all NON java files
find . -type f -not -name "*.java"

#find md5sum for a whole diretory
find demands_separate/ -type f -print0 | sort -z | xargs -0 md5sum | md5sum

#processes
#show how much time a process with 'PID' run
ps -o etime= -p 'PID'

#count all .pdf files in a directory
ls *.pdf -1 | wc -l

#delete/move all except pdf files
mv !(*.pdf) ./pdffolder/
rm !(*.pdf)

#watch the output of the demand every 0.5 sec and highlight differences
watch -n 0.5 -d cat .temp.helloworld.puml

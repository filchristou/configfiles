#send html file as someone else
mutt -e "my_hdr From:Obama <obama@whitehouse.org>" -e "set content_type=text/html"  filchristou@outlook.com -s "checka3" < testhtml.html 

#send normal email oneliner
echo "Read it good. Read it hard" | mutt -s "sera mundo" -a "projektantrag_ainet.pdf" -- ikr_guinan@ugemkow.de

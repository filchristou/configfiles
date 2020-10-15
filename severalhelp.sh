# generate javadoc for all ikr.multiLayerReconfig package AND subpackages
# code (.java files) are found under path "./src/"
# for the javadoc documentation don't use default javadoc, but the doclet 
# class nl.talsmasoftware.umldoclet.UMLDoclet, 
# found in path /u/home/wima/fchrstou/Downloads/Apps/umldoclet/umldoclet-1.1.4/umldoclet-1.1.4.jar
javadoc -doclet nl.talsmasoftware.umldoclet.UMLDoclet -docletpath /u/home/wima/fchrstou/Downloads/Apps/umldoclet/umldoclet-1.1.4/umldoclet-1.1.4.jar -d doc/ -subpackages ikr.multiLayerReconfig -sourcepath src/

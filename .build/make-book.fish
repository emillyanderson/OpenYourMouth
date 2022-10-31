#!/usr/bin/fish

# Remove any existing rendered files 
rm -f combined.rendered.md
rm -f OpenYourMouth-book.pdf

# todo: output front matter and some pandoc macros to generate a table of contents

# Depth-first search of each md file, catted together and adding a pagebrak macro
for mdfile in ( fdfind .md | grep -v README.md )
    cat $mdfile >> combined.rendered.md
    echo "" >> combined.rendered.md
    echo "\\pagebreak" >> combined.rendered.md
    echo "" >> combined.rendered.md
end

# make into a pdf
pandoc --from markdown+raw_tex -o OpenYourMouth-book.pdf combined.rendered.md 

for i in *.eps
do
  convert -density 300 $i $i.png
done


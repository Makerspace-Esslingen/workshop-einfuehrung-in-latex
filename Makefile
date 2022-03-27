targetimages = $(patsubst demonstration-files/%.tex,images/%.png,$(wildcard demonstration-files/*.tex))

all: images make-images

clean:
	rm -f *.aux *.log *.dvi *.png
	rm -rf images

%.dvi: demonstration-files/%.tex
	latex $<
	latex $<

images:
	mkdir images

images/%.png: %.dvi
	dvipng -T 14cm,5cm -O -1cm,-1cm $< -o $@

images/130_table.png: demonstration-files/130_table.tex
	latex $<
	latex $<
	dvipng -T 14cm,5cm -O -1cm,-10cm 130_table.dvi -o $@
	rm 130_table.dvi

images/140_graphicx.png:
	# skipping $@

images/Beispielabschnitt.png:
	# skipping $@

make-images: $(targetimages)

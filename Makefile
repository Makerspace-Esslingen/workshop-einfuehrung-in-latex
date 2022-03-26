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

images/110_table.png: demonstration-files/110_table.tex
	latex $<
	latex $<
	dvipng -T 14cm,5cm -O -1cm,-10cm 110_table.dvi -o $@
	rm 110_table.dvi

images/120_graphicx.png:
	# skipping $@

images/Beispielabschnitt.png:
	# skipping $@

make-images: $(targetimages)

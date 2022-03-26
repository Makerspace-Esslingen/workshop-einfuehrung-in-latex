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

images/110_table.png: 110_table.dvi
	dvipng -T 14cm,5cm -O -1cm,-10cm $< -o $@

images/120_graphicx.png:
	# skipping $@

images/Beispielabschnitt.png:
	# skipping $@

make-images: $(targetimages)

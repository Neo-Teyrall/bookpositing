

#import "@local/mantys:1.0.3": *
#import "@preview/tidy:0.4.3"
#import "/src/bookpositing.typ" as bkpst
#bkpst.page-image.left-3-4([])

#import "@preview/meander:0.4.4"


#show: mantys(
  ..toml("/typst.toml"),
  name: "Bookpositing",
  title: [Bookpositing Documentation],
  subtitle: [A tool to make the putting in page advanced for books. ],
  info: [This package allows you to put in page, of books with double columns and to add images that stretch on the two pages of the book, very useful to put in page, of the books like games drouble or other documents that put the part bell to the illustration. ],
  authors: "Neo Teyrall",
  url: "https://github.com/Neo-Teyrall/bookpositing",
  version: "0.0.1",
  date: datetime.today(),
  abstract: [
    In this package you will find tools to put in page your document with a certain number of images that stretch on the two pages, of the put in page corresponding to these images, of the notes of margin, but also of the images of text that adapt automatically to the put in page.
  ],
)

#let page-example(file, width: 90%,even-page:2) = {
  box(width: 100%, align(center + horizon, box(width: width, stack(
    dir: ltr,
    box(stroke: 1pt + gray, image(file + ".pdf", page: even-page, width: 50%)),
    box(stroke: 1pt + gray, image(file + ".pdf", page: even-page + 1, width: 50%)),
  ))))
}

#let code-example(file) = {
  box(stroke: 1pt + gray, fill: silver.transparentize(70%), radius: 3%, inset: 3%, raw(
    read(file + ".typ"),
    lang: "typ",
    block: true,
  ))
}

#let example(file, page-width: 90%) = [
  #code-example(file)
  #page-example(file, width: page-width)
] 

= bookpositing

Bookpositing is a tool of page in page of books conceived to be able to put in page the books with images that stretch on several pages. It is based on the tool Meander. 

== premier pas

#example("example/example1")

== Liste des image

A large number of images of double page and their layout associated are
configured in the library. They allow to cover a large set of situation.

#code-example("example/example2")
#let double-pages = ()
#for i in (2,4,6,8,10,12,14){
    double-pages.push(page-example("example/example2", even-page: i,width: 90%))
}

#grid(columns: 2,..double-pages)

=== Liberté de remplissage

The tool reserves a space in which you can place what you want, which can be
text, just like an image. Feel free to use it at your convenience.

== image de text

#let docs = tidy.parse-module(
  read("src/bookpositing.typ")
)

#tidy.show-module(
  docs,
  style: tidy.styles.default,
)

The tool also allows to place images within the text, they respect the yahoots
of the main images, so as to guard a coherence. There are two types of images of
text, the small images that correspond to the width of a column, and the images
wide that fill two columns.

== comment

The tool allows to place the notes of margin. These latter can be placed in a
manner corresponding to a disposition imposed by an image or well will modify
the placement of the columns to make correspond to the disposition.

== marge secondaire

The margin secondary is a second margin that can be defined and used to make
sure that the images fit at a background image.

== layout secondaire

The layouts secondary are layouts which respect the constraints of the main
layout while modifying its disposition. It allows to add to the text the regions
in which the text stretches on two columns, very practical, to make an entity to
a part or well cut a page in two parte.

== layout header

== layout cut

=== paramertrer la marge secondaire


== bleed

=== parametré le bleed

=== 


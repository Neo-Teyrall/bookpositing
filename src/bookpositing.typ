
// Librairie principale
#import "@preview/meander:0.4.4"

// Librairies du projet
#import "text-image.typ"
#import "main-layout.typ": *
#import "secondary-layout.typ"
#import "page-image.typ"
#import "utils.typ" : *
#import "data.typ" : *
#import "bookpositing-utils.typ" : *

////////////////////////////////////////////////////////////////////////////////
///// Layout
////////////////////////////////////////////////////////////////////////////////

/// a default image use to test the layout and images
#let default-image = box(
    stroke:2pt + teal,
    width:100%,
    height:100%,

    std.image(
        width: 100%-2pt,
        height: 100%-2pt,
        "/img.png",
        fit: "stretch"
    )
)


// Formatage d’un commentaire 
#let marge-note(txt) = box(width: 25%)[
    #align(horizon)[
        #math.underbrace()[
            #math.overbrace()[
                #box[
                    #par(justify: true)[
                        #txt
                    ]
                ]
            ]
        ]
    ]
]

/// balise de commentaire. Un commentaire qui se place dans la marge et organise
/// la composition en fonction de ce dernier.
#let comment(
    /// the page where display the marge comment, relative to the composing
    /// region.
    page: 0,
    /// the page is a even or odd page
    even: true,
    /// the placement of marge comment 
    placement: top + right,
    /// The content to display
    content) = {
  if not even {
    if placement.x == right or placement.x == none {
      let com() = meander.placed(
        placement,
        dx: 8%,
        boundary: meander.contour.margin(1mm),
        marge-note(content),
      )
      (
        (
          type: "one-page-image",
          page: page,
          content: com,
          layout: (
            name: "2/3",
            layout: layout-enmarge-left,
          ),
        ),
      )
    } else if placement.x == left {
      let com() = meander.placed(
        placement,
        dx: -4%,
        boundary: meander.contour.margin(1mm),
        marge-note(content),
      )
      (
        (
          type: "one-page-image",
          page: page,
          content: com,
          layout: (
            name: "2/3-right",
            layout: layout-2-3,
          ),
        ),
      )
    }
  } else {
    if placement.x == right or placement.x == none {
      let com() = meander.placed(
        placement,
        dx: 4%,
        boundary: meander.contour.margin(1mm),
        marge-note(content),
      )
      (
        (
          type: "one-page-image",
          page: page,
          content: com,
          layout: (
            name: "2/3-right",
            layout: layout-2-3-right,
          ),
        ),
      )
    } else if placement.x == left {
      let com() = meander.placed(
        placement,
        dx: -8%,
        boundary: meander.contour.margin(1mm),
        marge-note(content),
      )
      (
        (
          type: "one-page-image",
          page: page,
          content: com,
          layout: (
            name: "2-3-right",
            layout: layout-enmarge-right,
          ),
        ),
      )
    }
  }
}

/// This function contain the document content and fill it in the columne
#let content(
    /// The content
    content,
    /// break the content column if true
    container-break:true) = {
    if container-break{
    ((type: "content", content: content, container-break: meander.colfill),)
    }else{
        let no-func() = {}
        ((type: "content", content: content, container-break: no-func),)
    }

}

////////////////////////////////////////////////////////////////////////////////
///// composing
////////////////////////////////////////////////////////////////////////////////

/// Cette fonction permet de recueillir les différentes balises de composition
/// qui lui sont données en argument pour les organiser et composer les éléments
/// entre eux.
/// n-pages : Le nombre de pages à composer.
/// force-break: Forcer la composition à commencer sur une page paire ou un paire.
/// seq: La séquence de balise.
/// debug : activer le débugage de meander. 
#let composing(
    /// The number of page to compose.
    n-pages,
    /// force to breake page to start the composing at even or odd page
    force-break: "even",
    /// sequence of commande to compose the document
    seq,
    /// activate the debug display of the meander documentation
    debug:false) = context {
    // Gérer le saut de page.
    if force-break == true {
        pagebreak()
    } else if force-break == "even" {
        pagebreak(to:"even")
    } else if force-break == "odd"{
            pagebreak(to:"odd")
    } else {
        
    }

    // Pour savoir si une page est père ou impair, on récupère son numéro de
    // page ainsi, au fur et à mesure de la composition, on peut savoir si à
    // chaque page composée, si on passe à une page pair ou non.
    let start-page = here().page()
    let start-even = calc.even(start-page)

    // Récupérer les différentes balises en fonction de leur type. 
    let (contents, page-images, text-images, major-layouts, minor-layouts) = split_element(n-pages, seq)
    
    // Commencez la composition meander. 
    meander.reflow({
        // Activer le débugage 
        if debug {
            meander.opt.debug.post-thread()
        }

        for i in range(n-pages) {
            // Pour chaque page, appliquez les images et les organisations de paragraphe. 
            let page-is-even= calc.even(start-page + i)
            apply-page-image(i, page-images)
            apply-text-image(i, text-images, major-layouts,page-is-even)
            apply-layout-minor(i, minor-layouts, major-layouts)
            apply-layout-major(i,page-is-even, major-layouts)

            // Puis, demander à Meander de passer la page suivante. 
            if i != (n-pages - 1) {
                meander.pagebreak()
            }
        }
        // Ajoutez le contenu aux zones de texte alloué. 
        for i in range(0,contents.len()-1) {
            meander.content(contents.at(i).content)
            (contents.at(i).container-break)()
        }
        meander.content(contents.last().content)
        (contents.last().container-break)()
    })
}


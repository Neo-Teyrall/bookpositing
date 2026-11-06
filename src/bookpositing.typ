
// Librairie principale 
#import "@preview/meander:0.4.4"

// Librairies du projet 
#import "text-image.typ"
#import "layout.typ": *
#import "page-image.typ"
#import "utils.typ" : *
#import "data.typ" : *

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

/// un layout mineur qui consite a placer ne haut d’une page une un texte qui
/// prendre toute la largeur d’une page au lieu de remplir les colone.

///  La page sur laquelle placer le layout secondaire et le texte
/// full-page forcer le layout a prendre toute la largeur de la page 
/// colfill: demader a meander de passer a la prochaine zone de contenue.
#let layout-header(page: 0,full-page: false,colfill:false, content) = {
  let layout(major: none) = {
    if major == "1/3-right" {
        let size = measure(box(width: get_page_layout().width * 90%, content))

      meander.container(
          dx:-6%,
          width: 90%,
          height: size.height + 1em,
          margin: 6mm,
      )
    } else if major == "1/3" {

    }else if major == "2/3-right" {
        let w = 78%
        let size = measure(box(width: get_page_layout().width*w, content))
      meander.container(
          dx:-4%,
        width: w,
          height: if full-page{100%} else {size.height},
        margin: 6mm,
      )
    } else{
        let size = measure(box(width: get_page_layout().width, content))
      meander.container(
        width: 100%,
        height: if full-page{100%} else {size.height},
        margin: 6mm,
      )
    }
  }
  (
    (
      type: "layout",
      ltype: "header",
      page: page,
      layout: layout,
      content: content,
      container-break: {
        let null-func() = {}
        if colfill {
          meander.colfill
        } else {
          null-func
        }
      },
    ),
  )
}


/// place un contenue au millieu de la page de manière coupé la mise en page en
/// deux colone de manière a ce que le contenue commence par remplir les deux
/// colone supérieur avant de continuer sur les deux colone infèrieure
#let layout-sep(page: 0,full-page: false,colfill:false,height:0%, content) = {
  let layout(major: none) = {
      // en fonction du layout principale adapter la découpe
    if major == "1/3-right" {
      let size = measure(box(width: page-layout.width * 90%, content))

      meander.container(
          dx:-6%,
          width: 90%,
          height: size.height + 1em,
          margin: 6mm,
      )
    } else if major == "1/3" {

    }else if major == "2/3-right" {
        let w = 78%
        let size = measure(box(width: page-layout.width*w, content))
      meander.container(
          dx:-4%,
        width: w,
          height: if full-page{100%} else {size.height},
        margin: 6mm,
      )
    } else{
      let size = measure(box(width: page-layout.width, content))

        meander.container(
            width: 50% - 3mm,
            margin: 6mm,
            height: height,
        )
        meander.container(
            dx: 52%,
            width: 50% - 3mm,
            margin: 6mm,
            height: height - 1.1mm,
        )

        meander.container(
            dy: height+6mm,
            width: 100%,
            height: if full-page{100%} else {size.height},
          margin: 6mm,
      )
        meander.container(
            dy:height + size.height,
            height: 100% - (height+size.height),
            width: 50% - 3mm,
            margin: 6mm,
        )
        meander.container(
            dy:height + size.height,
            dx: 52%,
            height: 100% - (height+size.height),
            width: 50% - 3mm,
            margin: 6mm,
        )
    }
  }
  
  (
    (
      type: "layout",
      ltype: "header",
      page: page,
      layout: layout,
      content: content,
      container-break: {
        let null-func() = {}
        if colfill {
          meander.colfill
        } else {
          null-func
        }
      },
    ),
  )
}



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

// balise de commentaire. Un commentaire qui se place dans la marge et organise
// la composition en fonction de ce dernier.
#let comment(page: 0, even: true, placement: top + right, content) = {
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

////////////////////////////////////////////////////////////////////////////////
///// Image
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
///// Utils
////////////////////////////////////////////////////////////////////////////////


// force le contenue a continuer sur la prochaine colone de contenue.
#let layout-break() = {
    ((type: "content", content: [~], container-break: meander.colfill),)
}

// ajoute une balise de contenue.
#let content(content, container-break:true) = {
    if container-break{
    ((type: "content", content: content, container-break: meander.colfill),)
    }else{
        let no-func() = {}
        ((type: "content", content: content, container-break: no-func),)
    }

}

/// ajouter l’agencement de page secondaire.
/// méthode privé
#let apply-layout-minor(current-page, minors, majors) = {
  let minor = minors.at(current-page)
  let major = majors.at(current-page)
  if minor == () {
    return
  }
  for l in minor {
      if major == (){
      (l.layout)()
      } else if major.first() == none {
          (l.layout)()
      } else {
          (l.layout)(major: major.first().name)
      }
  }
}


/// ajouter les agencement de texte principale.
/// méthode privé
#let apply-layout-major(current-page,is-even, majors) = {
  let major = majors.at(current-page)
  if major == () {
      base-layout()
      return
  }
  
  if major.first() != none {
      (major.first().layout)(is-even)
  } else {
    base-layout()
  }
}

/// ajouter les image de page des image qui dépasse de la zone de texte pour
/// s’étendre plus sur une autre page.
/// méthode privé
#let apply-page-image(current-page, images) = {
  let page-images = images.at(current-page)
    

  if page-images == () {
    return
  }

  for image in page-images {
      image()
  }
}

/// ajouter les image de texte, de petite image qui coresspond au la largeur de
/// la zone de texte. méthode privé
#let apply-text-image(current-page, text-images,major-layouts, is-even) = {
    let current-page-text-images = text-images.at(current-page)
    let major-layout = major-layouts.at(current-page)

    if major-layout.len() == 0{
        major-layout.push(none)
    }

    if current-page-text-images == () {
        return
    }
 
    for image in current-page-text-images {
        image(major-layout.first(),is-even)
    }
}

/// Cette fonction sépare tous les éléments contenus en fonction de leur types.
/// méthode privé
#let split_element(n-page, seq) = {
    let contents = ()
    let page-images = range(n-page).map(_ => ())
    let text-images = range(n-page).map(_ => ())
    let minor-layouts = range(n-page).map(_ => ())
    let major-layouts = range(n-page).map(_ => ())
    
    for i in seq {
        if i.type == "content" {
            contents.push(i)
        } else if i.type == "layout" {
            minor-layouts.at(i.page).push(i)
            contents.push(i)
        } else if i.type == "one-page-image" {
            page-images.at(i.page).push(i.content)
            major-layouts.at(i.page).push(i.layout)
        } else if i.type == "two-page-image" {
            page-images.at(i.page1).push(i.even-image)
            page-images.at(i.page2).push(i.odd-image)
            major-layouts.at(i.page1).push(i.layout)
            major-layouts.at(i.page2).push(i.layout)
        }
        else if i.type == "text-image" {
            text-images.at(i.page).push(i.content)
        }
    }
    return (contents, page-images, text-images, major-layouts, minor-layouts)
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


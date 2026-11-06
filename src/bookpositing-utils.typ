
#import "main-layout.typ":*

// force le contenue a continuer sur la prochaine colone de contenue.
#let layout-break() = {
    ((type: "content", content: [~], container-break: meander.colfill),)
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


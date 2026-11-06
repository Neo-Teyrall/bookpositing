
#import "utils.typ":*
#import "@preview/meander:0.4.4"

/// un layout mineur qui consite a placer ne haut d’une page une un texte qui
/// prendre toute la largeur d’une page au lieu de remplir les colone.

///  La page sur laquelle placer le layout secondaire et le texte
/// full-page forcer le layout a prendre toute la largeur de la page 
/// colfill: demader a meander de passer a la prochaine zone de contenue.
#let layout-header(page: 0, full-page: false, colfill: false, content) = {
  let layout(major: none) = {
    if major == "1/3-right" {
      let size = measure(box(width: get_page_layout().width * 90%, content))
        
      meander.container(
        dx: -6%,
        width: 90%,
        height: size.height + 1em,
        margin: 6mm,
      )
    } else if major == "1/3" {

    } else if major == "2/3-right" {
      let w = 78%
      let size = measure(box(width: get_page_layout().width * w, content))
      meander.container(
        dx: -4%,
        width: w,
        height: if full-page { 100% } else { size.height },
        margin: 6mm,
      )
    } else {
      let size = measure(box(width: get_page_layout().width, content))
      meander.container(
        width: 100%,
        height: if full-page { 100% } else { size.height },
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
#let layout-sep(page: 0, full-page: false, colfill: false, height: 0%, content) = {
  let layout(major: none) = {
    // en fonction du layout principale adapter la découpe
    if major == "1/3-right" {
      let size = measure(box(width: page-layout.width * 90%, content))
      
      meander.container(
        dx: -6%,
        width: 90%,
        height: size.height + 1em,
        margin: 6mm,
      )
    } else if major == "1/3" {} else if major == "2/3-right" {
      let w = 78%
      let size = measure(box(width: page-layout.width * w, content))
      meander.container(
        dx: -4%,
        width: w,
        height: if full-page { 100% } else { size.height },
        margin: 6mm,
      )
    } else {
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
        dy: height + 6mm,
        width: 100%,
        height: if full-page { 100% } else { size.height },
        margin: 6mm,
      )
      meander.container(
        dy: height + size.height,
        height: 100% - (height + size.height),
        width: 50% - 3mm,
        margin: 6mm,
      )
      meander.container(
        dy: height + size.height,
        dx: 52%,
        height: 100% - (height + size.height),
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


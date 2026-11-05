
#import "/src/utils.typ": get_h, get_h2
#import "/src/data.typ"
#import "@preview/meander:0.4.4"

// Créer un image qui s’étend sur deux page.
// page: la première page sur laquelle placer la premiere image.
// height: la hauteur de l’image 
// over-marge: est ce que l’image recouvre les marge pour emlpire toute la page 
// placement : placement de l’image
#let full-2-2(
  page: 0,
  height: 50%,
  marge: "main",
    full-page:false,
  placement: bottom,
  content,
) = {
    
  // margin and shift
  let marges_and_shift() = if marge == "none" {
    if placement == top {
      (
          std.page.margin.top + std.page.bleed,
        -(data.projets.data.page.margin.top + std.page.bleed),
        data.main-marge.get().odd.right + std.page.bleed,
        std.page.bleed,
        0pt,
      )
    } else if placement == bottom {
      (
        data.projets.data.page.margin.top + std.page.bleed,
        0pt,
        data.main-marge.get().odd.right + std.page.bleed,
        std.page.bleed,
        0pt,
      )
    }
  } else if marge == "main" {
    if placement == top {
      //(0pt, 0pt, data.main-marge.get().odd.right*2, data.get-main-side-marge().sum())
      (
        0pt,
        0pt,
        0pt,
        0pt,
        data.get-main-side-marge().sum(),
      )
    } else if placement == bottom {
      (
        0pt,
        0pt,
        0pt, //data.main-marge.get().odd.right,
        0pt,
        data.get-main-side-marge().sum(),
      )
    }
  } else if marge == "second" {
    if placement == top {
      (
        data.main-marge.get().even.top - data.second-marge.get().even.top,
        -(data.main-marge.get().even.top - data.second-marge.get().even.top),
        data.second-marge.get().odd.right,
        0pt,
        data.get-second-side-marge().sum(),
      )
    } else if placement == bottom {
      (
        data.main-marge.get().even.top - data.second-marge.get().even.top,
        0pt,
        data.second-marge.get().odd.right,
        0pt,
        data.get-second-side-marge().sum(),
      )
    }
  }
  
  // l’image de la gauche
  let even-image() = {
    let (y_margin, y_shift, x_margin, bleed, sum-side-marge) = marges_and_shift()
    let w = (data.projets.data.page.width + bleed) * 2 - sum-side-marge
    // compute height
    let (h1,h2) = get_h2(height, marge:marge,full-page: full-page)
    meander.placed(
      left + placement,
    )[
      #align(left)[
        #box(height: h1, width: w)[
          #place(dx: -x_margin, dy: y_shift)[
            #box(
              clip: true,
              width: w,
              height: h2,
              align(center + horizon, content),
            )
          ]
        ]
      ]
    ]
  }
  
  // l’image de la droite
  let odd-image() = {
    let (y_margin, y_shift, x_margin, bleed, sum-side-marge) = marges_and_shift()
    let w = (data.projets.data.page.width + bleed) * 2 - sum-side-marge
    let (h1,h2) = get_h2(height, marge:marge,full-page: full-page)
    meander.placed(
      right + placement,
    )[
      #align(right, box(height: h1, width: data.projets.data.page.width, stroke: 4pt + yellow)[
        #place(dx: x_margin, dy: y_shift, right)[
          #align(right)[
            #box(
              clip: true,
              width: w,
              height: h2,
              stroke: 2pt + orange,
              align(horizon, content),
            )
          ]
        ]
      ])
    ]
  }
  (
    (
      type: "two-page-image",
      page1: page,
      page2: page + 1,
      odd-image: odd-image,
      even-image: even-image,
      layout: none,
    ),
  )
}



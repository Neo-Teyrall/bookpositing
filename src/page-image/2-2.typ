
#import "/src/utils.typ"
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
  // l’image de la gauche
  let even-image() = {
      let (y_margin, y_shift) = utils.get_y_shift_marge(marge: marge, placement: placement)
      let (x_margin, bleed, sum-side-marge) = utils.get_x_marges_and_shift(marge:marge)
      let w = (std.page.width + std.page.bleed) * 2 - x_margin*2
    // compute height
      let (h1,h2) = utils.get_h2(height, marge:marge,full-page: full-page)
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
       let (y_margin, y_shift) = utils.get_y_shift_marge(marge: marge, placement: placement)
      let (x_margin, bleed, sum-side-marge) = utils.get_x_marges_and_shift(marge:marge)
      
      let w = (std.page.width + bleed) * 2 - sum-side-marge
      let (h1,h2) = utils.get_h2(height, marge:marge,full-page: full-page)
    meander.placed(
      right + placement,
    )[
      #align(right,
          box(height: h1,
              width: std.page.width, stroke: 4pt + yellow)[
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



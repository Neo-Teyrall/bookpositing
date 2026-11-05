#import "/src/utils.typ" 
#import "/src/data.typ"
#import "/src/layout.typ":*

// Créer un image qui s’étend sur les 2/3 des deux pages et qui occupe plus la
// page de droite.

#let right-2-3(
  page: 0,
  placement: top,
  height: 50%,
  marge: "main",
  full-page: false,
  content,
) = {
  if full-page {
    height = 100%
    placement = top
  }
    
      let marges_and_shift() = if marge == "none" {
    if placement == top {
      (
        data.projets.data.page.margin.top + std.page.bleed,
        - (data.projets.data.page.margin.top + std.page.bleed),
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

  let get_w(bleed, marge) = {
        let even-page = (utils.get_text_width()
        + std.page.margin.right
          + marge)

        let odd-page = ((utils.get_text_width() * 0.24)
        + std.page.margin.left)

        odd-page + even-page
    }

  
  let odd-image() = {
    let (y_margin, y_shift, x_margin, bleed, sum-side-marge) = marges_and_shift()
    let (h1, h2) = utils.get_h2(
      height,
      marge: marge,
      full-page: full-page,
      placement: placement,
    )
    let w = get_w(bleed, x_margin)
    
    meander.placed(
      right + placement,
      boundary: meander.contour.margin(3mm),
    )[
        #align(right,
      box(
        height: h1,
          width: w)[
          #place(top + left, dy: y_shift, dx: x_margin)[
            #box(
              width: w,
              height: h2,
              align(center + horizon, content),
            )
          ]
        ])
      ]
  }
  let even-image() = {
          let (y_margin, y_shift, x_margin, bleed, sum-side-marge) = marges_and_shift()
      let (h1, h2) = utils.get_h2(height, marge: marge, full-page: full-page, placement: placement)
      let w = get_w(bleed, x_margin)

    meander.placed(
      right + placement,
      dx: 76%,
      boundary: meander.contour.margin(3mm),
    )[
      #box(height: h1, width: w, place(
        top + right,
        dy: y_shift,
        box(align(left)[
          #box(
            width: w,
            height: h2,
            align(center + horizon, content),
          )
        ]),
      ))
    ]
  }
  (
    (
      type: "two-page-image",
      page1: page,
      page2: page + 1,
      odd-image: odd-image,
      even-image: even-image,
      layout: (
        name: "2/3-right",
        layout: layout-2-3-right,
      ),
    ),
  )
}

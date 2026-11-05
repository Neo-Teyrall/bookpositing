#import "/src/utils.typ" 
#import "/src/data.typ"
#import "/src/layout.typ":*


// Créer un image qui s’étend sur les 2/3 des deux pages.
#let left-2-3(page: 0, placement: top, height: 50%, marge: "main", full-page: false, content) = {

    let get_w(bleed, marge) = {
        let even-page = (utils.get_text_width()
        + std.page.margin.right
          + marge)

        let odd-page = ((utils.get_text_width() * 0.24)
        + std.page.margin.left)

        odd-page + even-page
    }

  let even-image() = {
       let (y_margin, y_shift) = utils.get_y_shift_marge(marge: marge, placement: placement)
      let (x_margin, bleed, sum-side-marge) = utils.get_x_marges_and_shift(marge:marge)
      let (h1, h2) = utils.get_h2(height, marge: marge, full-page: full-page, placement: placement)
      let w = get_w(bleed, x_margin)

      meander.placed(
      right + placement,
      boundary: meander.contour.margin(3mm),
    )[
      #v(y_shift)
        #box(height: h1 - y_shift, width: w,
            place(top + right, dx: -x_margin, box(align(left)[
        #box(
          width: w,
          height: h2,
          align(center + horizon, content),
        )
      ])))
    ]
  }

  let odd-image() = {
      let (y_margin, y_shift) = utils.get_y_shift_marge(marge: marge, placement: placement)
      let (x_margin, bleed, sum-side-marge) = utils.get_x_marges_and_shift(marge:marge)
    let (h1, h2) = utils.get_h2(
        height,
        marge: marge,
        full-page: full-page,
        placement: placement)
    let w = get_w(bleed, x_margin)
    
    meander.placed(
      left + placement,
      dx: -76%,
      boundary: meander.contour.margin(3mm),
    )[
      #v(y_shift)
      #align(right)[
        #box(height: h1, width: w)[
            
          #place(top + right, box(
            width: w,
            height: h2,
            align(center + horizon, content),
          ))
        ]
      ]
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
        name: "2/3",
        layout: layout-2-3,
      ),
    ),
  )
}


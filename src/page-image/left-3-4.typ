

#import "/src/utils.typ"
#import "/src/data.typ"
#import "@preview/meander:0.4.4"

// Créer un image centré qui s’étend sur les 3/4 des deux pages et qui occupe
// plus la page de gauche.
#let left-3-4(
  page: 0,
  height: 50%,
  marge: "main",
  full-page: false,
  placement: bottom,
  content,
) = {
  let odd-image() = {
    let (h1, h2) = utils.get_h(height, marge: marge, full-page: full-page)
    let (y_margin, y_shift) = utils.get_y_shift_marge(marge: marge, placement: placement)
    let (x_margin, bleed, sum-side-marge) = utils.get_x_marges_and_shift(marge: marge)
    let w = (
      utils.get_page_layout().width + utils.get_inside()*2
        + utils.get_page_layout().width / 2 + x_margin
    )
    
    meander.placed(
      right + placement,
      dx: -50%,
      boundary: meander.contour.margin(1mm),
    )[
      #align(right, box(
        height: h1,
        width: std.page.width,
        place(
          dy: y_shift,
          align(right)[
            #box(
              width: w,
              height: h2,
              align(center + horizon, content),
            )
          ],
        ),
      ))
    ]
  }
  
  let even-image() = {
    let (y_margin, y_shift) = utils.get_y_shift_marge(marge: marge, placement: placement)
    let (x_margin, bleed, sum-side-marge) = utils.get_x_marges_and_shift(marge: marge)
    
    let w = (
      utils.get_page_layout().width + utils.get_inside() * 2 + utils.get_page_layout().width / 2 + x_margin
    )
    let (h1, h2) = utils.get_h(height, marge: marge, full-page: full-page)
    
    meander.placed(
      right + placement,
      boundary: meander.contour.margin(3mm),
    )[
      #box(
        height: h1,
        width: std.page.width,
        place(
          dx: -x_margin,
          dy: y_shift,
          align(left)[
            #box(
              width: w,
              height: h2,
              align(center + horizon, content),
            )
          ],
        ),
      )
    ]
  }
  
  ((type: "two-page-image", page1: page, page2: page + 1, odd-image: odd-image, even-image: even-image, layout: none),)
}

#import "/src/utils.typ"
#import "/src/data.typ"
#import "/src/layout.typ": *

#let right-1-3(
  page: 0,
  marge: "main",
  content,
) = {
  let height = 100%
  let placement = top
  
  let get_w() = (
    std.page.width / 2 + std.page.margin.left + std.page.margin.right
  )
  
  let odd-image() = {
    let (y_margin, y_shift) = utils.get_y_shift_marge(marge: marge, placement: placement)
    let (h1, h2) = utils.get_h2(height, marge: marge, full-page: true, placement: placement)
    let w = get_w()
    
    meander.placed(
      right + placement,
      dx: -50%,
      boundary: meander.contour.margin(3mm),
    )[
      #v(y_shift)
      #align(left)[
        #box(width: w, height: h2, content)
      ]
    ]
  }
  
  let even-image() = {
    let (y_margin, y_shift) = utils.get_y_shift_marge(marge: marge, placement: placement)
    let (h1, h2) = utils.get_h2(height, marge: marge, full-page: true, placement: placement)
    let w = get_w()
    meander.placed(
      right + placement,
      dx: 50% + std.page.margin.left + std.page.margin.right,
      boundary: meander.contour.margin(3mm),
    )[
      #v(y_shift)
      #align(left)[
        #box(
          width: w,
          height: h2,
          content,
        )
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
        name: "1/3-right",
        layout: layout-1-3-right,
      ),
    ),
  )
}

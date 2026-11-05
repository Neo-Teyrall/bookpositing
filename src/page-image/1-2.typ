#import "@preview/meander:0.4.4"

#import "/src/layout.typ" : *
#import "/src/data.typ"
#import "/src/utils.typ"

// Créer un image qui s’étend sur une page entière.
#let full-1-2(
    page:0,
    height:50%,
    marge:"none",
    placement: bottom,
    even: true,
    full-page:false,
    content) = {

    if full-page{
        height = 100%
        over-marge = true
        placement = top
    }

    let picture() = if not even {
         let (y_margin, y_shift) = utils.get_y_shift_marge(marge: marge, placement: placement)
      let (x_margin, bleed, sum-side-marge) = utils.get_x_marges_and_shift(marge:marge)
        let w = (data.get_page_layout().width + data.get_inside() + std.page.bleed ) + x_margin
        
        let (h1,h2) = utils.get_h2(height, marge:marge,full-page: full-page)
      meander.placed(
        right + placement,
      )[
          #align(right)[
              #box(height: h1, width:w)[
                  #place(dx: x_margin,
                      dy: y_shift)[
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
    } else {
         let (y_margin, y_shift) = utils.get_y_shift_marge(marge: marge, placement: placement)
      let (x_margin, bleed, sum-side-marge) = utils.get_x_marges_and_shift(marge:marge)
        
        //let w = (std.page.width + bleed) - sum-side-marge
        let w = (data.get_page_layout().width + data.get_inside() + std.page.bleed ) + x_margin
        let (h1,h2) = utils.get_h2(height, marge:marge,full-page: full-page)
      meander.placed(
        left + placement,
      )[
          #align(left)[
              #box(height: h1, width:w)[
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
  
  
    ((type: "one-page-image",
      page: page,
      content: picture,
        layout: none,
  ),)
}

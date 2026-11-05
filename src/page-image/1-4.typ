
#import "/src/utils.typ"
#import "/src/data.typ"
#import "@preview/meander:0.4.4"

// Créer un image centré qui s’étend sur les 1/4 des deux pages soit 1/2 de la page.
#let i1-4(
    page: 0,
    height:100%,
    placement:top,
    even:true,
    marge: "main",
    full-page:false,
    content) = {
    if full-page{
        height = 100%
        placement = top
    }


        
    
  let picture() = {
      let (y_margin, y_shift) = utils.get_y_shift_marge(marge: marge, placement: placement)
      let (x_margin, bleed, sum-side-marge) = utils.get_x_marges_and_shift(marge:marge)
      let (h1, h2) = utils.get_h2(height, marge: marge, full-page: full-page, placement: placement)
      let w = (data.get_page_layout().width/2) + x_margin
      
      if even {
            meander.placed(
          left + placement,
            dx: -x_margin,
                boundary: meander.contour.margin(5mm),

        )[
          #box(
            height: h1,
            width: w,
            place(
              dx: 0pt,
              dy:   y_shift,
            align(left)[
                #box(
                    width: w,
                    height: h2,
                    clip: true,
                    align(center + horizon, content),
                )
            ],
            ),
          )
        ]
      }else{
            meander.placed(
          right + placement,
            dx: x_margin,
                boundary: meander.contour.margin(3mm)
        )[
          #box(
            height: h1 ,
            width: w,
            place(
              dx: 0pt,
              dy: y_shift,
            align(left)[
                #box(
                    width: w,
                    height: h2,
                    clip: true,
                    align(center + horizon, content),
                )
            ],
            ),
          )
        ]
      }
  }
    ((type: "one-page-image", page: page,content: picture, layout:none),)
}

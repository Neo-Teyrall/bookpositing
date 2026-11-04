#import "@preview/meander:0.4.4"

#import "/src/layout.typ" : *
#import "/src/data.typ"
#import "/src/utils.typ" : get_h

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
    // compute height
    let h = get_h(height,over-marge: true)
    // margin and shift

                let marges_and_shift() = if marge == "none" {
            if placement == top {
                (
                    data.projets.data.page.margin.top + std.page.bleed,
                    -(data.projets.data.page.margin.top + std.page.bleed),
                    -(data.main-marge.get().odd.right + std.page.bleed) ,
                    std.page.bleed*2,
                    0pt,
                )
            } else if placement == bottom {
                (
                    data.projets.data.page.margin.top + std.page.bleed,
                    0pt,
                    -(data.main-marge.get().odd.right + std.page.bleed),
                    std.page.bleed*2,
                    0pt)
            }
        } else if marge == "main" {
            if placement == top {
                //(0pt, 0pt, data.main-marge.get().odd.right*2, data.get-main-side-marge().sum())
                (
                    0pt,
                    0pt,
                    0pt,
                    std.page.bleed,
                    data.get-main-side-marge().sum()/2
                )
            } else if placement == bottom {
                (
                    0pt,
                    0pt,
                    0pt,//data.main-marge.get().odd.right,
                    std.page.bleed,
                    data.get-main-side-marge().sum()/2)
            }
        } else if marge == "second" {
            if placement == top {
                (
                     data.main-marge.get().even.top - data.second-marge.get().even.top,
                    -(data.main-marge.get().even.top - data.second-marge.get().even.top),
                    -data.second-marge.get().odd.right,
                    std.page.bleed,
                    data.get-second-side-marge().sum()/2
                )
            } else if placement == bottom {
                (
                    data.main-marge.get().even.top - data.second-marge.get().even.top,
                    0pt,
                    -data.second-marge.get().odd.right,
                    std.page.bleed,
                    data.get-second-side-marge().sum()/2)
            }
        }

    let picture() = if not even {
        let (y_margin, y_shift, x_margin, bleed, sum-side-marge) = marges_and_shift()
        let w = (std.page.width + bleed) - sum-side-marge
      meander.placed(
        right + placement,
      )[
          #align(right)[
              #box(height: h, width:w)[
                  #place(dx: -x_margin,
                      dy: y_shift)[
                          #box(
                              clip: true,
                              width: w,
                              height: h + y_margin,
                              align(center + horizon, content),
                          )
                      ]
              ]
          ]
      ]
    } else {
        let (y_margin, y_shift, x_margin, bleed, sum-side-marge) = marges_and_shift()
        let w = (std.page.width + bleed) - sum-side-marge
      meander.placed(
        left + placement,
      )[
          #align(left)[
              #box(height: h, width:w)[
          #place(dx: x_margin, dy: y_shift)[
         
              #box(
                clip: true,
                width: w,
                height: h + y_margin,
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

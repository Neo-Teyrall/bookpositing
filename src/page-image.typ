
#import "@preview/meander:0.4.4"

#import "layout.typ" : *


#let projets  =(
    data : (
        page: (
            width: 21cm,
            height: 29.7cm,
            margin: (top:2.5cm, bottom:2.5cm, right:2cm,left:2cm)
        ))
)

#set par(justify:true)

#set page(
    width: projets.data.page.width,
    height: projets.data.page.height,
    margin: projets.data.page.margin,
)

////////////////////////////////////////////////////////////////////////////////
///// marges
////////////////////////////////////////////////////////////////////////////////

// #let side-marge = 12pt
// #let emarge-full = (
//   top: projets.data.page.margin.top,
//   bottom: projets.data.page.margin.bottom,
//   left: projets.data.page.margin.left - side-marge,
//   right: projets.data.page.margin.right - side-marge,
// )

// #let page-layout = (
//   height: projets.data.page.height - projets.data.page.margin.top - projets.data.page.margin.bottom,
//   width: projets.data.page.width - projets.data.page.margin.right - projets.data.page.margin.left,
// )

// #let emarge-soft = (
//   top: projets.data.page.margin.top - 37pt,
//   bottom: projets.data.page.margin.bottom - 37pt,
//   left: projets.data.page.margin.left - side-marge,
//   right: projets.data.page.margin.right - side-marge,
// )


#let get_h(height, over-marge:false, full-page:false, placement:bottom) = {
  if type(height) == ratio {
    (
      height
        * if over-marge {
          if full-page {
            projets.data.page.height
          } else if placement == top {
            projets.data.page.height - emarge-full.bottom
          } else if placement == bottom {
            projets.data.page.height - emarge-full.top
          }
        } else {
          projets.data.page.height - emarge-soft.top - emarge-soft.bottom - 6pt
        }
    )
  } else {
    height
  }
}



////////////////////////////////////////////////////////////////////////////////
///// Full
////////////////////////////////////////////////////////////////////////////////

// Créer un image qui s’étend sur deux page.
// page: la première page sur laquelle placer la premiere image.
// height: la hauteur de l’image 
// over-marge: est ce que l’image recouvre les marge pour emlpire toute la page 
// placement : placement de l’image
#let full-2-2(page:0, height:50%, over-marge:false, placement: bottom, content) = {
    // compute height
    let h = get_h(height,over-marge: over-marge)
    // margin and shift
    let (y_margin, shift, x_margin) = if over-marge {
      if placement == bottom {
        (projets.data.page.margin.bottom, 0pt,side-marge)
      } else if placement == top {
        (projets.data.page.margin.top, -projets.data.page.margin.top, side-marge)
      }
    } else {
        if placement == bottom {
            (emarge-soft.bottom, 0pt, side-marge)
        } else if placement == top {
            (emarge-soft.top, -emarge-soft.top , side-marge)
        }
    }

      let w = (projets.data.page.width*2)  - (x_margin*2)
    // l’image de la droite
    let odd-image() = {
        
        meander.placed(
          right + placement,
        )[
          #box(height: h, width: projets.data.page.width)[
            #place(dx: -projets.data.page.margin.right - x_margin, dy: shift)[
              #align(right)[
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
    // l’image de la droite
    let even-image() = {
        meander.placed(
          left + placement,
        )[
          #box(height: h, width: projets.data.page.width)[
            #place(dx: -projets.data.page.margin.left + x_margin, dy: shift)[
              #align(left)[
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
    
   ((type:"two-page-image", page1:page, page2:page+1, odd-image:odd-image, even-image:even-image,layout: none,),)
}

//// full page  ////////////////////////////////////////////////////////////////

// Créer un image qui s’étend sur une page entière.
#let full-1-2(page:0, height:50%, over-marge:false, placement: bottom, even: true, full-page:false, content) = {

    if full-page{
        height = 100%
        over-marge = true
        placement = top
    }
    // compute height
    let h = get_h(height,over-marge: over-marge)
    // margin and shift
    let (y_margin, shift, x_margin) = if over-marge {
      if placement == bottom {
        (projets.data.page.margin.bottom, 0pt,side-marge)
      } else if placement == top {
        (projets.data.page.margin.top, -projets.data.page.margin.top, side-marge)
      }
    } else {
        if placement == bottom {
            (emarge-soft.bottom, 0pt, side-marge)
        } else if tpp.placement == top {
            (emarge-soft.top, -emarge-soft.top , side-marge)
        }
    }
    let w =  projets.data.page.width  - x_margin

    let picture() = if not even {
      meander.placed(
        right + placement,
      )[
        #box(height: h, width: projets.data.page.width)[
            #place(dx: -emarge-full.left - side-marge,
                dy: shift)[
            #align(right)[
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
      meander.placed(
        left + placement,
      )[
        #box(height: h, width: projets.data.page.width)[
          #place(dx: -projets.data.page.margin.left + x_margin, dy: shift)[
            #align(left)[
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

////////////////////////////////////////////////////////////////////////////////
///// Centred
////////////////////////////////////////////////////////////////////////////////


// Créer un image parfaitemen centré entre les deux page.
#let centred(page:0,height:50%, over-marge:false, placement: bottom, content) = {
  let h = get_h(height, over-marge: over-marge)

  let (y_margin, shift) = if over-marge {
    if placement == bottom {
      (projets.data.page.margin.bottom, 0pt)
    } else if tpp.placement == top {
      (projets.data.page.margin.top, -projets.data.page.margin.top)
    }
  } else {
    if placement == bottom {
      (emarge-soft.bottom, 0pt)
    } else if placement == top {
      (emarge-soft.top, -emarge-soft.top)
    }
  }

  let odd-image() = {
      meander.placed(
          left + placement,
          dx: -50%,
          boundary: meander.contour.margin(3mm)
      )[
        #box(
          height: h + shift,
          width: projets.data.page.width - projets.data.page.margin.right - projets.data.page.margin.left,
          place(dx: 0pt, dy: shift, align(
            right,
            box(stroke: 0pt, width: projets.data.page.width, height: h, align(center + horizon, content)),
          )),
        )
      ]
  }
    let even-image() = {
      meander.placed(
          right + placement,
          dx: 50%,
          boundary:
          meander.contour.margin(3mm)
      )[
        #box(
          height: h + shift,
          width: projets.data.page.width - projets.data.page.margin.right - projets.data.page.margin.left,
          place(dx: 0pt, dy: shift, align(
            left,
            box(stroke: 0pt, width: projets.data.page.width, height: h, align(horizon + center, content)),
          )),
        )
      ]
    }

    ((type:"two-page-image", page1:page, page2:page+1, odd-image:odd-image, even-image:even-image,layout: none,),)
}



////////////////////////////////////////////////////////////////////////////////
///// x/3
////////////////////////////////////////////////////////////////////////////////


// Créer un image qui s’étend sur les 2/3 des deux pages.
#let left-2-3(page: 0, placement :top, height:50%, over-marge: false,full-page:false, content) = {
    
    let h = get_h(height, over-marge: over-marge, full-page: full-page)

  let (y_margin, shift, x_margin) = if over-marge {
    if placement == bottom {
      (projets.data.page.margin.bottom, -projets.data.page.margin.top, projets.data.page.margin.right - side-marge)
    } else if placement == top {
      (projets.data.page.margin.top, -projets.data.page.margin.top, 0pt)
    }
  } else {
    if placement == bottom {
      (emarge-soft.bottom, -emarge-soft.top, emarge-soft.right)
    } else if placement == top {
      (emarge-soft.top, -emarge-soft.top, emarge-soft.right)
    } else {
      (0pt, 0pt, 0pt)
    }
  }

    let w = projets.data.page.width*4/3 - emarge-full.right// + projets.data.page.margin.left + projets.data.page.margin.right

  let odd-image() = {
    meander.placed(
      right + placement,
        dx: -69%- emarge-full.right,
        boundary: meander.contour.margin(3mm)
    )[
      #v(shift)
      #align(right)[
        #box(
          width: w,
          height: h,
          align(center + horizon, content),
        )
      ]
    ]
  }
  
  let even-image() = {
    meander.placed(
        right + placement,
        dx: 0% ,
        boundary: meander.contour.margin(3mm)
                )[
                   #v(shift)
                    #box(height: h,width: w,place(top+right,dx: - emarge-soft.right,
                        box(align(left)[ 
                    #box(
                      width:w,
                      height: h,
                      align(center + horizon, content),
                    )
                  ]
                    )
                    )
                    )
                ]
  }
    ((type: "two-page-image", page1: page, page2: page + 1, odd-image: odd-image, even-image: even-image, layout: 
    (
        name: "2/3",
        layout: layout-2-3,
      ),
    ),)
}

// Créer un image qui s’étend sur les 2/3 des deux pages et qui occupe plus la page de droite.
#let right-2-3(
    page: 0,
    placement :top,
    height:50%,
    over-marge: false,
    full-page:false,
    content) = {
        if full-page{
            height = 100%
            placement = top
        }
        
        let h = get_h(height, over-marge: over-marge, full-page: full-page)
        
        let (y_margin, shift, x_margin) = if over-marge {
            if placement == bottom {
                (
                    projets.data.page.margin.bottom, 0pt,
                    projets.data.page.margin.right - side-marge
                )
            } else if placement == top {
                (projets.data.page.margin.top, -projets.data.page.margin.top, 0pt)
            }
        } else {
            if placement == bottom {
                (emarge-soft.bottom, 0pt, emarge-soft.right)
            } else if placement == top {
                (emarge-soft.top, -emarge-soft.top, emarge-soft.right)
            } else {
                (0pt, 0pt, 0pt)
            }
        }
        
        let w = projets.data.page.width * 4 / 3 - emarge-full.right
        
        let odd-image() = {
            meander.placed(
                right + placement,
                boundary: meander.contour.margin(3mm),
            )[
                #box(
                    height: h - y_margin,
                    width: w,
                    place(top + left, dy:shift,  dx: -35.7% + emarge-full.right + 0.28pt, box(align(right)[
                        #box(
                            width: w,
                            height: h,
                            align(center + horizon, content),
                        )
                    ])),
                )
            ]
        }
        let even-image() = {
            meander.placed(
                right + placement,
                dx: 62% * w - emarge-full.right - emarge-full.left,
                boundary: meander.contour.margin(3mm),
            )[
                #box(height: h - y_margin , width: w, place(
                    top + right,
                    dy:shift,
                    box(align(left)[
                        #box(
                            width: w,
                            height: h,
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

// Créer un image centré qui s’étend sur le 1/3 des deux pages et qui occupe plus la page de gauche.
#let left-1-3(page: 0, over-marge: false,full-page:false, content) = {
    let height = 100%
    let placement = top
    let h = get_h(height, over-marge: over-marge, full-page: full-page)
    
    let (y_margin, shift, x_margin) = if over-marge {
        if placement == bottom {
            (projets.data.page.margin.bottom, -projets.data.page.margin.top, projets.data.page.margin.right - side-marge)
        } else if placement == top {
            (projets.data.page.margin.top, -projets.data.page.margin.top, 0pt)
        }
    } else {
        if placement == bottom {
            (emarge-soft.bottom, -emarge-soft.top, emarge-soft.right)
        } else if placement == top {
            (emarge-soft.top, -emarge-soft.top, emarge-soft.right)
        } else {
            (0pt, 0pt, 0pt)
        }
    }
    
    let w = projets.data.page.width / 2 + projets.data.page.margin.left + projets.data.page.margin.right

    let odd-image() = {
        meander.placed(
            right + placement,
            dx: -100% + projets.data.page.margin.left,
            boundary: meander.contour.margin(3mm)
        )[
            #v(shift)
            #align(left)[
                #box(
                    width: w,
                    height: h,
                    align(center + horizon, content),
                )
            ]
        ]
    }
    
    let even-image() = {
        meander.placed(
            right + placement,
            dx: projets.data.page.margin.left * 2 + projets.data.page.margin.right,
            boundary: meander.contour.margin(3mm)
        )[
            #v(shift)
            #align(left)[ 
                #box(
                    width:w,
                    height: h,
                    align(center + horizon, content),
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
            layout:(
                name: "1/3",
                layout: layout-1-3,
            ),
        ),
    )
}

//// 1-3 right /////////////////////////////////////////////////////////////////


// Créer un image centré qui s’étend sur le 1/3 des deux pages et qui occupe plus la page de droite.
#let right-1-3(
    page: 0,
    over-marge: false,
    full-page:false,
    content) = {
        let height = 100%
        let placement = top
        let h = get_h(height, over-marge: over-marge, full-page: full-page)
        
        let (y_margin, shift, x_margin) = if over-marge {
            if placement == bottom {
                (projets.data.page.margin.bottom, -projets.data.page.margin.top, projets.data.page.margin.right - side-marge)
            } else if placement == top {
                (projets.data.page.margin.top, -projets.data.page.margin.top, 0pt)
            }
        } else {
            if placement == bottom {
                (emarge-soft.bottom, -emarge-soft.top, emarge-soft.right)
            } else if placement == top {
                (emarge-soft.top, -emarge-soft.top, emarge-soft.right)
            } else {
                (0pt, 0pt, 0pt)
            }
        }
        
        let w = projets.data.page.width / 2 + projets.data.page.margin.left + projets.data.page.margin.right
        
        let odd-image() = {
            meander.placed(
                right + placement,
                dx: -50%,
                boundary: meander.contour.margin(3mm),
            )[
                #v(shift)
                #align(left)[
                    #box(width: w, height: h, content)
                ]
            ]
        }
        
        let even-image() = {
            meander.placed(
                right + placement,
                dx: 50% + projets.data.page.margin.left + projets.data.page.margin.right,
                boundary: meander.contour.margin(3mm),
            )[
                #v(shift)
                #align(left)[
                    #box(
                        width: w,
                        height: h,
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
    
////////////////////////////////////////////////////////////////////////////////
///// x/4
////////////////////////////////////////////////////////////////////////////////

// Créer un image centré qui s’étend sur les 3/4 des deux pages et qui occupe plus la page de gauche.
#let left-3-4(
    page:0,
    height:50%,
    over-marge:false,
    placement: bottom,
    content) = {

    let h = get_h(height,over-marge: over-marge)

    let (y_margin, shift, x_margin) = if over-marge {
      if placement == bottom {
        (projets.data.page.margin.bottom, 0pt, emarge-soft.right )
      } else if placement == top {
        (projets.data.page.margin.top, -projets.data.page.margin.top, emarge-soft.right )
      }
    } else {
      if placement == bottom {
        (emarge-soft.bottom, 0pt, emarge-soft.right)
      } else if placement == top {
        (emarge-soft.top, -emarge-soft.top, emarge-soft.right)
      }
    }

    let w = (
        projets.data.page.width
        - projets.data.page.margin.left
        + projets.data.page.width / 2
        + x_margin
    )

    let odd-image() = {
        meander.placed(
          right + placement,
          dx: -50%,
          boundary: meander.contour.margin(1mm)
        )[
          #box(
            height: h,
            width: projets.data.page.width,
            place(
              dx: -projets.data.page.margin.right - projets.data.page.margin.left,
              dy: shift,
              align(right)[
                #box(
                  width: w,
                  height: h + y_margin,
                  align(center + horizon, content),
                )
              ],
            ),
          )
        ]
      }

    let even-image() = {
        meander.placed(
          right + placement,
            boundary: meander.contour.margin(3mm)
        )[
          #box(
            height: h,
            width: projets.data.page.width,
            place(
              dx: -x_margin,
              dy: shift,
              align(left)[
                #box(
                  width: w,
                  height: h + y_margin,
                  align(center + horizon, content),
                )
              ],
            ),
          )
        ]
      }

    ((type:"two-page-image", page1:page, page2:page+1, odd-image:odd-image, even-image:even-image,layout:none),)
}

//// 3/4-right /////////////////////////////////////////////////////////////////

// Créer un image centré qui s’étend sur les 3/4 des deux pages et qui occupe plus la page de droite.
#let right-3-4(
    page: 0,
    height: 50%,
    over-marge: false,
    placement: bottom,
    content) = {
  let h = get_h(height, over-marge: over-marge)
  
  let (y_margin, shift, x_margin) = if over-marge {
    if placement == bottom {
      (projets.data.page.margin.bottom, 0pt, projets.data.page.margin.right - side-marge)
    } else if placement == top {
      (projets.data.page.margin.top, -projets.data.page.margin.top, projets.data.page.margin.right - side-marge)
    }
  } else {
    if placement == bottom {
      (emarge-soft.bottom, 0pt, emarge-soft.right)
    } else if placement == top {
      (emarge-soft.top, -emarge-soft.top, emarge-soft.right)
    }
  }
  
  let w = projets.data.page.width - projets.data.page.margin.left + projets.data.page.width / 2 + x_margin
  
  
  let odd-image() = {
    meander.placed(
      right + placement,
        boundary: meander.contour.margin(3mm)
    )[
      #box(
        height: h,
        width: projets.data.page.width,
        place(
          dx: -projets.data.page.margin.left - projets.data.page.margin.right + x_margin,
          dy: shift,
          align(right)[
            #box(
              width: w,
              height: h + y_margin,
              clip: true,
              
              align(center + horizon, content),
            )
          ],
        ),
      )
    ]
  }
  let even-image() = {
    meander.placed(
      right + placement,
      dx: 50%,
        boundary: meander.contour.margin(3mm)
    )[
      #box(
        height: h,
        width: projets.data.page.width,
        place(
          dx: 0pt,
          dy: shift,
          align(left)[
            #box(
              width: w,
              height: h + y_margin,
              clip: true,
              align(center + horizon, content),
            )
          ],
        ),
      )
    ]
  }
  ((type: "two-page-image", page1: page, page2: page + 1, odd-image: odd-image, even-image: even-image, layout:none),)
}

//// 1/4 ///////////////////////////////////////////////////////////////////////

// Créer un image centré qui s’étend sur les 1/4 des deux pages soit 1/2 de la page.
#let i1-4(
    page: 0,
    height:100%,
    placement:top,
    even:true,
    over-marge: false,
    full-page:false,
    content) = {
    if full-page{
        over-marge = true
        height = 100%
        placement = top
    }
    let h = get_h(height, over-marge: over-marge, full-page: full-page)

  let (y_margin, shift, x_margin) = if over-marge {
    if placement == bottom {
      (projets.data.page.margin.bottom, -projets.data.page.margin.top, projets.data.page.margin.right - side-marge)
    } else if placement == top {
      (projets.data.page.margin.top, -projets.data.page.margin.top, 0pt)
    }
  } else {
    if placement == bottom {
      (-emarge-soft.bottom, 0pt, emarge-soft.right)
    } else if placement == top {
      (-emarge-soft.top, -emarge-soft.top, emarge-soft.right)
    } else {
      (0pt, 0pt, 0pt)
    }
  }

    let w = ((projets.data.page.width - side-marge)/ 2 )-side-marge
    
  let picture() = {
      if even {
            meander.placed(
          left + placement,
            dx: -projets.data.page.margin.right + side-marge,
                boundary: meander.contour.margin(5mm),

        )[
          #box(
            height: h + y_margin,
            width: w,
            place(
              dx: 0pt,
              dy:   shift,
            align(left)[
                #box(
                    width: w,
                    height: h,
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
            dx:projets.data.page.margin.right - side-marge,
                boundary: meander.contour.margin(3mm)
        )[
          #box(
            height: h + y_margin,
            width: w,
            place(
              dx: 0pt,
              dy: shift,
            align(left)[
                #box(
                    width: w,
                    height: h,
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
